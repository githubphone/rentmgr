#!/bin/bash

#===============================================
# 出租屋管理系统 - 开发环境启动脚本
# 用于同时启动后端Java和前端Vue开发服务器
#===============================================

set -e

# 定义颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 项目根目录
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BACKEND_DIR="$PROJECT_ROOT/ruoyi-admin"
FRONTEND_DIR="$PROJECT_ROOT/ruoyi-ui"

# 端口配置
BACKEND_PORT=8080
FRONTEND_PORT=8088

# 输出带颜色的信息
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 停止之前的进程
stop_previous() {
    info "正在停止之前的进程..."

    # 停止Java后端进程 (包含 RuoYiApplication 或 spring-boot)
    JAVA_PIDS=$(ps aux | grep -E "java.*ruoyi|RuoYiApplication|spring-boot" | grep -v grep | awk '{print $2}')
    if [ -n "$JAVA_PIDS" ]; then
        warn "停止Java后端进程: $JAVA_PIDS"
        echo $JAVA_PIDS | xargs kill -9 2>/dev/null || true
    fi

    # 停止占用后端端口的进程
    BACKEND_PID=$(lsof -ti:$BACKEND_PORT 2>/dev/null || true)
    if [ -n "$BACKEND_PID" ]; then
        warn "停止占用端口 $BACKEND_PORT 的进程: $BACKEND_PID"
        kill -9 $BACKEND_PID 2>/dev/null || true
    fi

    # 停止Node前端进程 (vite)
    NODE_PIDS=$(ps aux | grep -E "node.*vite|vite" | grep -v grep | awk '{print $2}')
    if [ -n "$NODE_PIDS" ]; then
        warn "停止Node前端进程: $NODE_PIDS"
        echo $NODE_PIDS | xargs kill -9 2>/dev/null || true
    fi

    # 停止占用前端端口的进程
    FRONTEND_PID=$(lsof -ti:$FRONTEND_PORT 2>/dev/null || true)
    if [ -n "$FRONTEND_PID" ]; then
        warn "停止占用端口 $FRONTEND_PORT 的进程: $FRONTEND_PID"
        kill -9 $FRONTEND_PID 2>/dev/null || true
    fi

    # 等待进程完全停止
    sleep 2

    info "进程清理完成"
}

# 检查环境
check_environment() {
    info "检查运行环境..."

    # 检查Java
    if ! command -v java &> /dev/null; then
        error "Java 未安装，请先安装 JDK"
        exit 1
    fi
    info "Java 版本: $(java -version 2>&1 | head -1)"

    # 检查Maven
    if ! command -v mvn &> /dev/null; then
        error "Maven 未安装，请先安装 Maven"
        exit 1
    fi
    info "Maven 版本: $(mvn -version 2>&1 | head -1)"

    # 检查Node
    if ! command -v node &> /dev/null; then
        error "Node.js 未安装，请先安装"
        exit 1
    fi
    info "Node 版本: $(node -v)"

    # 检查pnpm
    if ! command -v pnpm &> /dev/null; then
        warn "pnpm 未安装，正在安装..."
        npm install -g pnpm
    fi
    info "pnpm 版本: $(pnpm -v)"
}

# 编译后端
compile_backend() {
    info "编译后端项目..."

    cd "$BACKEND_DIR"

    if mvn clean package -DskipTests -q; then
        info "后端编译成功!"
    else
        error "后端编译失败，请查看日志"
        exit 1
    fi
}

# 编译前端
compile_frontend() {
    info "编译前端项目..."

    cd "$FRONTEND_DIR"

    if [ ! -d "node_modules" ]; then
        info "安装前端依赖..."
        pnpm install
    fi

    if pnpm build:prod; then
        info "前端编译成功!"
    else
        error "前端编译失败，请查看日志"
        exit 1
    fi
}

# 启动后端
start_backend() {
    info "启动后端服务 (端口: $BACKEND_PORT)..."

    cd "$BACKEND_DIR"

    # 使用Maven启动Spring Boot应用
    nohup mvn spring-boot:run -Dspring-boot.run.fork=false > "$PROJECT_ROOT/logs/backend.log" 2>&1 &
    BACKEND_PID=$!

    info "后端服务启动中，PID: $BACKEND_PID"
    info "后端日志: $PROJECT_ROOT/logs/backend.log"

    # 等待后端启动
    info "等待后端服务启动..."
    for i in {1..60}; do
        if curl -s http://localhost:$BACKEND_PORT > /dev/null 2>&1; then
            info "后端服务启动成功!"
            return 0
        fi
        sleep 2
        echo -n "."
    done

    error "后端服务启动超时，请查看日志: $PROJECT_ROOT/logs/backend.log"
    return 1
}

# 启动前端
start_frontend() {
    info "启动前端服务 (端口: $FRONTEND_PORT)..."

    cd "$FRONTEND_DIR"

    # 设置环境变量
    export VITE_SERVER_PORT=$FRONTEND_PORT
    export VITE_API_BASE_URL=http://localhost:$BACKEND_PORT

    # 启动Vite开发服务器
    nohup pnpm dev > "$PROJECT_ROOT/logs/frontend.log" 2>&1 &
    FRONTEND_PID=$!

    info "前端服务启动中，PID: $FRONTEND_PID"
    info "前端日志: $PROJECT_ROOT/logs/frontend.log"

    # 等待前端启动
    info "等待前端服务启动..."
    for i in {1..30}; do
        if curl -s http://localhost:$FRONTEND_PORT > /dev/null 2>&1; then
            info "前端服务启动成功!"
            return 0
        fi
        sleep 2
        echo -n "."
    done

    warn "前端服务可能还在启动中，请查看日志"
    return 0
}

# 显示服务状态
show_status() {
    echo ""
    echo "=============================================="
    info "服务启动完成!"
    echo "=============================================="
    echo ""
    echo -e "  后端 API: ${GREEN}http://localhost:$BACKEND_PORT${NC}"
    echo -e "  前端页面: ${GREEN}http://localhost:$FRONTEND_PORT${NC}"
    echo ""
    echo -e "  后端日志: ${YELLOW}$PROJECT_ROOT/logs/backend.log${NC}"
    echo -e "  前端日志: ${YELLOW}$PROJECT_ROOT/logs/frontend.log${NC}"
    echo ""
    echo "=============================================="
    echo ""
    info "按 Ctrl+C 停止所有服务"
    echo ""
}

# 清理函数
cleanup() {
    echo ""
    warn "正在停止服务..."
    pkill -f "spring-boot:run" 2>/dev/null || true
    pkill -f "vite" 2>/dev/null || true
    info "服务已停止"
    exit 0
}

# 主流程
main() {
    # 创建日志目录
    mkdir -p "$PROJECT_ROOT/logs"

    # 注册清理函数
    trap cleanup SIGINT SIGTERM

    # 执行启动流程
    stop_previous
    check_environment
    compile_backend
    compile_frontend
    start_backend
    start_frontend
    show_status

    # 保持脚本运行
    tail -f "$PROJECT_ROOT/logs/backend.log" "$PROJECT_ROOT/logs/frontend.log" 2>/dev/null &
    wait
}

# 运行
main
