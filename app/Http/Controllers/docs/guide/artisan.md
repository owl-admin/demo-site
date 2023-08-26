框架提供了一些 `artisan` 方便开发者使用, 可使用 `php artisan list` 查看所有可用的 `artisan` 命令.

<br>

### __创建一个新用户__

```bash
# 执行后, 根据提示输入用户名, 密码即可创建一个新用户.

php artisan admin:create-user
```

<br>

### __清理代码生成器已经生成的内容__

```bash
# 此处 id 为代码生成器生成的 id
# eg: php artisan admin:gen-code-clear --id=1

php artisan admin:gen-code-clear {--id=}
```

<br>

### __生成路由__

```bash
# 根据代码生成记录生成路由文件, 生成的路由文件在 `/routes/admin.php`
# excluded 为排除的记录id, 多个用逗号隔开 (可选)
# eg: php artisan admin:gen-route --excluded=1,2,3

php artisan admin:gen-route {--excluded=}
```

<br>

### __安装框架__

```bash
# 该命令会初始化框架目录结构及数据库

php artisan admin:install
```

<br>

### __发布框架资源__

```bash
# 可选参数:
#    --force :  发布并覆盖
#    --lang :   发布语言文件
#    --views :  发布前端源码(一般不需要发布, 发布后代码在`resources/admin-views` 下)
#    --assets : 发布静态资源文件
#    --config : 发布配置文件

# eg: php artisan admin:publish --force --lang --views --assets --config

# 不传参数则发布所有资源
# eg: php artisan admin:publish

php artisan admin:publish
```

<br>

### __更改用户密码__

```bash
# 执行后, 根据提示输入用户名, 密码即可.

php artisan admin:reset-password
```

<br>

### __更新框架__

```bash
# 更新框架, 会自动发布资源
# 可选参数:
#    --v :  指定版本号(可选, 根据 github release 描述填写, eg: --v=257)

php artisan admin:update {--v=}
```

<br>

### __初始化模块__

```bash
# 初始化模块, 会自动发布资源
# 可选参数:
#    --module :  指定模块名(可选, eg: --module=Master)

php artisan admin-module:init {--module=}
```

<br>

### __更新模块__

```bash
# 更新所有模块中的框架资源

php artisan admin-module:update
```
