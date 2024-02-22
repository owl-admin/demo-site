## __目录结构__

创建模块后, 会在你的应用根目录生成以下目录结构:

```
admin-modules/                              # 模块根目录
 └── Master/
     ├── Controllers/                       # 控制器目录
     │   ├── AuthController.php
     │   ├── HomeController.php
     │   ├── MasterController.php
     │   └── SettingController.php
     ├── Models/                            # 模型目录
     │   ├── AdminCodeGenerator.php
     │   ├── AdminMenu.php
     │   ├── AdminPermission.php
     │   ├── AdminRole.php
     │   └── AdminUser.php
     ├── Services/                          # Service 目录
     ├── bootstrap.php                      # 框架会自动加载这个文件, 可以在里面动态添加菜单或导航栏按钮
     ├── config.php                         # 模块的配置文件
     ├── MasterServiceProvider.php          # 模块的服务提供者, 可以在里面处理一些其他的高级操作
     └── routes.php                         # 模块的路由文件
```

<br>

## __数据库__

- 初始化模块后, 会自动创建模块所需的数据库及基础数据
- 新建的数据表都会以 `模块名_` 为前缀

<br>

## __注意事项__

- __代码生成器 / 扩展__ 这两个功能在所有模块中共通
- 所有模块与主应用都同用一套前端资源, 模块之间依靠 __接口前缀__ 区分

<br>

## __移除模块__

- 手动删除模块目录  `Modules/你的模块名`
- 手动删除模块的数据库表, 它们都以 `模块名_` 为前缀
