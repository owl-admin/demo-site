> 提供一种思路, 仅供参考~

<br>

## 组件封装

添加一个 `Components` 类, 用于存放自定义组件, 初始模板类似这样:

文件: `app/Support/Components.php`
```php
<?php

namespace App\Support;

class Components
{
    public static function make()
    {
        return new self();
    }
    
    public function jumpToBaiDu(){
        return amisMake()->UrlAction()->url('https://www.baidu.com')->type('link')->blank()->label('百度一下');
    }
}
```

<br>

## 使用方式

```php
Components::make()->jumpToBaiDu();

// 你依然可以继续调用组件的方法
Components::make()->jumpToBaiDu()->className('btn btn-primary');
```

<br>

## 分享组件

你可以在 GitHub 的 discussions 分享你的组件, 或者获取他人分享的组件~

👉 [discussions](https://github.com/Slowlyo/owl-admin/discussions/categories/%E7%BB%84%E4%BB%B6%E5%B0%81%E8%A3%85)
