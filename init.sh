#!/bin/bash

# Laravel 项目初始化脚本
# 用法: ./init.sh [域名]

# 接收域名参数
DOMAIN=${1:-"demo.owladmin.com"}
echo "正在初始化项目，域名设置为: $DOMAIN"

# 检测 database/database.sqlite 文件是否存在, 存在则删除
if [ -f "database/database.sqlite" ]; then
    echo "检测到现有数据库文件，正在删除..."
    rm database/database.sqlite
    echo "数据库文件已删除"
fi

# 创建数据库文件
echo "正在创建新的数据库文件..."
touch database/database.sqlite
chmod 777 database/database.sqlite
echo "数据库文件创建完成"

# 复制 .env.example 到 .env
echo "正在复制环境配置文件..."
cp .env.example .env

# 更新 .env 文件中的 APP_URL
sed -i "s|APP_URL=http://localhost|APP_URL=https://$DOMAIN|g" .env
echo "环境配置文件复制完成，域名已设置为: $DOMAIN"

# 生成 key
echo "正在生成应用密钥..."
php artisan key:generate
echo "应用密钥生成完成"

# 迁移表
echo "正在运行数据库迁移..."
php artisan migrate --force
echo "数据库迁移完成"

# 填充数据
echo "正在填充初始数据..."
php artisan db:seed --force
echo "数据填充完成"

echo "项目初始化完成！"
echo "域名: $DOMAIN"
echo "数据库: database/database.sqlite"
echo "您现在可以访问应用程序了。"