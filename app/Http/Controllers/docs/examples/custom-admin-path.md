> 日常使用会遇到需要更改后台访问路径的需求, 避免被不相关的人访问到后台.


##### 你可以按照以下步骤, 实现自定义访问路径:

#### 1.定义你的自定义访问路径, 如下:
```php
// file: /routes/web.php

app('router')->get('/master', function (){
    $view = app(\Illuminate\View\Factory::class);

    $view->addExtension('html', 'file');

    return $view->make('admin::index');
});
// 当然, 你可以吧返回 view() 放到 Controller , 这里只是为了方便演示~
```
<br>

#### 2. 处理原本的 `/admin` 访问路径, 让它返回 404:

```php
// file: /routes/web.php

app('router')->get('/admin', function (){
    abort(404);
});
```
