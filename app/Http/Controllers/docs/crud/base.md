框架在 `Slowlyo\SlowAdmin\Controllers\AdminController` 中实现了以下方法:

| 方法        | 功能          |
|:----------|:------------|
| index()   | 列表页及获取列表数据  |
| create()  | 新增页面        |
| store()   | 新增数据的保存逻辑   |
| show()    | 详情页面及获取详情数据 |
| edit()    | 编辑页面        |
| update()  | 编辑数据的保存逻辑   |
| destroy() | 删除数据的逻辑     |

<br>

就是 resource 路由对应的方法, 如果你还不知道请看 [文档](https://learnku.com/docs/laravel/9.x/controllers/12212#resource-controllers)

通过这些方法, 组成了一个完整的 CRUD 功能

> 当默认的方法不满足你的需求时, 可以在你的 controller 重写这几个方法

<br>

### __开发一个新功能的步骤__

1. 在 `app/Admin/routes.php` 中注册一个 `resource` 路由

```php
    $router->resource('book', \App\Admin\Controllers\BookController::class);
```

2. 新建对应的控制器 `app/Admin/Controllers/BookController.php` 并继承 `AdminController`

```php
<?php

namespace App\Admin\Controllers;

use Slowlyo\OwlAdmin\Controllers\AdminController;

class BookController extends AdminController
{
    // 重写 list 、form 、detail 方法, 构建页面
}
```

3. 在菜单管理中, 创建对应的菜单即可访问

<br>

__使用代码生成器可以由系统自动处理以上步骤, 只需要自行在控制器及Service中更改自己的逻辑即可__

<br>

## __Service__

- 控制器中的 `service` 属性, 会根据你在自己的控制器中定义的 `serviceName` 属性, 在 `AdminController` 初始化时, 自动初始化为对应的 `service` 实例
