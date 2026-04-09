#!/bin/bash
# GitHub Codespaces 部署脚本

echo "🚀 开始部署 RentMgr 项目..."

# 检查环境
echo "📋 检查环境..."
java -version
node --version
mvn --version

# 后端构建
echo "🔧 构建后端..."
cd ruoyi-admin
mvn clean package -DskipTests -q

# 前端构建
echo "🎨 构建前端..."
cd ../ruoyi-ui
npm install
npm run build

echo "✅ 构建完成！"
echo "🌐 前端文件在: ruoyi-ui/dist/"
echo "🔧 后端JAR在: ruoyi-admin/target/"

# 启动服务
echo "🏃 启动服务..."
cd ../ruoyi-admin
echo "启动后端服务 (端口 8080)..."
mvn spring-boot:run &
BACKEND_PID=$!

cd ../ruoyi-ui
echo "启动前端服务 (端口 3000)..."
npm run dev &
FRONTEND_PID=$!

echo "🎉 服务启动完成！"
echo "📱 前端: http://localhost:3000"
echo "🔌 后端: http://localhost:8080"
echo ""
echo "按 Ctrl+C 停止服务"

# 等待用户中断
trap "echo '🛑 停止服务...'; kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait