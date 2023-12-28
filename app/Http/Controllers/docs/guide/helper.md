## __amis__

调用 Component 类, 实现万能组件

```php
amis('page')->title('title')->body('content');
// 等效于
Page::make()->title('title')->body('content');
// 等效于
amis()->Page()->title('title')->body('content');
```

<br>

## ~~amisMake~~

解决 复杂页面 use 语句过多 的问题

```php
amisMake()->TextControl()->name('name')->label('label');
// 等效于
TextControl::make()->name('name')->label('label');
```

<br>

## __admin_encode__

加密字符串

```php
admin_encode(string $str):string
```

<br>

## __admin_decode__

解密字符串

```php
admin_decode(string $str):string
```

<br>

## __array2tree__

递归生成树状数据，确保数组中包含键 `parent_id`

```php
array2tree($arr):array
```

<br>

## __admin_url__

```php
admin_url($path = null, $needPrefix = false):string

// eg:
admin_url('user');       // /user
admin_url('user', true); // /admin-api/user
```

<br>

## __table_columns__

获取数据表的字段

```php
table_columns(string $table):array
```

<br>

## __admin_resource_full_path__

返回资源完整路径

```php
admin_resource_full_path(string $path):string
```

<br>

## __admin_path__

返回 admin 目录路径

```php
admin_path(string $path = null):string
```

<br>

## __file_upload_handle__

处理文件上传回显问题, set 时去除域名, get 加上域名

```php
file_upload_handle():\Illuminate\Database\Eloquent\Casts\Attribute
```

<br>

## __is_json__

判断是否是 json 字符串

```php
is_json(string $str):bool
```

<br>

## __settings__

```php
settings():\Slowlyo\OwlAdmin\Services\AdminSettingService;
```

<br>

## __admin_user__

获取当前登录用户信息

```php
$userId = admin_user()->id;
```

<br>

## __admin_abort & admin_abort_if__

抛出异常, 并返回错误信息

```php
admin_abort($message = '', $data = [], $doNotDisplayToast = 0);
// 如果条件成了, 则抛出异常
admin_abort_if($flag, $message = '', $data = [], $doNotDisplayToast = 0);
```
