#!/bin/bash

# 等待一下确保所有服务准备就绪
sleep 2

# 切换到项目目录
cd /var/www/html

# 检查 .env 文件是否存在，如果不存在则运行初始化脚本
if [ ! -f ".env" ]; then
    echo "检测到首次运行，正在执行初始化..."
    # 使用默认域名运行初始化脚本
    ./init.sh demo.owladmin.com
else
    echo ".env 文件已存在，跳过初始化"
fi

# 确保存储目录权限正确
chown -R www-data:www-data storage
chown -R www-data:www-data bootstrap/cache
chmod -R 775 storage
chmod -R 775 bootstrap/cache

# 确保数据库目录权限正确
chown -R www-data:www-data database
chmod 755 database

# 如果数据库文件存在，确保权限正确
if [ -f "database/database.sqlite" ]; then
    chown www-data:www-data database/database.sqlite
    chmod 777 database/database.sqlite
fi

# 清理和缓存配置
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan cache:clear

# 启动 Supervisor
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
