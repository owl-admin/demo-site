#!/bin/bash

# 设置错误处理
set -e
set -o pipefail

# 日志函数
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# 错误处理函数
handle_error() {
    log "错误: $1"
    exit 1
}

# 检查必要文件
check_requirements() {
    if [ ! -f .env ]; then
        handle_error ".env 文件不存在"
    fi
    
    if [ ! -f ./database.sql ]; then
        handle_error "database.sql 文件不存在"
    fi
}

# 恢复数据库 ==========================================================================================
restore_database() {
    log "开始恢复数据库..."
    
    DB_INI_FILE="database.ini"
    
    # 获取环境变量
    MYSQL_HOST=$(grep "DB_HOST" .env | awk -F '=' '{print $2}')
    MYSQL_USER=$(grep "DB_USERNAME" .env | awk -F '=' '{print $2}')
    MYSQL_PWD=$(grep "DB_PASSWORD" .env | awk -F '=' '{print $2}')
    
    # 验证环境变量
    if [ -z "$MYSQL_HOST" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PWD" ]; then
        handle_error "数据库配置信息不完整"
    fi
    
    # 创建临时的ini文件
    cat > "$DB_INI_FILE" << EOF
[client]
host = $MYSQL_HOST
user = $MYSQL_USER
password = $MYSQL_PWD
EOF
    
    chmod 600 "$DB_INI_FILE"
    
    # 执行数据库恢复
    if ! mysql --defaults-file="$DB_INI_FILE" < ./database.sql; then
        rm -f "$DB_INI_FILE"
        handle_error "数据库恢复失败"
    fi
    
    rm -f "$DB_INI_FILE"
    log "数据库恢复完成"
}

# 清理上传的文件 ==========================================================================================
clean_uploads() {
    log "开始清理上传文件..."
    
    # 检查目录是否存在
    if [ ! -d "./storage/app/public" ]; then
        handle_error "storage/app/public 目录不存在"
    fi
    
    # 删除目录内容
    rm -rf ./storage/app/public/*
    
    # 恢复 .gitignore 文件
    cat > ./storage/app/public/.gitignore << EOF
*
!.gitignore
EOF
    
    log "上传文件清理完成"
}

# 恢复代码文件 ==========================================================================================
restore_code() {
    log "开始恢复代码文件..."
    
    # 检查git状态
    if ! git status &> /dev/null; then
        handle_error "当前目录不是git仓库"
    fi
    
    # 获取当前分支
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [ -z "$CURRENT_BRANCH" ]; then
        handle_error "无法获取当前分支"
    fi
    
    log "当前分支: $CURRENT_BRANCH"
    
    # 清理所有本地更改
    log "清理本地更改..."
    
    # 丢弃所有未提交的更改
    git reset --hard HEAD || handle_error "重置本地更改失败"
    
    # 清理所有未跟踪的文件和目录
    git clean -fd || handle_error "清理未跟踪文件失败"
    
    # 如果有stash，清理所有stash
    if git stash list &> /dev/null; then
        git stash clear || handle_error "清理stash失败"
    fi
    
    # 获取远程最新代码
    log "获取远程最新代码..."
    git fetch --all --prune || handle_error "获取远程代码失败"
    
    # 重置到远程分支
    if git show-ref --verify --quiet "refs/remotes/origin/$CURRENT_BRANCH"; then
        git reset --hard "origin/$CURRENT_BRANCH" || handle_error "重置到远程分支失败"
    else
        handle_error "远程分支 $CURRENT_BRANCH 不存在"
    fi
    
    log "代码恢复完成"
}

# 清除缓存 ==========================================================================================
clear_cache() {
    log "开始清除缓存..."
    
    # 检查php命令
    if ! command -v php &> /dev/null; then
        handle_error "php命令未找到"
    fi
    
    # 执行缓存清理
    if ! php artisan optimize:clear || ! php artisan storage:link; then
        handle_error "缓存清理失败"
    fi
    
    log "缓存清理完成"
}

# 主函数
main() {
    log "开始站点重置..."
    
    check_requirements
    restore_database
    clean_uploads
    restore_code
    clear_cache
    
    log "站点重置完成"
    log "重置时间: $(date +%Y-%m-%d\ %H:%M:%S)"
}

# 执行主函数
main
