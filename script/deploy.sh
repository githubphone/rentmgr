#!/bin/bash

###############################################################################
# deploy.sh - 部署脚本
# 功能:
#   1. 本地编译Java后端代码
#   2. 本地编译Vue前端代码
#   3. 复制编译产物到docker目录
#   4. 通过SSH传输到服务器
###############################################################################

set -e  # 遇到错误立即退出

##################### 配置区域 #######################

# 项目根目录(自动获取)
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${PROJECT_ROOT}"

# 服务器配置(根据实际情况修改)
#SERVER_HOST="root@192.168.64.11"     
SERVER_HOST="spark@120.238.132.242"           # 服务器地址,例如: user@192.168.1.100
SERVER_DEPLOY_DIR="~/rentmgr"  # 服务器部署目录
SSH_KEY=""                  # SSH密钥路径,如果使用密钥认证
SSH_PORT="43839"               # SSH端口
#SSH_PORT="22"

# Java配置
JAVA_MODULE="ruoyi-admin"
JAR_NAME="ruoyi-admin.jar"

# 前端配置
FRONTEND_DIR="ruoyi-ui"
BUILD_MODE="prod"           # 构建模式: prod/stage

# Docker目录配置
DOCKER_DIR="docker"
BACKEND_TARGET_DIR="${DOCKER_DIR}/backend"
FRONTEND_TARGET_DIR="${DOCKER_DIR}/frontend"

# 日志颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

##################### 工具函数 #####################

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_command() {
    if ! command -v $1 &> /dev/null; then
        log_error "$1 未安装,请先安装 $1"
        exit 1
    fi
}

##################### 检查依赖 #####################

check_dependencies() {
    log_info "检查依赖..."
    check_command java
    check_command mvn
    check_command npm
    check_command ssh
    check_command scp

    if [ ! -d "${PROJECT_ROOT}/${FRONTEND_DIR}" ]; then
        log_error "前端目录不存在: ${FRONTEND_DIR}"
        exit 1
    fi

    if [ ! -d "${PROJECT_ROOT}/${DOCKER_DIR}" ]; then
        log_error "Docker目录不存在: ${DOCKER_DIR}"
        exit 1
    fi

    log_info "依赖检查通过"
}

##################### 编译Java后端 #####################

build_backend() {
    log_info "开始编译Java后端代码..." >&2

    if [ ! -f "${PROJECT_ROOT}/pom.xml" ]; then
        log_error "未找到pom.xml文件"
        exit 1
    fi

    cd "${PROJECT_ROOT}"
    MAVEN_OPTS="-Dstyle.color=never" mvn clean package -DskipTests --no-transfer-progress >/dev/tty 2>&1

    # 查找编译后的jar文件
    JAR_FILE=$(find "${PROJECT_ROOT}/${JAVA_MODULE}/target" -name "${JAR_NAME}" -o -name "ruoyi-admin.jar" 2>/dev/null | head -1)

    if [ -z "${JAR_FILE}" ]; then
        log_error "未找到编译后的jar文件"
        log_error "请检查编译是否成功"
        exit 1
    fi

    echo "${JAR_FILE}"
}

##################### 编译Vue前端 #####################

build_frontend() {
    log_info "开始编译Vue前端代码..."

    cd "${PROJECT_ROOT}/${FRONTEND_DIR}"

    # 检查node_modules是否存在
    if [ ! -d "node_modules" ]; then
        log_info "检测到node_modules不存在,正在安装依赖..."
        npm install
    fi

    # 根据模式构建
    if [ "${BUILD_MODE}" = "prod" ]; then
        npm run build:prod
    elif [ "${BUILD_MODE}" = "stage" ]; then
        npm run build:stage
    else
        log_error "不支持的构建模式: ${BUILD_MODE}"
        exit 1
    fi

    # 检查dist目录
    if [ ! -d "dist" ]; then
        log_error "前端构建失败,未找到dist目录"
        exit 1
    fi

    log_info "前端编译完成"
}

##################### 复制到Docker目录 #####################

