## v2.7.9

扩展增加 change 事件

_无需发布资源_

<br>

___2023-08-15 21:16:18___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.9)

<br>

## v2.7.8

修复控制器代码生成错误问题

_无需发布资源_

<br>

___2023-08-07 20:55:57___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.8)

<br>

## v2.7.6

#### 更新内容

- 支持菜单参数
- 支持自定义菜单对应的组件
- 支持无菜单页面
- amis 更新 `v3.3.0`

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. 执行 `php artisan admin:update --v=276` 升级框架

<br>

___2023-08-01 14:09:15___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.6)

<br>

## v2.7.5

优化扩展管理

_无需发布资源~_

<br>

___2023-07-24 14:16:23___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.5)

<br>

## v2.7.4

管理员保存问题修复

_无需发布资源_

<br>

___2023-07-18 15:01:07___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.4)

<br>

## v2.7.3

多应用, 权限生成功能问题修复, 中间件调整


<br>

___2023-07-17 14:50:01___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.3)

<br>

## v2.7.2

#### 更新内容

- 部分框架代码调整
- 移除 Class `OwlAdmin` 
- 优化框架路由加载, 解决模块路由缓存问题

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码

<br>

___2023-07-04 22:25:01___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.2)

<br>

## v2.7.1

#### 更新内容

- `amis` 更新 `v3.2.0`
- `crud` 支持基础快速编辑
- 由于3个富文本编辑器上传api各不相同, 移除组件内的默认的 `api` 设置

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --force` 发布静态资源``

<br>

___2023-07-03 22:58:50___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.1)

<br>

## v2.7.0

#### 更新内容

- ✨ 适配 `laravel-modules` , 现在可以很方便在应用中创建多个全新的后台模块了~
- 移除了控制器中的 `rowActionOnlyEditAndDelete()` 方法
- 调整 `rowActions()` 方法, 可通过向该方法的第一个参数传入 _数组_ 来自定义行操作按钮

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --force` 发布静态资源

<br>

___2023-07-02 22:54:52___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.7.0)

<br>

## v2.6.10

修复 `v2.6.9` 引发的中间件异常的问题, 此版本无需发布资源

<br>

___2023-06-26 19:56:03___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.10)

<br>

## v2.6.9

#### 更新内容

- ✨ 增加组件鉴权, 更精细化的权限控制
- 框架中间件代码优化
- 前端弹窗提示逻辑优化

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --lang --force` 发布静态资源

<br>

___2023-06-26 00:03:10___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.9)

<br>

## v2.6.8

#### 更新内容

- 新增: 可动态添加菜单

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码

<br>

___2023-06-24 15:58:13___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.8)

<br>

## v2.6.7

#### 更新内容

- ✨ 新开发工具: 可视化编辑器
- 问题修复
    - tab栏未启用时, form报错的问题
    - 编辑/详情页面面包屑不显示问题

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --lang --force` 发布静态资源

<br>

___2023-06-21 00:29:28___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.7)

<br>

## v2.6.6

#### 更新内容

- 移除暗色模式
- 移除无用的前端代码

#### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --config --force` 发布静态资源

<br>

___2023-06-18 20:42:42___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.6)

<br>

## v2.6.5

### 更新内容

- 菜单展开/选中逻辑优化
- amisPage增加loading动画
- 菜单管理功能中, 父级菜单选择框数据优化
- Alert 组件样式优化

### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --force` 发布静态资源

<br>

___2023-06-14 17:28:47___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.5)

<br>

## v2.6.4

### 更新内容

- 菜单样式优化
- 修复 `admin:gen-code-clear` 命令的问题

### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --force` 发布静态资源

<br>

___2023-06-14 09:28:40___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.4)

<br>

## v2.6.3

### 更新内容

- 部分样式优化
- 消息提醒优化
- 优化生成菜单生成逻辑
- 框架模型类问题修复
- 角色管理中一处多语言问题优化

### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --lang --force` 发布静态资源

<br>

___2023-06-09 17:00:32___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.3)

<br>

## v2.6.2

### 修复

