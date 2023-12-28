## __form 方法构建新增表单__

- 页面模式下
    - 通过访问 `create` 路由, 进入到 `AdminController` 方法中的 `create` 方法
    - 在 `create` 方法中, 调用 `form` 方法, 并返回新增页面的结构
- 弹窗模式下
    - 在访问 `createButton` 方法时, 会调用 `form` 方法, 并返回新增表单的结构

```php
/**
 * 前端 amis 通过识别 form 方法返回的结构来构建表单
 * 
 * @param bool $isEdit 用于判断是否为编辑
 * 
 * @return Form
 */
public function form($isEdit)
{
    // baseForm 方法中, 处理了表单的一些基础内容
    // 可以传入一个 bool 参数, 控制在表单提交成功后是否返回上一页
    return $this->baseForm()->body([
        TextControl::make()->name('name')->label('Name'),
        TextControl::make()->name('email')->label('Email'),
    ]);
}
```

<br>

## __store 方法处理新增表单提交__

- 提交的流程
    - 前端渲染新增表单 (里面包含了提交的路径)
        - 页面模式下, 提交 `api` 在 `AdminController` 下的 `create` 方法中进行了设置
        - 弹窗模式下, 提交 `api` 在 `createButton` 方法中进行了设置
    - 提交到后端, 后端会调用 `store` 方法, 并进行相应的处理
- `AdminController` 中的 `store` 方法, 可以满足大多数的新增表单提交需求, 但是如果有特殊的需求, 也可以重写该方法
- 大多数情况下, 重写对应 `service` 中的 `store` 方法即可

```php
/**
 * 新增保存
 *
 * @param Request $request
 *
 * @return JsonResponse|JsonResource
 */
public function store(Request $request)
{
    $response = fn($result) => $this->autoResponse($result, __('admin.save'));

    // 处理快速编辑
    if ($this->actionOfQuickEdit()) {
        return $response($this->service->quickEdit($request->all()));
    }

    // 处理快速编辑某项
    if ($this->actionOfQuickEditItem()) {
        return $response($this->service->quickEditItem($request->all()));
    }

    // 返回新增结果
    return $response($this->service->store($request->all()));
}

/**
 * service 中实际处理新增逻辑的方法, 可以在自己的 service 中重写该方法
 *
 * @param $data
 *
 * @return bool
 */
public function store($data): bool
{
    $columns = $this->getTableColumns();
    $model   = $this->getModel();

    foreach ($data as $k => $v) {
        if (!in_array($k, $columns)) {
            continue;
        }

        $model->setAttribute($k, $v);
    }

    return $model->save();
}
```
