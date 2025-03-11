# 恢复数据库 ==========================================================================================
DB_INI_FILE="database.ini"

# 获取环境变量
MYSQL_HOST=$(grep "DB_HOST" .env | awk -F '=' '{print $2}')
MYSQL_USER=$(grep "DB_USERNAME" .env | awk -F '=' '{print $2}')
MYSQL_PWD=$(grep "DB_PASSWORD" .env | awk -F '=' '{print $2}')

# 创建临时的ini文件
cat > "$DB_INI_FILE" << EOF
[client]
host = $MYSQL_HOST
user = $MYSQL_USER
password = $MYSQL_PWD
EOF

chmod 600 "$DB_INI_FILE"

#mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PWD" < ./database.sql > /dev/null
mysql --defaults-file="$DB_INI_FILE" < ./database.sql

rm -f "$DB_INI_FILE"

# 清理上传的文件 ==========================================================================================

# 删除目录
rm -rf ./storage/app/public/*
# 恢复 .gitignore 文件
cat > ./storage/app/public/.gitignore << EOF
*
!.gitignore
EOF

# 恢复代码文件 ==========================================================================================

git checkout .
git clean -f
git pull

# 清除缓存 ==========================================================================================
php artisan optimize:clear
php artisan storage:link


echo
echo "站点已于 $(date +%Y-%m-%d\ %H:%M:%S) 重置~"
echo
echo