- 筛选失效问题 (v2.6.0 产生的bug)
- 框架表格初始化字段补充 (v2.5.9 产生的bug, 仅新安装的应用会有该问题)

### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --force` 发布静态资源

<br>

___2023-06-08 17:50:00___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.2)

<br>

## v2.6.1

### 更新内容

- tab栏在新安装的应用中默认启用
- 优化tab栏逻辑
- 页面模式的表单/详情, 适配tab栏交互逻辑
- 新增全局js方法 `window.$owl.closeTabByPath()`

<br>

### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --force` 发布静态资源

<br>

___2023-06-07 21:36:41___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.1)

<br>

## v2.6.0

### 更新内容

- `amis` 版本更新至 `v3.1.1`
- 优化
    - 页面刷新保留查询参数
    - 优化部分硬编码

<br>

### 更新方式

1. `composer require slowlyo/owl-admin` 获取最新框架代码
2. `php artisan admin:publish --assets --config --force` 更新框架资源

<br>

___2023-06-06 22:45:10___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.6.0)

<br>

## v2.5.9

### 更新内容

- 代码生成器优化
    - 增加: 表单可配置为页面/弹窗, 可配置弹窗大小
    - 优化记录储存数据
    - 增加单条记录导入导出(方便生成记录共享)

### 更新方式

1. 使用 `composer require slowlyo/owl-admin` 获取最新版本 (v2.5.9)
2. 执行 `php artisan admin:update --v=259` 升级框架

<br>

___2023-06-05 15:03:11___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.9)

<br>

## v2.5.8

### 更新内容

✨ ___让一个完整的功能, 召之即来挥之即去~___

- 增加 `artisan` 命令  `admin:gen-code-clear`
    - 作用: 清除代码生成器生成的内容
        - controller 文件
        - model 文件
        - service 文件
        - migration 文件及迁移记录
        - route 文件
        - 创建的数据表
    - 使用: `php artisan admin:gen-code-clear --id=1`
        - 此处 `id` 为代码生成器生成的记录的 `id` 值

### 更新方式

- 通过 `composer` 获取最新版本
    - `composer require slowlyo/owl-admin`

<br>

___2023-06-04 22:32:17___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.8)

<br>

## v2.5.7

### 更新内容

- `amis` 升级 `v3.1.0`
- `service` 增加对 `searchable` 属性的支持
    - 原理: 判断请求参数中是否存在字段名, 如果存在则使用 `where` 进行模糊查询
- ️🧨代码生成器升级
    - 支持预览
    - 支持保存记录
    - 支持字段组件配置
    - 支持菜单/路由自动生成
- 增加 `artisan` 命令
    - `admin:update`: 框架升级 
    - `admin:gen-route`: 根据代码生成记录维护框架路由

<br>

### 更新步骤

1. 使用 `composer require slowlyo/owl-admin` 获取最新版本 (v2.5.7)
2. 执行 `php artisan admin:update --v=257` 命令升级框架
3. 执行 `php artisan cache:clear` 清除缓存 (可选)

<br>

___2023-06-04 01:48:29___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.7)

<br>

## v2.5.6

__amis 调试工具__  现在可由 `admin.show_development_tools` 控制

#### 注意

此次更新需要重新发布 assets

`php artisan admin:publish --assets --force`

<br>

___2023-05-17 20:49:05___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.6)

<br>

## v2.5.5

### 更新内容

- 框架代码优化
- 提供可追加 nav 的方法

### 注意

此次更新涉及 `config`、`lang`、`assets`、`views` 

_**全部**的资源都需要重新发布_

- __覆盖 config 前注意备份自己已有的配置信息__
- __如果自行该更了前端, 发布 views 前注意备份自己的代码__

在清楚注意事项后, 你可以直接执行以下命令

```bash
php artisan admin:publish --config --lang --assets --force

# 如果你需要自行更改前端, 则需要增加 views
php artisan admin:publish --config --lang --assets --views --force
```

<br>

___2023-05-17 10:18:50___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.5)

<br>

## v2.5.4

- 代码生成优化

<br>

___2023-05-15 08:37:30___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.4)

<br>

## v2.5.3

- 优化样式

### 注意

此次升级需要重新发布 assets

