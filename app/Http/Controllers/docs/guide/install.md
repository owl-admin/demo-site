## __环境__

- PHP >= `8.0`
- Laravel `9.*`

<br>

## __开始安装__

首先需要安装`laravel`框架，如已安装可以跳过此步骤。如果您是第一次使用`laravel`，请务必先阅读 [文档](https://learnku.com/docs/laravel/9.x/installation/12200) ！

```bash
composer create-project --prefer-dist laravel/laravel 项目名称 9.*
# 或
composer create-project --prefer-dist laravel/laravel 项目名称
```

安装完`laravel`之后需要修改`.env`文件，设置数据库连接设置正确

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=owl_admin
DB_USERNAME=root
DB_PASSWORD=
```

如果有需要的话，在此时可以在`config/app.php`设置中文
locale如下设置
```
'locale' => 'zh_CN',
```

安装`owl_admin`

```bash
cd {项目名称}

composer require slowlyo/owl-admin
```

然后运行下面的命令来发布资源：

```bash
php artisan admin:publish
```

在该命令会生成配置文件`config/admin.php`，可以在里面修改安装的地址、数据库连接、以及表名，建议都是用默认配置不修改。

然后运行下面的命令完成安装：


```bash
php artisan admin:install
```

> 执行这一步命令可能会报以下错误`Specified key was too long ... 767 bytes`
> 如果出现这个报错，请在`app/Providers/AppServiceProvider.php`文件的`boot`
> 方法中加上代码`\Schema::defaultStringLength(191);`
> 然后删除掉数据库中的所有数据表，再重新运行一遍`php artisan admin:install`命令即可。<br>

<br>

上述步骤操作完成之后就可以配置 web 服务了，注意需要把 web 目录也就是运行目录指向 public 目录

如果用的是 nginx，还需要在配置中加上伪静态配置
```bash
location / {
    try_files $uri $uri/ /index.php?$query_string;
}
```

<br>

另外注意文件权限设置 `755`, 否则可能报错

启动服务后，在浏览器打开 `http://localhost/admin`，使用用户名 `admin` 和密码 `admin`登陆。
