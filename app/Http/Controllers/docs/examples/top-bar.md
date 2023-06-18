> ❕v2.5.5 后支持

> _你可以在 bootstrap.php 文件中使用以下方法追加自己的 amis 元素_

<br>

## 可用方法

### prependNav

在前面添加 `amis` 元素

```php
\Slowlyo\OwlAdmin\Admin::prependNav($nav);
```

<br>

### appendNav

在后面添加 `amis` 元素

```php
\Slowlyo\OwlAdmin\Admin::appendNav($nav);
```

<br>

## 示例

```php
// file: App/Admin/bootstrap.php

<?php

// 一个按钮, 点击后弹出消息框
$msgBtn = amisMake()
    ->DrawerAction()
    ->icon('fa fa-bell')
    ->className('mr-2 rounded-full')
    ->drawer(
        amisMake()->Drawer()->title('Message')->body('Message Content')
    );

// 一个按钮, 点击后跳转到百度
$urlBtn = amisMake()
    ->UrlAction()
    ->icon('fa fa-magnifying-glass')
    ->className('ml-2 rounded-full')
    ->url('https://www.baidu.com')
    ->blank();

// 追加到已有按钮前
\Slowlyo\OwlAdmin\Admin::prependNav($msgBtn);

// 追加到已有按钮后
\Slowlyo\OwlAdmin\Admin::appendNav($urlBtn);


// 或者你可以这么写, 效果是一样的
// \Slowlyo\OwlAdmin\Admin::prependNav($msgBtn)->appendNav($urlBtn);
```

效果如下:


![追加 Nav 内容](https://cdn.learnku.com/uploads/images/202305/17/80143/66bcZ5L4aF.png!large)
