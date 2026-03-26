# syntax=docker/dockerfile:1.7

# 使用 PHP 8.4 基础镜像，满足 Laravel 13 的运行要求
FROM php:8.4-fpm-bullseye

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_CACHE_DIR=/tmp/composer-cache

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
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# 先复制依赖清单，避免源码改动打穿 Composer 缓存层
COPY composer.json composer.lock ./

# 只在依赖变化时重装 vendor，同时复用 Composer 下载缓存
RUN --mount=type=cache,target=/tmp/composer-cache \
    composer install --no-dev --optimize-autoloader --prefer-dist --no-interaction --no-scripts

# 再复制项目文件，后续源码改动不会触发依赖重装
COPY . .

# 依赖已就绪后再生成自动加载，Composer 会顺带触发 Laravel 包发现
RUN composer dump-autoload --optimize --no-dev --no-interaction

# 设置权限
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/storage \
    && chmod -R 777 /var/www/html/bootstrap/cache \
    && chmod +x /var/www/html/init.sh

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