copy_to_docker() {
    local jar_file=$1

    log_info "复制编译产物到Docker目录..."

    # 创建目标目录
    mkdir -p "${PROJECT_ROOT}/${BACKEND_TARGET_DIR}"
    mkdir -p "${PROJECT_ROOT}/${FRONTEND_TARGET_DIR}"

    # 复制后端jar包
    log_info "复制后端jar包..."
    cp "${jar_file}" "${PROJECT_ROOT}/${BACKEND_TARGET_DIR}/ruoyi-admin.jar"

    # 复制配置文件(可选)
    if [ -f "${PROJECT_ROOT}/${JAVA_MODULE}/src/main/resources/application.yml" ]; then
        cp "${PROJECT_ROOT}/${JAVA_MODULE}/src/main/resources/application.yml" \
           "${PROJECT_ROOT}/${BACKEND_TARGET_DIR}/"
        cp "${PROJECT_ROOT}/${JAVA_MODULE}/src/main/resources/application-local.yml" \
           "${PROJECT_ROOT}/${BACKEND_TARGET_DIR}/" 2>/dev/null || true
        cp "${PROJECT_ROOT}/${JAVA_MODULE}/src/main/resources/application-druid.yml" \
           "${PROJECT_ROOT}/${BACKEND_TARGET_DIR}/" 2>/dev/null || true
    fi

    # 复制前端dist目录
    log_info "复制前端dist目录..."
    rm -rf "${PROJECT_ROOT}/${FRONTEND_TARGET_DIR}/dist"
    cp -r "${PROJECT_ROOT}/${FRONTEND_DIR}/dist" "${PROJECT_ROOT}/${FRONTEND_TARGET_DIR}/"

    # 生成nginx配置(如果不存在)
    if [ ! -f "${PROJECT_ROOT}/${FRONTEND_TARGET_DIR}/nginx.conf" ]; then
        log_info "生成默认nginx配置..."
        cat > "${PROJECT_ROOT}/${FRONTEND_TARGET_DIR}/nginx.conf" << 'EOF'
worker_processes  auto;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    tcp_nopush      on;
    tcp_nodelay     on;
    keepalive_timeout  65;
    types_hash_max_size 2048;

    gzip  on;
    gzip_disable "msie6";

    server {
        listen       80;
        server_name  localhost;

        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
            try_files $uri $uri/ /index.html;
        }

        # 代理后端API
        location /prod-api/ {
            proxy_pass http://server:48080/;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }
    }
}
EOF
    fi

    log_info "复制完成"
}

##################### SSH传输到服务器 #####################

deploy_to_server() {
    if [ -z "${SERVER_HOST}" ]; then
        log_warn "未配置服务器信息,跳过SSH传输"
        log_warn "请修改脚本中的SERVER_HOST变量"
        return 0
    fi

    log_info "开始传输到服务器 ${SERVER_HOST}..."

    # 构建SSH命令基础部分
    SSH_BASE_CMD="ssh -p ${SSH_PORT}"
    SCP_BASE_CMD="scp -P ${SSH_PORT}"
    SSH_CMD="ssh -p ${SSH_PORT}"
    SCP_CMD="scp -P ${SSH_PORT}"

    if [ -n "${SSH_KEY}" ]; then
        SSH_BASE_CMD="${SSH_BASE_CMD} -i ${SSH_KEY}"
        SCP_BASE_CMD="${SCP_BASE_CMD} -i ${SSH_KEY}"
    fi
    SSH_CMD="${SSH_CMD} ${SERVER_HOST}"
    SCP_CMD="${SCP_CMD} ${SERVER_HOST}"

    # 创建SSH连接 socket 目录
    SSH_SOCKET_DIR="${HOME}/.ssh/deploy-sockets"
    mkdir -p "${SSH_SOCKET_DIR}"
    SSH_SOCKET="${SSH_SOCKET_DIR}/deploy-${SERVER_HOST//@/-}-${SSH_PORT}"

    # 使用ControlMaster复用连接,只输入一次密码
    # -S 参数指定socket文件,更简洁
    export SSH_CMD="-S ${SSH_SOCKET}"
    export SSH_BASE_CMD SCP_BASE_CMD SERVER_DEPLOY_DIR SSH_SOCKET

    # 检查服务器连接(首次会要求输入密码,后续复用)
    if ! ${SSH_BASE_CMD} -o ControlMaster=auto -o ControlPath="${SSH_SOCKET}" -o ControlPersist=300 -o StrictHostKeyChecking=no ${SERVER_HOST} "echo 'Connection successful'" > /dev/null 2>&1; then
        log_error "无法连接到服务器 ${SERVER_HOST}"
        log_error "请检查:"
        log_error "  1. 服务器地址是否正确"
        log_error "  2. SSH密钥或密码认证是否配置"
        log_error "  3. 网络连接是否正常"
        rm -f "${SSH_SOCKET}"
        exit 1
    fi

    log_info "已建立SSH连接"

    # 检查服务器部署目录是否存在
    if ${SSH_BASE_CMD} ${SSH_CMD} ${SERVER_HOST} "test -d ${SERVER_DEPLOY_DIR}" 2>/dev/null; then
        # 停止docker compose服务并删除旧文件
        log_info "停止docker compose服务..."
        ${SSH_BASE_CMD} ${SSH_CMD} ${SERVER_HOST} "cd ${SERVER_DEPLOY_DIR} && docker compose down"

        # 删除旧的前端文件，保留后端logs目录
        log_info "删除旧的前端文件..."
        ${SSH_BASE_CMD} ${SSH_CMD} ${SERVER_HOST} "cd ${SERVER_DEPLOY_DIR}/backend && rm -rf *.jar *.yml *.properties *.xml 2>/dev/null; cd ${SERVER_DEPLOY_DIR} && rm -rf frontend/*"
    else
        log_info "服务器部署目录不存在,跳过停止服务和删除旧文件步骤"
    fi

    # 创建服务器目录
    log_info "创建服务器部署目录..."
    ${SSH_BASE_CMD} ${SSH_CMD} ${SERVER_HOST} "mkdir -p ${SERVER_DEPLOY_DIR}/{backend,frontend,data/{polardb,redis}}"

    # 复制docker-compose.yml
    log_info "上传docker-compose.yml..."
    ${SCP_BASE_CMD} -o ControlMaster=auto -o ControlPath="${SSH_SOCKET}" \
        "${PROJECT_ROOT}/${DOCKER_DIR}/docker-compose.yml" \
        "${SERVER_HOST}:${SERVER_DEPLOY_DIR}/"

    # 复制后端文件
    log_info "上传后端文件..."
    ${SCP_BASE_CMD} -o ControlMaster=auto -o ControlPath="${SSH_SOCKET}" -r \
        "${PROJECT_ROOT}/${DOCKER_DIR}/backend/"* \
        "${SERVER_HOST}:${SERVER_DEPLOY_DIR}/backend/"

    # 复制前端文件
    log_info "上传前端文件..."
    ${SCP_BASE_CMD} -o ControlMaster=auto -o ControlPath="${SSH_SOCKET}" -r \
        "${PROJECT_ROOT}/${DOCKER_DIR}/frontend/"* \
        "${SERVER_HOST}:${SERVER_DEPLOY_DIR}/frontend/"

    # 复制docker.env(如果存在)
    if [ -f "${PROJECT_ROOT}/${DOCKER_DIR}/docker.env" ]; then
        log_info "上传docker.env..."
        ${SCP_BASE_CMD} -o ControlMaster=auto -o ControlPath="${SSH_SOCKET}" \
            "${PROJECT_ROOT}/${DOCKER_DIR}/docker.env" \
            "${SERVER_HOST}:${SERVER_DEPLOY_DIR}/"
    fi

    # 启动基础服务(数据库和Redis)
    log_info "启动基础服务(数据库和Redis)..."
    ${SSH_BASE_CMD} ${SSH_CMD} ${SERVER_HOST} "cd ${SERVER_DEPLOY_DIR} && docker compose up -d polardb redis"

    # 启动后端和前端服务
    log_info "启动后端和前端服务..."
    ${SSH_BASE_CMD} ${SSH_CMD} ${SERVER_HOST} "cd ${SERVER_DEPLOY_DIR} && docker compose up -d server admin"

    # 清理本地上传的前端和后端编译产物
    log_info "清理本地上传文件..."
    rm -f "${PROJECT_ROOT}/${BACKEND_TARGET_DIR}/ruoyi-admin.jar"
    rm -rf "${PROJECT_ROOT}/${FRONTEND_TARGET_DIR}/dist"

    # 关闭SSH连接
    ${SSH_BASE_CMD} -o ControlPath="${SSH_SOCKET}" -O exit ${SERVER_HOST} 2>/dev/null || true
    rm -f "${SSH_SOCKET}"

    log_info "传输完成"
}