`php artisan admin:publish --assets --force`

<br>

___2023-05-13 20:11:31___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.3)

<br>

## v2.5.2

- 升级 amis v3.0
- 页面缓存逻辑优化 [#I71QJ3](https://gitee.com/slowlyo/owl-admin/issues/I71QJ3)
- 增加配置项: 配置某些路由不追加额外路由


### 注意

此次升级需要重新发布资源与配置文件

`php artisan admin:publish --assets --config --force`

<br>

___2023-05-13 19:50:49___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.2)

<br>

## v2.5.1

代码生成器问题修复


<br>

___2023-05-13 19:44:47___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.1)

<br>

## v2.5.0

修复日期组件显示英文的问题

#### 需要重新发布 assets
`php artisan admin:publish --assets --force`

<br>

___2023-04-27 16:23:35___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.5.0)

<br>

## v2.4.9

代码生成器使用体验优化


<br>

___2023-04-27 13:41:33___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.9)

<br>

## v2.4.8

Renderer 优化

<br>

___2023-04-23 15:19:50___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.8)

<br>

## v2.4.7

- 左侧菜单模式下菜单滚动问题修复
- Tab 增加定位当前选中项

#### 需要重新发布 assets
`php artisan admin:publish --assets --force`

<br>

___2023-04-23 15:18:28___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.7)

<br>

## v2.4.6

#### 样式优化
- 多层级菜单title不显示问题
- inputNumber 暗色悬浮背景问题
- 菜单滚动问题

#### 需要重新发布 assets
`php artisan admin:publish --assets --force`

<br>

___2023-04-21 09:45:20___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.6)

<br>

## v2.4.5

#### 优化

- 用户菜单优化
- 登录成功逻辑优化
- tab缓存逻辑优化

##### 注意

此次更新需要重新发布 `assets`
`php artisan admin:publish --assets --force`

<br>

___2023-04-20 15:53:19___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.5)

<br>

## v2.4.4

#### 修复
Tab 栏样式问题

#### 新增
- Tab 栏增加滚轮横向滚动
- ✨自定义组件: wangEditor 富文本编辑器

##### 注意

此次更新需要重新发布 `assets`
`php artisan admin:publish --assets --force`

<br>

___2023-04-20 14:48:16___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.4)

<br>

## v2.4.3

修复copy失效的问题

首页模板调整


##### 注意
 此次更新需要重新发布 `assets`

`php artisan admin:publish --assets --force`

<br>

___2023-04-19 20:24:36___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.3)

<br>

## v2.4.2

移除更多扩展中的去安装操作


<br>

___2023-04-19 10:06:47___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.2)

<br>

## v2.4.1

移除内置的 Terminal

<br>
> 如果你任要使用, 可安装扩展包: `slowlyo/owl-terminal`

<br>

___2023-04-18 23:12:18___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.1)

<br>

## v2.4.0

Tab 关闭逻辑优化

##### 注意

此次更新需要重新发布 `assets`

`php artisan admin:publish --assets --force`

<br>

___2023-04-17 21:52:05___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.4.0)

<br>

## v2.3.9

✨ 新增 Tab 栏

#### 注意

此次更新需要重新发布 `assets` 和 `config`

`php artisan admin:publish --assets --config --force`

<br>

___2023-04-17 16:40:00___

[查看详情](https://github.com/Slowlyo/owl-admin/releases/tag/v2.3.9)

<br>

## v2.3.8

exportAction 问题修复

<br>

___2023-04-14 17:14:45___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.8)

<br>

## v2.3.7

菜单样式修复

需要更新前端

`php artisan admin:publish --assets --force`

<br>

___2023-04-12 13:31:37___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.7)

<br>

## v2.3.6

样式优化

需要重新发布前端

`php artisan admin:publish --assets --force`

<br>

___2023-04-12 10:24:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.6)

<br>

## v2.3.5

##### 前端配置保存优化

<br>

此次更新需要重新发布前端
`php artisan admin:publish --assets --force`


<br>

___2023-04-12 09:34:27___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.5)

<br>

## v2.3.4

获取更多扩展, api加速


<br>

