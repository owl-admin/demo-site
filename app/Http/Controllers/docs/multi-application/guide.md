## 目录结构

创建模块后, 会在你的应用根目录生成以下目录结构:

```
Modules                                     # 模块根目录
 └── Master
     ├── bootstrap.php                      # 框架会自动加载这个文件, 可以在里面动态添加菜单或导航栏按钮
     ├── composer.json
     ├── Config
     │   ├── admin.php                      # admin 的配置文件
     │   └── config.php
     ├── Console
     ├── Database
     │   ├── factories
     │   ├── Migrations
     │   └── Seeders
     │       └── MasterDatabaseSeeder.php
     ├── Entities
     ├── Http
     │   ├── Controllers                    # 控制器目录
     │   │   ├── AuthController.php
     │   │   ├── HomeController.php
     │   │   ├── MasterController.php
     │   │   └── SettingController.php
     │   ├── Middleware
     │   └── Requests
     ├── Models                             # 模型目录
     │   ├── AdminCodeGenerator.php
     │   ├── AdminMenu.php
     │   ├── AdminPermission.php
     │   ├── AdminRole.php
     │   └── AdminUser.php
     ├── module.json
     ├── package.json
     ├── Providers
     │   ├── MasterServiceProvider.php
     │   └── RouteServiceProvider.php
     ├── Resources
     │   ├── assets
     │   │   ├── js
     │   │   └── sass
     │   ├── lang
     │   └── views
     │       ├── index.blade.php            # 模块的入口视图
     │       └── layouts
     ├── Routes
     │   ├── admin.php                      # 模块的路由文件
     │   ├── api.php
     │   └── web.php
     ├── Tests
     │   ├── Feature
     │   └── Unit
     └── vite.config.js
```

<br>

## 数据库

- 初始化模块后, 会自动创建模块所需的数据库及基础数据
- 新建的数据表都回以 `模块名_` 为前缀

<br>

## 注意事项

- __代码生成器 / 扩展__ 这两个功能在所有模块中共通
- 所有模块与主应用都同用一套前端资源, 模块之间依靠 __接口前缀__ 区分

<br>

## 更新

- 可以使用 `admin-module:update` 来给所有模块重新生成视图文件
- 如果涉及配置文件更新, 需要手动更新模块中的配置文件

<br>

## 移除模块

- 手动删除模块目录  `Modules/你的模块名`
- 手动删除模块的数据库表, 它们都以 `模块名_` 为前缀
