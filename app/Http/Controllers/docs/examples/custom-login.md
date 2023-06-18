#### 1. 在页面配置中, 将登录页模板切换为 `Amis`

#### 2. 重写 `AuthController` 中的 `loginPage()`

原代码如下:

```php
public function loginPage()
{
    $captcha       = null;
    $enableCaptcha = config('admin.auth.login_captcha');

    // 验证码
    if ($enableCaptcha) {
        $captcha = amisMake()->InputGroupControl()->body([
            amisMake()->TextControl()->name('captcha')->placeholder(__('admin.captcha'))->required(true),
            amisMake()->HiddenControl()->name('sys_captcha'),
            amisMake()->Service()->id('captcha-service')->api('get:' . admin_url('/captcha'))->body(
                amisMake()
                    ->Image()
                    ->src('${captcha_img}')
                    ->height('1.917rem')
                    ->className('p-0 border captcha-box')
                    ->set(
                        'clickAction',
                        ['actionType' => 'reload', 'target' => 'captcha-service']
                    )
            ),
        ]);
    }

    $form = amisMake()->Form()->id('login-form')->title('')->api(admin_url('/login'))->body([
        amisMake()->TextControl()->name('username')->placeholder(__('admin.username'))->required(true),
        amisMake()
            ->TextControl()
            ->type('input-password')
            ->name('password')
            ->placeholder(__('admin.password'))
            ->required(true),
        $captcha,
        amisMake()->CheckboxControl()->name('remember_me')->option(__('admin.remember_me'))->value(true),

        // 登录按钮
        amisMake()
            ->VanillaAction()
            ->actionType('submit')
            ->label(__('admin.login'))
            ->level('primary')
            ->className('w-full'),
    ])->actions([]); // 清空默认的提交按钮

    $failAction = [];
    if ($enableCaptcha) {
        // 登录失败后刷新验证码
        $failAction = [
            // 登录失败事件
            'submitFail' => [
                'actions' => [
                    // 刷新验证码外层Service
                    ['actionType' => 'reload', 'componentId' => 'captcha-service'],
                ],
            ],
        ];
    }
    $form->onEvent(array_merge([
        // 页面初始化事件
        'inited'     => [
            'actions' => [
                // 读取本地存储的登录参数
                [
                    'actionType' => 'custom',
                    'script'     => <<<JS
let loginParams = localStorage.getItem('loginParams')
if(loginParams){
loginParams = JSON.parse(loginParams)
doAction({
    actionType: 'setValue',
    componentId: 'login-form',
    args: { value: loginParams }
})
}
JS
,

                ],
            ],
        ],
        // 登录成功事件
        'submitSucc' => [
            'actions' => [
                // 保存登录参数到本地, 并跳转到首页
                [
                    'actionType' => 'custom',
                    'script'     => <<<JS
let _data = {}
if(event.data.remember_me){
_data = { username: event.data.username, password: event.data.password }
}
window.\$owl.afterLoginSuccess(_data, event.data.result.data.token)
JS,

                ],
            ],
        ],
    ], $failAction));

    $card = amisMake()->Card()->className('w-96 m:w-full')->body([
        amisMake()->Flex()->justify('space-between')->className('px-2.5 pb-2.5')->items([
            amisMake()->Image()->src(url(config('admin.logo')))->width(40)->height(40),
            amisMake()
                ->Tpl()
                ->className('font-medium')
                ->tpl('<div style="font-size: 24px">' . config('admin.name') . '</div>'),
        ]),
        $form,
    ]);

    return amisMake()->Page()->css([
        '.captcha-box .cxd-Image--thumb' => [
            'padding' => '0',
            'cursor'  => 'pointer',
            'border'  => 'var(--Form-input-borderWidth) solid var(--Form-input-borderColor)',

            'border-top-right-radius'    => '4px',
            'border-bottom-right-radius' => '4px',
        ],
        '.cxd-Image-thumb'               => ['width' => 'auto'],
    ])->body(
        amisMake()->Wrapper()->className("h-screen w-full flex items-center justify-center")->body($card)
    );
}

```

#### 3. 覆盖 `login` 路由

```php
$router->get('/login', [App\Admin\Controllers\AuthController::class, 'loginPage']);
```