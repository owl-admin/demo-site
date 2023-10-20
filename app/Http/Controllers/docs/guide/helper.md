## amis

调用 Component 类, 实现万能组件

```php
amis('page')->title('title')->body('content');
// 等效于
Page::make()->title('title')->body('content');
```
<br>

## amisMake

解决 复杂页面 use 语句过多 的问题

```php
amis()->TextControl()->name('name')->label('label');
// 等效于
TextControl::make()->name('name')->label('label');
```
<br>

## admin_encode

加密字符串

```php
admin_encode(string $str):string
```
<br>

## admin_decode

解密字符串

```php
admin_decode(string $str):string
```
<br>

## array2tree

递归生成树状数据，确保数组中包含键 `parent_id`

```php
array2tree($arr):array
```
<br>