___2023-04-11 10:15:37___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.4)

<br>

## v2.3.3

优化: 支持自定义主键名称


<br>

___2023-04-10 23:20:27___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.3)

<br>

## v2.3.2

主题色问题修复

需要重新发布  assets

php artisan admin:publish --assets --force

<br>

___2023-04-10 14:04:25___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.2)

<br>

## v2.3.1

浏览器标题可配置

需要重新发布 `config` 和 `assets`

`php artisan admin:publish --config --assets --force`

<br>

___2023-04-10 09:09:34___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.1)

<br>

## v2.3.0

#### 调整
- 前端
    - 前端框架更换为 [Arco React](https://arco.design/react/docs/start)
- 后端
    - 控制器移除 `$pageTitle` 属性
    - `admin_url` 方法调整, 去除 `url` 方法

#### 新增
- 多登录页模板, 现在可以通过 `amis` 构建登录页
- 前端新增全局 function , 可在 `amis` 中通过 `window.$owl` 调用
    - `window.$owl.logout()` 退出登录
    - `window.$owl.afterLoginSuccess()` 登录成功后的回调
    - `window.$owl.refreshAmisPage()` 刷新当前 amis 页面 (重新加载页面结构)
    - `window.$owl.refreshRoutes()` 刷新前端路由
- 现在可以通过重写 `get('/current-user')` 路由, 使用 `amis` 自定义用户菜单
- 现在可以通过重写 `get('/login')` 路由, 使用 `amis` 自定义登录页面

<br>

#### 升级注意事项
- 如果你是从之前的版本升级, 需要重新发布资源: 
  - 执行命令 `php artisan admin:publish --assets --config --lang --force`
  - 移除历史主题配置数据
    - 删除 `admin_settings` 表中 `key` = `system_theme_setting` 的数据
    - 清除缓存: 执行 `php artisan cache:clear`

<br>

___2023-04-09 22:44:13___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.3.0)

<br>

## v2.2.4-beta

v2.2.4-beta

<br>

___2023-04-09 21:40:39___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.2.4-beta)

<br>

## v2.2.3-beta

v2.2.3-beta

<br>

___2023-04-09 01:08:33___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.2.3-beta)

<br>

## v2.2.2-beta

v2.2.2-beta

<br>

___2023-04-09 00:21:11___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.2.2-beta)

<br>

## v2.2.1-beta

arco beta

<br>

___2023-04-08 22:07:02___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.2.1-beta)

<br>

## v2.2.0

菜单图标显示优化

<br>

___2023-03-22 21:26:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.2.0)

<br>

## v2.1.9

terminal 使用体验优化

<br>

___2023-03-22 09:55:16___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.9)

<br>

## v2.1.8

调整 command load

<br>

___2023-03-22 09:41:02___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.8)

<br>

## v2.1.7

新增开发者工具: 终端

<br>

___2023-03-21 21:30:25___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.7)

<br>

## v2.1.6

优化 getListPath()


<br>

___2023-03-19 20:02:26___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.6)

<br>

## v2.1.5

部分功能优化

<br>

___2023-03-19 19:04:43___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.5)

<br>

## v2.1.4

对接packagist数据


<br>

___2023-03-18 22:40:32___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.4)

<br>

## v2.1.3

角色管理: 权限设置优化
权限自动生成功能优化
增加头部按钮配置


<br>

___2023-03-18 21:11:08___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.3)

<br>

## v2.1.2

系统角色管理功能优化


<br>

___2023-03-16 22:21:36___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.2)

<br>

## v2.1.1

crud 分页样式修复

<br>

___2023-03-15 14:12:25___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.1)

<br>

## v2.1.0

默认生成弹窗模式表单

<br>

___2023-03-15 14:02:46___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.1.0)

<br>

## v2.0.19

扩展加载逻辑调整

<br>

___2023-03-14 21:53:15___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.19)

<br>

## v2.0.18

file_upload_handle() 方法优化


<br>

___2023-03-14 14:56:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.18)

<br>

## v2.0.17

导出按钮优化


<br>

___2023-03-13 11:48:35___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.17)

<br>

## v2.0.16

