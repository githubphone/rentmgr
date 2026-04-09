#!/bin/bash
# PolarDB 初始化脚本
# 在容器启动时自动执行

set -e

echo "======================================"
echo "PolarDB 初始化脚本"
echo "======================================"

# 等待主节点启动
echo "等待主节点启动..."
for i in {1..30}; do
    if pg_isready -h localhost -p 5433 -U postgres &> /dev/null; then
        echo "主节点已就绪"
        break
    fi
    echo "等待中... ($i/30)"
    sleep 2
done

# 连接到主节点并设置
echo ""
echo "连接到主节点 (端口 5433)..."

# 设置密码
echo "设置密码..."
psql -h localhost -p 5433 -U postgres << SQL_EOF
ALTER USER postgres PASSWORD '123456';
CREATE DATABASE IF NOT EXISTS "ruoyi-vue-pro";
\l
SQL_EOF

echo ""
echo "======================================"
echo "初始化完成"
echo "======================================"
