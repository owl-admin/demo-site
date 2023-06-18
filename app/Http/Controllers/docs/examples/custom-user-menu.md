#### 1. 重写 `AuthController` 中的 `currentUser()`

原代码如下:

```php
public function currentUser()
{
    $userInfo = OwlAdmin::user()->only(['name', 'avatar']);

	// 下拉按钮
    $menus = amisMake()
        ->DropdownButton()
        ->hideCaret(true)
        ->trigger('hover')
        ->label($userInfo['name'])
        ->btnClassName('navbar-user')
        ->menuClassName('min-w-0 px-2')
        ->set('icon', $userInfo['avatar'])
        ->buttons([
			// 用户设置 按钮
            amisMake()
                ->VanillaAction()
                ->iconClassName('pr-2')
                ->icon('fa fa-user-gear')
                ->label(__('admin.user_setting'))
				// 点击事件: 通过更改 hash 跳转到用户设置页面
                ->onClick('window.location.hash = "#/user_setting"'),
			// 退出登录 按钮
            amisMake()
                ->VanillaAction()
                ->iconClassName('pr-2')
                ->label(__('admin.logout'))
                ->icon('fa-solid fa-right-from-bracket')
				// 点击事件: 通过调用前端提供的方法, 实现退出登录
                ->onClick('window.$owl.logout()'),
        ]);

    return $this->response()->success(array_merge($userInfo, compact('menus')));
}

```
<br>

#### 2.  覆盖 `current-user` 路由

```php
$router->get('/current-user', [App\Admin\Controllers\AuthController::class, 'currentUser']);
```