> 日常使用会遇到需要更改后台访问路径的需求, 避免被不相关的人访问到后台.


##### 你可以按照以下步骤, 实现自定义访问路径:

#### 1. 在 `/resources/views/` 目录下创建一个 `blade` 文件
_以 `admin.blade.php` 举例, 你可以叫其他名字_
<br>

#### 2.复制 `/public/admin/index.html` 文件的内容到 `/resources/views/admin.blade.php`
<br>

#### 3.定义你的自定义访问路径, 比如:
```php
// file: routes/web.php
Route::get('/ad', function (){
	// 此处对应的你创建的 blade 模板
    return view('admin');
});
// 当然, 你可以吧返回 view() 放到 Controller , 这里只是为了方便演示~
```
<br>

#### 4. 删除 `/public/admin/index.html` , 让原本的 `/admin` 不能访问