控制器代码优化

<br>

___2023-03-12 19:52:03___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.16)

<br>

## v2.0.15

导出控件多语言


<br>

___2023-03-12 10:16:41___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.15)

<br>

## v2.0.14

增加 excel 导出功能

<br>

___2023-03-11 21:55:26___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.14)

<br>

## v2.0.13

扩展加载流程优化

#### _注意: 更新此版本需要自行将所有admin扩展升级至最新版本_

<br>

___2023-03-10 20:12:41___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.13)

<br>

## v2.0.12

##### 优化
`index()` 方法挪到 `baseController` 中, 只在需要时重写

##### 新增
`amisMake()` 助手函数, 解决复杂页面 use 过多的问题

<br>

___2023-03-09 22:48:35___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.12)

<br>

## v2.0.11

分页控件样式修复


<br>

___2023-03-09 10:06:42___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.11)

<br>

## v2.0.10

form增加参数用于判断是否是编辑页面


<br>

___2023-03-08 20:50:35___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.10)

<br>

## v2.0.9

更改admin_encode&admin_decode方法, 修改admin_permissions表中的json字段为text


<br>

___2023-03-07 20:39:46___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.9)

<br>

## v2.0.8

优化queryPath, 更改AdminController父类


<br>

___2023-03-06 20:57:15___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.8)

<br>

## v2.0.7

优化: noContent 方法可能与第三方包重复


<br>

___2023-03-06 15:59:39___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.7)

<br>

## v2.0.6

layout 不显示站点名称问题修复


<br>

___2023-03-05 16:28:36___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.6)

<br>

## v2.0.5

优化service生成模板


<br>

___2023-03-05 16:10:51___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.5)

<br>

## v2.0.4

优化controller中queryPath属性: 可以不用再controller中定义queryPath了


<br>

___2023-03-05 15:53:43___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.4)

<br>

## v2.0.3

layout: 左侧菜单混合模式不显示应用名称问题修复

<br>

___2023-03-05 14:10:10___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.3)

<br>

## v2.0.2

主题色适配优化


<br>

___2023-03-04 21:56:15___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.2)

<br>

## v2.0.1

support laravel 10

<br>

___2023-03-03 13:35:02___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.1)

<br>

## v2.0.0

amis 版本更新至 v2.8.0
重命名为 Owl Admin
主题色适配优化

> 此次更新改动较大, 从 `1.*` 升级, 需要手动替换已有代码的命名空间
> 此次更新前端需要重新发布

<br>

___2023-03-03 11:21:18___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.0)

<br>

## v2.0.0-beta.2

v2.0.0-beta.2

<br>

___2023-03-03 09:51:40___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.0-beta.2)

<br>

## v2.0.0-beta.1

v2.0.0-beta.1

<br>

___2023-03-03 09:49:10___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.0-beta.1)

<br>

## v2.0.0-beta

amis 版本更新至 v2.8.0
重命名为 Owl Admin

<br>

___2023-03-03 09:31:58___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v2.0.0-beta)

<br>

## v1.7.13

PageElement 封装优化


<br>

___2023-03-02 15:34:32___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.13)

<br>

## v1.7.12

列表查询增加默认排序


<br>

___2023-03-02 14:51:18___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.12)

<br>

## v1.7.11

代码生成器生成id列


<br>

___2023-03-02 14:23:58___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.11)

<br>

## v1.7.10

页面按钮优化

<br>

___2023-03-02 11:46:06___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.10)

<br>

## v1.7.9

主题色适配优化

<br>

___2023-03-01 21:23:43___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.9)

<br>

## v1.7.8

增加footer内容配置
样式微调

> 涉及更改配置文件及前端, 更新此版本需要重新发布 `--asset` 和 `--config`

<br>

___2023-02-28 21:57:12___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.8)

<br>

## v1.7.7

service 优化

<br>

___2023-02-28 17:38:34___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.7)

<br>

## v1.7.6

优化部分细节

<br>

___2023-02-24 21:22:37___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.6)

<br>

## v1.7.5

暗色模式优化

<br>

___2023-02-22 09:39:41___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.5)

<br>

## v1.7.4

