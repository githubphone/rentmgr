@echo off
REM GitHub Codespaces 部署脚本 (Windows)

echo 🚀 开始部署 RentMgr 项目...

REM 检查环境
echo 📋 检查环境...
java -version
node --version
call mvn --version

REM 后端构建
echo 🔧 构建后端...
cd ruoyi-admin
call mvn clean package -DskipTests -q
cd ..

REM 前端构建
echo 🎨 构建前端...
cd ruoyi-ui
call npm install
call npm run build
cd ..

echo ✅ 构建完成！
echo 🌐 前端文件在: ruoyi-ui\dist\
echo 🔧 后端JAR在: ruoyi-admin\target\

REM 启动服务
echo 🏃 启动服务...

REM 启动后端 (新窗口)
echo 启动后端服务 (端口 8080)...
start "Backend Server" cmd /k "cd ruoyi-admin && mvn spring-boot:run"

REM 启动前端 (新窗口)
echo 启动前端服务 (端口 3000)...
start "Frontend Server" cmd /k "cd ruoyi-ui && npm run dev"

echo 🎉 服务启动完成！
echo 📱 前端: http://localhost:3000
echo 🔌 后端: http://localhost:8080
echo.
echo 关闭命令窗口来停止服务

pause