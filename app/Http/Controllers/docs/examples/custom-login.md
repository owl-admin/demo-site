#### 1. 在页面配置中, 将登录页模板切换为 `Amis`

#### 2. 重写 `AuthController` 中的 `loginPage()`

#### 3. 覆盖 `login` 路由

```php
$router->get('/login', [App\Admin\Controllers\AuthController::class, 'loginPage']);
```
