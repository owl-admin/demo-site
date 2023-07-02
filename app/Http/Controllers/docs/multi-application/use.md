> 多应用模块基于 `laravel-modules` 实现

<br>

## 安装 `laravel-modules`

获取依赖
```bash
composer require nwidart/laravel-modules
```

发布配置文件
```bash
php artisan vendor:publish --provider="Nwidart\Modules\LaravelModulesServiceProvider"
```

配置 `composer.json`

添加 `psr-4` 到 `autoload` 下
```json
"autoload": {
    "psr-4": {
        "App\\": "app/",
        "Modules\\": "Modules/"
    }
}
```

重新生成自动加载文件
```bash
composer dump-autoload
```

<br>

## 创建模块

建议首字母大写
```bash
php artisan module:make <module-name>
# eg: php artisan module:make Master
```

#### 在模块中初始化 `owl-admin`

配置
```php
// file: config/admin.php

// 配置 modules
// 建议首字母大写
// ...
'modules' => [
    'Master' // 在这里配置模块名
]
```

这个命令会在模块中创建 `owl-admin` 所需的文件和目录, 以及相关的数据库及基础数据
```bash
php artisan admin-module:init --module=<module-name>
# eg: php artisan admin-module:init --module=Master
```

<br>

现在, 你可以通过 `/master` 来访问你的新模块了~
