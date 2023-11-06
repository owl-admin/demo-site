> v3.0.3 新增

# 条件组合查询

在 `OwlAdmin` 中，可以使用 `ConditionBuilder` 组件来灵活的构建条件组合查询。

## __使用__

### 1. 在 `Model` 中引入 `ConditionBuilderScopeTrait`

```php

use Slowlyo\OwlAdmin\Traits\ConditionBuilderScopeTrait;

class User extends Model
{
    use ConditionBuilderScopeTrait;
}
```

<br>

### 2. 在需要使用条件组合查询的语句中，添加 `withConditionBuilder()` 方法`

`withConditionBuilder()` 是在 `ConditionBuilderScopeTrait` 中实现的 [局部查询作用域](https://learnku.com/docs/laravel/9.x/eloquent/12251#f97e0f)

```php
User::query()->withConditionBuilder()->get();
```

<br>

### 3. 添加 `ConditionBuilder` 组件

以基础的 `CRUD` 页面为例：

`ConditionBuilder` 组件的使用，请参考 [官方文档](https://aisuda.bce.baidu.com/amis/zh-CN/components/form/condition-builder)

```php
public function list(): Page
{
    $crud = $this->baseCRUD()
        ->filter(
            $this->baseFilter()->body([
                // baseFilterConditionBuilder 方法已在基类中实现
                $this->baseFilterConditionBuilder()->fields([
                    // text 类型
                    [
                        'name'  => 'title',
                        'label' => '名称',
                        'type'  => 'text',
                    ],
                    // 自定义类型
                    [
                        'type'      => 'custom', // 设置类型为 自定义
                        'name'      => 'custom', // 字段名
                        'label'     => '自定义', // 字段标题
                        'operators' => [ // 设置操作符
                            [
                                'label' => '自定义',    // 操作符标题
                                'value' => 'custom-op', // 操作符值
                            ],
                        ],
                        'value'     => amis()->TextControl(), // right 需要渲染的组件
                    ],
                ]),
            ])
        )
        ->columns([
            // ...
        ]);

    return $this->baseList($crud);
}
```

<br>

## __扩展__

在准备扩展前，请先确保读懂了 `ConditionBuilderScopeTrait` 的实现，以及 `ConditionBuilder` 组件的使用

### 1. 参考上述示例，添加自定义类型

<br>

### 2. 在对应的 `Model` 中，添加 `extraConditionBuilderQuery` 方法

```php
class User Extends Model
{
    use ConditionBuilderScopeTrait;

    /**
     * @param \Illuminate\Database\Query\Builder|self $query query实例
     * @param array $filter 筛选项
     * @param string $or 组合方式 and / or
     *
     * @return void
     */
    public function extraConditionBuilderQuery($query, $filter, $or)
    {
        $field = data_get($filter, 'left.field'); // 获取到要查询的字段
        $op    = data_get($filter, 'op'); // 操作符, 对应到自定义类型中的 operators 下的某一项的 value
        $value = data_get($filter, 'right'); // 用户输入的值

        // 根据操作符，进行自定义查询
        if ($op === 'custom-op') {
            $query->where($field, '=', $value, $or);
        }
    }
}
```

<br>

注意：
- 在构建查询时，涉及循环&递归，请不要在 `extraConditionBuilderQuery` 方法中进行任何io操作~
- ConditionBuilder 组件产生的数据较大，建议使用 post 请求~

