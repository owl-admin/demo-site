## 创建扩展

在扩展管理中使用 `创建扩展` 来生成一个扩展的骨架。

配置相应的报名及命名空间，然后点击 `确认` 即可。

### 格式

- 包名: 作者名/扩展名 (例如: slowlyo/banner)
- 命名空间: 作者名\扩展名 (例如: Slowlyo\Banner)

扩展包创建完成后，会在 `extensions` 目录下生成一个扩展包的骨架，目录结构如下:

```
    ├── .gitignore
    ├── composer.json   # composer配置文件, 需要自行配置alias/authors/description等信息, 用于展示
    ├── README.md   # 扩展说明文档, 可以在扩展管理中查看
    ├── database
    │   └── migrations  # 数据库迁移文件, 与laravel的迁移文件一致
    ├── public
    │   └── extensions  # 扩展前端文件, 会发布到 public/extensions 目录下
    │       └── slowlyo
    │           └── banner
    └── src
        ├── BannerServiceProvider.php   # 扩展服务提供者
        └── Http
            ├── routes.php  # 扩展路由
            ├── Middleware  # 扩展中间件
            └── Controllers # 扩展控制器
                └── BannerController.php
```

## 配置

### logo

在插件根目录下添加 `logo.png` 文件，用于在扩展管理中展示。

### 文档

根目录的 `README.md` 文件, 会在扩展管理中展示。

### composer.json

| 字段          | 说明                |
|-------------|-------------------|
| alias       | 扩展名称(在扩展管理中以这个为主) |
| authors     | 作者信息              |
| description | 描述信息              |
| version     | 版本号               |
| homepage    | 扩展主页              |


## 功能开发

### 路由

你可以在 `extensions/扩展名/src/Http/routes.php` 文件中定义扩展的路由。
> 注意避免重复

### 菜单

在`src/BannerServiceProvider.php` 中添加 `$menu` 属性:

```php
protected $menu = [
    [
        'parent'   => '',
        'title'    => '轮播',
        'url'      => '/banner',
        'url_type' => '1',
        'icon'     => 'fa fa-users',
    ],
    [
        'parent'   => '轮播', // 此处父级菜单根据 title 查找
        'title'    => '子菜单',
        'url'      => '/banner/child',
        'url_type' => '1',
        'icon'     => 'fa fa-users',
    ],
];
```

### 语言包

在扩展目录下创建 `lang` 目录, 逻辑与laravel的语言包一致, 例如:

```
    ├── lang
    │   ├── zh-CN
    │   │   └── banner.php
    │   └── en
    │       └── banner.php
```

在控制器中可以通过下面的方法访问语言包内容，关于多语言的更多用法可以参考 laravel 官方文档

```php
use Slowlyo\Banner\BannerServiceProvider;

BannerServiceProvider::trans('title');
```

### 前端

你可以在服务提供者中使用 `Admin::js()` 方法来动态加载你的前端文件 [`register()` / `init()`]


### 中间件

在`src/BannerServiceProvider.php` 中添加 `$middleware` 属性:

```php
protected $middleware = [
    LogOperation::class,
    // ...
];
```

### 扩展配置

在`src/BannerServiceProvider.php` 中有以下方法, 依葫芦画瓢即可:

```php
public function settingForm()
{
    return $this->baseSettingForm()->body([
        TextControl::make()->name('value')->label('Value')->required(true),
        // 继续添加你的配置项
    ]);
}
```

你可以使用 `setting` 方法来获取配置项的值:

```php
use Slowlyo\Banner\BannerServiceProvider;

// 读取配置参数
$except = BannerServiceProvider::setting('except');
// 支持多级配置
$except = BannerServiceProvider::setting('except.value');
```

### 数据库迁移

在 `extensions/扩展名/database/migrations` 目录下创建迁移文件

扩展启用时会自动执行迁移文件, 卸载时会自动回滚

### 其他

基础的服务提供者中提供了 `customInitBefore` 和 `customInitAfter` 两个方法, 用于扩展的自定义初始化操作

### 发布到 Packagist.org

参考 [Packagist 中文文档](https://learnku.com/docs/composer/2018)