##################### 清理函数 #####################

cleanup() {
    log_info "清理临时文件..."
    # 可选: 删除target目录
    # rm -rf "${PROJECT_ROOT}/*/target"
}

##################### 主函数 #######################

main() {
    log_info "======================================"
    log_info "开始部署流程"
    log_info "======================================"

    # 检查依赖
    check_dependencies

    # 编译后端
    JAR_FILE=$(build_backend)
    log_info "后端编译完成: ${JAR_FILE}"

    # 编译前端
    build_frontend

    # 复制到Docker目录
    copy_to_docker "${JAR_FILE}"

    # SSH传输到服务器
    deploy_to_server

    # 清理
    cleanup

    log_info "======================================"
    log_info "部署完成!"
    log_info "======================================"

    if [ -n "${SERVER_HOST}" ]; then
        log_info "服务已自动启动:"
        log_info "  - PostgreSQL 数据库 (容器: ruoyi-polardb)"
        log_info "  - Redis 缓存 (容器: ruoyi-redis)"
        log_info "  - 后端服务 (容器: ruoyi-server)"
        log_info "  - 前端服务 (容器: ruoyi-admin)"
        log_info ""
        log_info "访问地址:"
        log_info "  前端: http://${SERVER_HOST}"
        log_info "  后端API: http://${SERVER_HOST}/prod-api/"
        log_info ""
        log_info "查看日志: docker exec -it ruoyi-server tail -f /app/logs/ruoyi.log"
    else
        log_info "Docker目录已准备好:"
        log_info "  后端: ${PROJECT_ROOT}/${BACKEND_TARGET_DIR}"
        log_info "  前端: ${PROJECT_ROOT}/${FRONTEND_TARGET_DIR}"
        log_info "  启动命令: cd ${PROJECT_ROOT}/${DOCKER_DIR} && docker compose up -d"
    fi
}

# 执行主函数
main "$@"
