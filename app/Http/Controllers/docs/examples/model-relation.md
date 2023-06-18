### 假设你定义了这么一个关联

```php
public function branch()
{
    return $this->belongsTo(Branch::class);
}
```

_如果你连模型关联都没玩明白, 建议先通读并背诵 [文档](https://learnku.com/docs/laravel/9.x/eloquent-relationships/12252) ~_

<br>

### 现在你需要在列表中或者详情中回显


##### 更改 Service 中的查询

```php
// 列表中
public function listQuery()
{
    $model = $this->getModel();

    // 原本的查询长这样
    // return $this->query()->orderByDesc($model->getUpdatedAtColumn());

    // 现在你需要改成这样, 预加载 branch 关联
    return $this->query()->with('branch')->orderByDesc($model->getUpdatedAtColumn());
}

// 详情中
public function getDetail($id)
{
    // 原本的查询长这样
    // return $this->query()->find($id);

    // 现在你需要改成这样, 预加载 branch 关联
    return $this->query()->with('branch')->find($id);
}
```

_更改查询后, 你的数据将从一维变成二维_

```php
// 直观一点看

// 原本数据长这样
[
    'id' => 1,
    'name' => '张三',
    'branch_id' => 1,
]

// 现在数据长这样
[
    'id' => 1,
    'name' => '张三',
    'branch_id' => 1,
    'branch' => [
        'id' => 1,
        'name' => '总部',
    ],
]
```

_如果你连数据结构为什么变成这样都有点蒙圈, 建议先通读并背诵 [文档](https://learnku.com/docs/laravel/9.x/eloquent-relationships/12252#012e7e) ~_

<br>

### 现在你需要在列表中或者详情中回显

```php      
// 列表中
// ...
// 你现在可以通过 . 的方式取到多个层级的数据
TableColumn::make()->name('branch.name')->label('所属分公司'),
// ...

// 详情中
// ...
// 你现在可以通过 . 的方式取到多个层级的数据
TextControl::make()->static(true)->name('branch.name')->label('所属分公司'),
// ...
```

<br>

### 为什么可以这么玩?

这里你需要先了解一下 `amis` 中的 __数据域__ 概念: 
[https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/datascope-and-datachain](https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/datascope-and-datachain)