增加: AdminController增加form页面判断


<br>

___2023-02-21 11:44:53___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.4)

<br>

## v1.7.3

暗色模式优化


<br>

___2023-02-21 09:03:13___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.3)

<br>

## v1.7.2

fix: 多角色菜单去重


<br>

___2023-02-20 20:11:07___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.2)

<br>

## v1.7.1

### 调整
- 移除登录成功的控制台输出
- 扩展静态资源相关调整

<br>

___2023-02-19 13:59:43___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.1)

<br>

## v1.7.0

### 新增
- 动态加载全局静态资源

### 修复
- 用户设置中方法参数错误问题

### 调整
- 移除扩展开发中原有静态资源处理逻辑, 使用动态加载资源代替

<br>

___2023-02-17 22:53:38___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.7.0)

<br>

## v1.6.10

fix: 首页模板样式修复

<br>

___2023-02-17 10:13:49___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.10)

<br>

## v1.6.9

调整扩展文档地址


<br>

___2023-02-16 16:25:41___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.9)

<br>

## v1.6.8

change logo

<br>

___2023-02-16 15:41:54___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.8)

<br>

## v1.6.7

修复: 
    amis 内容超出无法显示

优化:
    菜单路径校验是否包含 / , queryPath 读取优化

<br>

___2023-02-15 21:40:07___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.7)

<br>

## v1.6.6

 zip安装依赖, 加载autoload.files

<br>

___2023-02-10 18:22:47___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.6)

<br>

## v1.6.5

fix: 扩展路由加载问题


<br>

___2023-02-10 11:48:28___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.5)

<br>

## v1.6.4

扩展文档效果优化

<br>

___2023-02-10 10:10:36___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.4)

<br>

## v1.6.3

fix: 多级路由页面显示异常


<br>

___2023-02-06 18:23:08___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.3)

<br>

## v1.6.2

暗色模式样式适配

<br>

___2023-02-04 15:24:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.2)

<br>

## v1.6.1

样式修复

<br>

___2023-02-04 09:08:16___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.1)

<br>

## v1.6.0

使用 vue3 重构前端


__注意:__
此次更新涉及前端, 从旧版本升级需要重新发布(_覆盖_)前端资源
如遇问题可尝试手动删除 `public/admin` 目录后重新发布资源
```bash
php artisan admin:publish --assets --force
```

<br>

___2023-02-03 23:17:17___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.6.0)

<br>

## v1.5.9-beta.3

首页调整

<br>

___2023-02-03 23:07:10___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.9-beta.3)

<br>

## v1.5.9-beta.2

修复部分问题

<br>

___2023-02-03 23:00:51___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.9-beta.2)

<br>

## v1.5.9-beta.1

补充前端打包文件

<br>

___2023-02-03 22:45:35___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.9-beta.1)

<br>

## v1.5.9-beta

使用vue3重构前端

<br>

___2023-02-03 22:37:07___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.9-beta)

<br>

## v1.5.8

菜单列表排序调整

<br>

___2023-01-31 23:01:18___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.8)

<br>

## v1.5.7

问题修复

<br>

___2023-01-31 22:52:59___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.7)

<br>

## v1.5.6

路由问题修复


<br>

___2023-01-31 22:48:31___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.6)

<br>

## v1.5.5

首页内容调整

<br>

___2023-01-31 01:15:56___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.5)

<br>

## v1.5.4

调整菜单查询排序
登录验证码样式优化

<br>

___2023-01-30 23:09:56___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.4)

<br>

## v1.5.3

调整菜单查询排序
登录验证码样式优化


<br>

___2023-01-30 23:08:04___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.3)

<br>

## v1.5.2

调整了富文本上传接口返回值
优化: 扩展的服务提供者中不一定要存在settingForm方法

<br>

___2023-01-15 23:27:59___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.2)

<br>

## v1.5.1-beta

#### 🚀 新增

##### 📦 扩展管理

- [x] 支持 zip / composer 两种方式安装扩展
- [x] 支持在扩展管理中查看扩展文档
- [x] 支持扩展的启用、禁用、卸载等操作
- [x] 支持扩展的配置管理

