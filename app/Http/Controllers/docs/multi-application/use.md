## __创建模块__

这个命令会创建 `owl-admin` 所需的文件和目录, 以及相关的数据库及基础数据
建议首字母大写, 使用大驼峰格式

```bash
php artisan admin-module:init <module-name>
# eg: php artisan admin-module:init Master
# 支持多个模块同时创建
# eg: php artisan admin-module:init Master Store
```

## __更改配置文件__

```php
// file: config/admin.php

// 配置 modules
// 建议首字母大写, 大驼峰格式
// ...
'modules' => [
    'Master' => true // 在这里配置模块名, 以及启用状态
]
```

## __配置 `composer.json`__

配置模块目录(admin-modules)自动加载

```json
"autoload": {
    "psr-4": {
        "App\\": "app/",
        "AdminModules\\": "admin-modules/"
    }
}
```

重新生成自动加载文件

```bash
composer dump-autoload
```

<br>

__现在, 你可以通过 `/master` 来访问你的新模块了~__
