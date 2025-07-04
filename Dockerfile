# 使用 Debian slim 基础镜像 - 在大小和兼容性之间平衡
FROM php:8.2-fpm-bullseye

# 设置工作目录
WORKDIR /var/www/html

# 一次性安装所有依赖、配置扩展并清理 - 减少镜像层数
RUN apt-get update && apt-get install -y --no-install-recommends \
    # 运行时依赖 (需要保留)
    nginx \
    supervisor \
    sqlite3 \
    libzip4 \
    libpng16-16 \
    libfreetype6 \
    libjpeg62-turbo \
    libonig5 \
    libxml2 \
    libsqlite3-0 \
    zip \
    unzip \
    # 构建依赖 (安装后删除)
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libsqlite3-dev \
    # 配置 GD 扩展
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    # 安装 PHP 扩展
    && docker-php-ext-install \
    pdo \
    pdo_sqlite \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd \
    zip \
    # 只删除构建依赖，保留运行时库
    && apt-get purge -y --auto-remove \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libsqlite3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 安装 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 复制项目文件
COPY . .

# 设置权限
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/storage \
    && chmod -R 777 /var/www/html/bootstrap/cache \
    && chmod +x /var/www/html/init.sh

# 安装 PHP 依赖
RUN composer install --no-dev --optimize-autoloader

# 复制 Nginx 配置
COPY docker/nginx.conf /etc/nginx/sites-available/default

# 复制 Supervisor 配置
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 复制启动脚本
COPY docker/start.sh /start.sh
RUN chmod +x /start.sh

# 暴露端口
EXPOSE 80

# 启动命令
CMD ["/start.sh"]