##### 🌐 多语言

- [x] 完善前端多语言支持

##### 其他

- [x] 增加登录验证码, 可在配置文件中配置是否开启

#### 🐞 修复

- [x] 修复个人设置页面保存路径错误的问题
- [x] 以及其他一些小问题 (记不清了~)


<br>

___2023-01-14 18:02:37___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.1-beta)

<br>

## v1.5.0-beta

#### 🚀 新增

##### 📦 扩展管理

- [x] 支持 zip / composer 两种方式安装扩展
- [x] 支持在扩展管理中查看扩展文档
- [x] 支持扩展的启用、禁用、卸载等操作
- [x] 支持扩展的配置管理

##### 🌐 多语言

- [x] 完善前端多语言支持

##### 其他

- [x] 增加登录验证码, 可在配置文件中配置是否开启

#### 🐞 修复

- [x] 修复个人设置页面保存路径错误的问题
- [x] 以及其他一些小问题 (记不清了~)


<br>

___2023-01-14 17:59:41___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.5.0-beta)

<br>

## v1.4.8

amis 组件调整

<br>

___2023-01-04 10:42:11___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.4.8)

<br>

## v1.4.7

增加系统设置功能 [查看文档](http://slowlyo.gitee.io/slow-admin-doc/docs/built-in-module-settings)

<br>

___2023-01-02 00:55:21___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.4.7)

<br>

## v1.4.4

#### amis 更新至2.6.0 版本

amis 更新内容可查看 [Release 2.6.0 baidu/amis](https://github.com/baidu/amis/releases/tag/v2.6.0)

__注意:__
此次更新涉及前端, 从旧版本升级需要重新发布(_覆盖_)前端资源
如遇问题可尝试手动删除 `public/admin` 目录后重新发布资源
```bash
php artisan admin:publish --assets --force
```

<br>

___2022-12-30 23:12:27___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.4.4)

<br>

## v1.4.3

代码生成器优化
- 这里是列表文本布局调整
- 这里是列表文本detail() 内容调整

<br>

___2022-12-28 17:09:28___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.4.3)

<br>

## v1.4.2

psr-4 自动加载问题

<br>

___2022-12-24 17:36:23___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.4.2)

<br>

## v1.4.1

补充一些方法

<br>

___2022-12-24 17:28:02___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.4.1)

<br>

## v1.4.0

### 对amis组件封装作亿点点优化

这是一个 **船新** 版本, 针对amis封装了 **196** 个类, 涵盖了amis几乎 _所有_ 的组件及其属性

 **注意: !!!!!** 

此版本与 v1.3.9 及以前的版本不完全兼容!!
因为组件封装调整过大~
许多组件更改了名称, 如果原本已经开发了一些功能, 升级可能有一定的工作量

_其实问题不大, 改了名字而已, 属性基本一致~~_

<br>

___2022-12-24 16:57:43___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.4.0)

<br>

## v1.3.9

增加文件上传处理方法

<br>

___2022-12-19 10:06:13___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.9)

<br>

## v1.3.8

fix: 自动生成权限问题

<br>

___2022-12-07 18:28:11___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.8)

<br>

## v1.3.7

InputFile & InputRichText 增加默认上传地址


<br>

___2022-12-05 23:10:44___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.7)

<br>

## v1.3.6

配置文件中增加 token 配置示例
修复 sider 类型为 group 时二级图标显示异常的问题


<br>

___2022-12-03 22:40:18___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.6)

<br>

## v1.3.5

更新首页文档地址


<br>

___2022-12-02 11:49:01___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.5)

<br>

## v1.3.4

amis 更新至 v2.5.1


<br>

___2022-12-02 11:46:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.4)

<br>

## v1.3.3

fix: serve 运行找不到配置文件

<br>

___2022-11-25 15:27:28___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.3)

<br>

## v1.3.2

修复图标丢失问题，更改前端配置文件名


<br>

___2022-11-19 21:44:29___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.2)

<br>

## v1.3.1

amis新版本样式问题修复


<br>

___2022-11-18 22:47:33___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.1)

<br>

## v1.3.0

