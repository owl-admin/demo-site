>后台管理系统中的常用功能

***

在 `App\Admin\Controllers\SettingsController` 中有部分示例代码可供参考

可以通过 `settings()` 辅助函数保存或获取设置

内置以下方法:

## __set - 保存设置__

```php
/**
 * @param $key
 * @param $value
 *
 * @return bool
 */
public function set($key, $value = null) { }

// eg
settings()->set('site_name', 'Owl Admin');
```
<br>

## __setMany - 批量保存设置__

```php
/**
 * @param array $data
 *
 * @return bool
 */
public function setMany(array $data) { }

// eg
settings()->setMany([
    'site_name' => 'Owl Admin',
    'site_description' => 'Owl Admin is a laravel admin package',
]);
```
<br>

## __adminSetMany - 批量保存设置并返回后台响应格式数据__

```php
/**
 * @param array $data
 *
 * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
 */
public function adminSetMany(array $data) { }

// eg
public function store(Request $request)
{
    // 直接返回后台响应格式数据
    return settings()->adminSetMany($request->all());
}
```
<br>

## __all - 以数组形式返回所有设置__

```php
/**
 * @return array
 */
public function all() { }

// eg
settings()->all();
```
<br>

## __get - 获取设置项__

```php
/**
 * @param string $key 设置项key
 * @param mixed|null $default 默认值
 * @param bool $fresh 是否直接从数据库获取
 *
 * @return mixed|null
 */
public function get(string $key, mixed $default = null, bool $fresh = false) { }

// eg
settings()->get('site_name');
```
<br>

## __arrayGet - 获取设置项中的某个值__

```php
/**
 * @param string $key 设置项key
 * @param string $path 通过点号分隔的路径, 同Arr::get()
 * @param $default
 *
 * @return array|\ArrayAccess|mixed|null
 */
public function arrayGet(string $key, string $path, $default = null) { }

// eg
settings()->arrayGet('site_info', 'title.zh.value');
```
<br>

## __clearCache - 清除指定设置项的缓存__

```php
/**
 * @param $key
 *
 * @return void
 */
public function clearCache($key) { }

// eg
settings()->clearCache('site_name');
```
