框架提供了 `Admin::menu()` 方法, 可用于动态添加菜单项.

```php
// file: app/Admin/bootstrap.php

\Slowlyo\OwlAdmin\Admin::menu()->add([
    [
        'id' => 998, // 此处 id 用于确定父级菜单，与菜单表中的数据
        'title' => 'Parent', // 菜单标题
        'url' => '/parent', // 菜单路径
        'url_type' => \Slowlyo\OwlAdmin\Models\AdminMenu::TYPE_ROUTE, // 菜单类型
        'order' => 0 // 排序 (越小越靠前)
    ],
    [
        'id' => 999,
        'title' => 'Children',
        'url' => '/children',
        'url_type' => '1',
        'icon' => 'mdi:code-json', // 图标
        'parent_id' => 998, // 父级菜单 id
        'order' => 999
    ],
]);
```