- amis 更新至2.4.0
- 获取列表代码优化
- 前端增加配置项, 增加页面过渡动画

##### 更新后需要重新发布前端资源
```bash
php artisan admin:pulish --assets --force
```

<br>

___2022-11-18 10:20:45___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.3.0)

<br>

## v1.2.5

使用Ant Design 重构前端

<br>

___2022-11-12 17:57:30___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.2.5)

<br>

## v1.2.1

样式调整

<br>

___2022-11-12 16:25:08___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.2.1)

<br>

## v1.2.0

使用Ant Design 重构前端

<br>

___2022-11-12 14:59:07___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.2.0)

<br>

## v1.1.3-beta

配置文件更改

<br>

___2022-11-12 14:31:37___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.1.3-beta)

<br>

## v1.1.2-beta

数据库填充更改

<br>

___2022-11-12 14:24:03___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.1.2-beta)

<br>

## v1.1.1-beta

dist目录

<br>

___2022-11-12 11:35:21___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.1.1-beta)

<br>

## v1.1.0-beta

前端重构 预览版

<br>

___2022-11-12 11:29:31___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.1.0-beta)

<br>

## v1.0.0

增加: 多语言
增加: 代码生成器可选择已有的数据表生成代码

<br>

___2022-10-20 22:30:18___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v1.0.0)

<br>

## v0.8.5

增加: 权限 - 自动生成权限功能


<br>

___2022-10-10 16:04:55___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.8.5)

<br>

## v0.8.0

增加: 个人设置-更改密码需要输入原密码


<br>

___2022-09-30 16:48:59___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.8.0)

<br>

## v0.7.5-beta

登录页面应用标题居中


<br>

___2022-09-26 16:43:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.7.5-beta)

<br>

## v0.7.2-beta

增加弹窗操作, 调整返回列表按钮, 筛选表单重置按钮调整


<br>

___2022-09-19 23:33:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.7.2-beta)

<br>

## v0.7.1-beta

增加弹窗操作, 调整返回列表按钮, 筛选表单重置按钮调整


<br>

___2022-09-19 23:32:46___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.7.1-beta)

<br>

## v0.7.0-beta

增加弹窗操作, 调整返回列表按钮, 筛选表单重置按钮调整


<br>

___2022-09-19 23:28:48___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.7.0-beta)

<br>

## v0.6.0-beta

登录增加图形验证码

<br>

___2022-09-15 14:54:35___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.6.0-beta)

<br>

## v0.5.7-beta

形参调整

<br>

___2022-09-14 13:53:12___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.5.7-beta)

<br>

## v0.5.2-beta

详情页面显示效果调整


<br>

___2022-09-08 11:19:31___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.5.2-beta)

<br>

## v0.5.0-beta

组件样式优化

<br>

___2022-09-07 11:42:36___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.5.0-beta)

<br>

## v0.4.3-beta

管理员角色及账号屏蔽删除

<br>

___2022-09-06 17:53:56___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.4.3-beta)

<br>

## v0.4.1-beta

##### 整体UI升级

需要更新静态资源, 执行以下命令
```bash
php artisan vendor:publish --provider="Slowlyo\SlowAdmin\SlowAdminServiceProvider" --force
```


<br>

___2022-09-06 15:10:57___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.4.1-beta)

<br>

## v0.3.0-beta

##### amis 更新至 `2.2.0`

需要更新静态资源, 执行以下命令
```bash
php artisan vendor:publish --provider="Slowlyo\SlowAdmin\SlowAdminServiceProvider" --force
```

##### 增加主题切换功能

可在 `config/admin.php`, 中配置 `layout.theme` 以更改系统主题

<br>

___2022-09-03 16:45:24___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.3.0-beta)

<br>

## v0.2.0-beta

##### 补充部分组件
- GridItem
- Drawer
- Dialog
- Toast
- ToastItem
- TabItem

##### 部分组件方法添加默认值
- required($value = true)
- searchable($value = true)
- removeable($value = true)
- ...


<br>

___2022-09-03 15:35:05___

[查看详情](https://gitee.com/slowlyo/owl-admin/releases/tag/v0.2.0-beta)

<br>

