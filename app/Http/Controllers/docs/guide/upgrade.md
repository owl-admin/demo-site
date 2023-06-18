### 说明

`Owl Admin` 的版本发行将会参考主流 `Web 框架` 的发行策略，尽量降低版本升级带来的影响，小版本和补丁 **决不** 包含非兼容性更改；同时我们也将会提供更新日志，详细说明新版本的改动以及可能造成的影响。

<br>

### 通用升级步骤

获取最新框架代码

```shell
composer require slowlyo/owl-admin
```

获取成功之后需要运行 `admin:update` 命令进行重新发布语言包、配置文件、前端静态资源等文件，然后**清理浏览器缓存**

```shell
# 发布 语言包、配置文件、前端静态资源等, 如果有字段调整, 也会在这个命令中处理
php artisan admin:update
```

运行 `admin:update`，相当于运行

```
php artisan admin:publish --assets --config --lang --force
``` 

<br>

> ❗由于 `admin:update` 命令会强制覆盖原有文件，所以在运行之前请做好备份工作

💡 ___每个版本更新日志中都会有对应的升级步骤说明, 上述内容只是一个通用的升级步骤~___

<br>

### 发布文件命令

> 运行 `admin:update` 后一般不需要运行 `admin:publish` 命令

发布所有文件, 并强制覆盖原有文件
```shell
php artisan admin:publish --force
```

更新语言包, 并强制覆盖原有文件
```shell
php artisan admin:publish --force --lang
```

更新配置文件, 并强制覆盖原有文件
```shell
php artisan admin:publish --force --config
```

更新前端静态资源, 并强制覆盖原有文件
```shell
php artisan admin:publish --force --assets
```

更新前端代码, 并强制覆盖原有文件
```shell
php artisan admin:publish --force --views
```