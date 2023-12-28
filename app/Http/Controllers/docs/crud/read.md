## __列表__

- 前端会根据菜单路径, 访问对应的路由, 通过 `get` 请求, 访问到对应控制器的 `index` 方法
- 这里通过 `_action` 参数, 让这个方法同时处理了 3 个功能
    - 原因: 不需要额外的定义路由, 一个 `resource` 路由就可以满足所有 `CRUD` 的功能

```php
public function index()
{
    // 带有参数 ?_action=getData 的请求, 查询数据并返回
    if ($this->actionOfGetData()) {
        return $this->response()->success($this->service->list());
    }

    // 带有参数 ?_action=export 的请求, 处理导出
    if ($this->actionOfExport()) {
        return $this->export();
    }

    // 没有携带 _action 参数的请求, 返回列表结构
    return $this->response()->success($this->list()); // 这里调用了 list 方法
}
```

<br>

- list 方法, 用于返回列表结构

```php
public function list()
{
    // baseCRUD 方法中, 配置了部分基础配置, 如果需要修改, 可以直接在后面覆盖
    $crud = $this->baseCRUD()
        // CRUD 的顶部工具栏
        ->headerToolbar([
            $this->createButton(true), // 新增按钮
            ...$this->baseHeaderToolBar(), // 工具栏内的其他操作按钮
        ])
        // 筛选器
        ->filter(
            // baseFilter 方法中配置了一个基础的表单
            $this->baseFilter()->body(
                // 这里边配置筛选的表单项
                amis()->TextControl('keyword', __('admin.keyword'))
            )
        )
        // 表格列
        ->columns([
            amis()->TableColumn('id', 'ID')->sortable(),
            amis()->TableColumn('name', __('admin.admin_user.name')),
            
            // 行操作按钮
            $this->rowActions([
                $this->rowEditButton(true), // 编辑按钮
                $this->rowDeleteButton(), // 删除按钮
            ]),
        ]);

    // baseList 方法中是基础的页面配置
    return $this->baseList($crud);
}
```

- Service 中的 list 方法, 用于查询数据

```php
/**
 * 列表 获取数据
 *
 * @return array
 */
public function list()
{
    // 处理查询条件
    $query = $this->listQuery();

    // 分页查询数据
    $list  = $query->paginate(request()->input('perPage', 20));
    $items = $list->items();
    $total = $list->total();

    return compact('items', 'total');
}

/**
 * 列表 获取查询 (大多数情况下, 只需要重写这个方法即可)
 *
 * @return Builder
 */
public function listQuery()
{
    $query = $this->query(); // 对应模型的 query 方法

    $this->sortable($query); // 处理排序

    $this->searchable($query); // 处理 CRUD 的 searchable 属性

    return $query; // 返回查询条件
}
```

<br>

## __详情__

- 页面模式下
    - 通过访问 `xxx/{id}` 路由, 进入到 `AdminController` 方法中的 `show` 方法
    - 在 `show` 方法中, 调用 `detail` 方法, 并返回新增页面的结构
- 弹窗模式下
    - 在访问 `rowShowButton` 方法时, 会调用 `detail` 方法, 并返回详情页面的结构

```php
/**
 * 详情 (AdminController 中)
 *
 * @param $id
 *
 * @return JsonResponse|JsonResource
 * @throws ContainerExceptionInterface
 * @throws NotFoundExceptionInterface
 */
public function show($id)
{
    // 判断参数, 查询详情并返回
    if ($this->actionOfGetData()) {
        return $this->response()->success($this->service->getDetail($id));
    }

    $detail = amis()
        ->Card()
        ->className('base-form')
        ->header(['title' => __('admin.detail')])
        ->body($this->detail()) // 这里调用了 detail 方法
        // 工具栏
        ->toolbar([
            $this->backButton() // 返回按钮
        ]); 

    $page = $this->basePage()->body($detail);

    return $this->response()->success($page);
}

/**
 * 前端 amis 通过识别 detail 方法返回的结构来详情页面
 * 
 * @param bool $id 对应的主键
 * 
 * @return Form
 */
public function detail($id)
{
    return $this->baseDetail()->body([
        amis()->StaticExactControl()->name('id')->label('ID'),
    ]);
}

/**
 * 详情 获取数据 (Service 中)
 *
 * @param $id
 *
 * @return Builder|Builder[]|\Illuminate\Database\Eloquent\Collection|Model|null
 */
public function getDetail($id)
{
    return $this->query()->find($id);
}
```
