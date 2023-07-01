## 运行流程

- 用户访问到 `/public/admin` 下的静态文件, 前端程序会自动请求框架信息, 比如 路由, 配置, 用户信息等
- 前端程序会根据路由配置, 访问到对应的页面 (默认的页面都是 `Amis`)
- 在 `Amis` 页面中, 会根据路由的路径, 请求对应的 `api` 从而获取到 `amis` 的页面结构
- `amis` 会根据页面结构, 渲染出页面

> 访问前端 → 获取路由 → 获取页面结构 → 渲染页面

<br>

## Renderer 类的工作原理

所有的 `Renderer` 都继承了 `BaseRenderer`

```php
<?php

namespace Slowlyo\OwlAdmin\Renderers;

// BaseRenderer 实现了 JsonSerializable 接口
// JsonSerializable 接口的作用是, 当 Renderer 类 被序列化成 JSON, 会自动调用 jsonSerialize() 方法
// 文档: https://www.php.net/manual/zh/class.jsonserializable.php
class BaseRenderer implements \JsonSerializable
{
    public string $type;

    // 这个属性用于存储页面结构
    public array $amisSchema = [];

    // make() 方法是一个静态方法, 用于创建一个新的 Renderer 实例
    // 作用: 为了方便使用, 你可以直接使用 Renderer::make() 来创建一个新的 Renderer 实例, 而不需要使用 new Renderer()
    public static function make(): static
    {
        return new static();
    }

    // 通过魔术方法, 实现对 '不存在的方法' 的调用
    public function __call($name, $arguments)
    {
        return $this->set($name, array_shift($arguments));
    }

    // 将属性存储到 $amisSchema 中, 并返回当前实例, 以便于链式调用
    public function set($name, $value)
    {
        $this->amisSchema[$name] = $value;

        return $this;
    }

    // 当你在控制器中, 使用 $this->response()->success($schema);
    // 将结构返回给前端时, 会自动调用这个方法~
    public function jsonSerialize()
    {
        return $this->filteredResults(); // 返回过滤后的页面结构
    }

    // 返回 json 格式的页面结构
    public function toJson(): bool|string
    {
        return json_encode($this->amisSchema);
    }

    // 返回数组格式的页面结构
    public function toArray(): array
    {
        return $this->amisSchema;
    }

    // 因为所有的 Renderer 都继承了 BaseRenderer, 所以这个方法会被所有的 Renderer 继承
    // 等同于给所有的 Renderer 添加了一个 permission() 方法
    // 或者说, 给所有的 amis 组件都添加了一个 permission 属性
    public function permission($permission)
    {
        $this->amisSchema['owl_permission'] = $permission;

        return $this;
    }

    // 过滤掉没有权限的页面结构
    public function filteredResults()
    {
        $permissionKey = 'owl_permission';

        if (key_exists($permissionKey, $this->amisSchema)) {
            if (!admin_user()->can($this->amisSchema[$permissionKey])) {
                return null;
            }
        }

        return $this->amisSchema;
    }
}
```

这个类其实就是整个 `owl` 的精华所在

在了解了 `Renderer` 的原理之后, 只需要把 `amis` 的 100 多个组件稍微封装一下, 就可以实现 `amis` 的所有功能了

也就是 `vendor/slowlyo/owl-admin/src/Renderers` 目录下的那 200 多个文件

是不是很简单呢? 😏
