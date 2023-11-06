#### 1. 在页面配置中, 将登录页模板切换为 `Amis`

#### 2. 自行实现 `\App\Admin\Controllers\AuthController` 中的 `loginPage()`

#### 3. 覆盖 `login` 路由

```php
$router->get('/login', ['你的控制器', '你的loginPage']);
```
