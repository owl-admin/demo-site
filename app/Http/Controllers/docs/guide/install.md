## 环境

- PHP >= `8.0`
- Laravel `9.*`


## 开始安装

首先需要安装`laravel`框架，如已安装可以跳过此步骤。如果您是第一次使用`laravel`
，请务必先阅读 [文档](https://learnku.com/docs/laravel/9.x/installation/12200) ！

```bash
composer create-project --prefer-dist laravel/laravel 项目名称 9.*
# 或
composer create-project --prefer-dist laravel/laravel 项目名称
```

安装完`laravel`之后需要修改`.env`文件，设置数据库连接设置正确

```dotenv
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=owl_admin
DB_USERNAME=root
DB_PASSWORD=
```

安装`owl_admin`

```shell
cd {项目名称}

composer require slowlyo/owl-admin
```

然后运行下面的命令来发布资源：

```shell
php artisan admin:publish
```

在该命令会生成配置文件`config/admin.php`，可以在里面修改安装的地址、数据库连接、以及表名，建议都是用默认配置不修改。

然后运行下面的命令完成安装：


```shell
php artisan admin:install
```

> 执行这一步命令可能会报以下错误`Specified key was too long ... 767 bytes`
> 如果出现这个报错，请在`app/Providers/AppServiceProvider.php`文件的`boot`
> 方法中加上代码`\Schema::defaultStringLength(191);`
> 然后删除掉数据库中的所有数据表，再重新运行一遍`php artisan admin:install`命令即可。<br>



启动服务后，在浏览器打开 `http://localhost/admin`，使用用户名 `admin` 和密码 `admin`登陆。
