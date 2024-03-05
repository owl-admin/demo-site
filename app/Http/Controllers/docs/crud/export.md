框架提供了基础的数据导出功能, 可以很方便的实现导出数据到 `.xlsx` 文件


> 此功能依赖于 [fast-excel](https://github.com/rap2hpoutre/fast-excel) ( rap2hpoutre/fast-excel )

<br>

## 使用

```php
// 在列表工具栏添加导出按钮
public function list(): Page
{
    $crud = $this->baseCRUD()
        ->headerToolbar([
            $this->createButton(),
            ...$this->baseHeaderToolBar(),
            // 添加导出按钮
            $this->exportAction(),
        ])
        ->columns([
            // ...
        ]);

    return $this->baseList($crud);
}

```

<br>

## 自定义导出信息

### 导出文件名

```php
// 在控制器中重写 exportFileName 方法
protected function exportFileName()
{
    return '此处为导出文件名';
}
```
<br>

### 导出列信息

```php
// 在控制器中重写 exportMap 方法, $row 是数组格式
// 该方法会被循环调用, 请不要在里面执行 IO 操作
protected function exportMap($row)
{
    return [
        '姓名' => $row['name'],
        '年龄' => $row['age'],
        '性别' => $row['gender'],
        '...'
    ];
}
```
<br>

## 完整自定义

如果以上配置不能满足你的需求, 你可以重写 `export` 方法, 自定义导出逻辑

```php
// 在控制器中重写 export 方法
// 此方法在 index() 中被调用, 当请求参数 _action=export 时
protected function export()
{
    // 默认在 storage/app/ 下
    $path = sprintf('%s-%s.xlsx', $this->exportFileName(), date('YmdHis'));

    // 导出本页和导出选中项都是通过 _ids 查询
    $ids = request()->input('_ids');

    // listQuery() 为列表查询条件，与获取列表数据一致
    $query = $this->service->listQuery()
        ->when($ids, fn($query) => $query->whereIn($this->service->primaryKey(), explode(',', $ids)));

    try {
        fastexcel($query->get())->export(storage_path('app/' . $path), fn($row) => $this->exportMap($row));
    } catch (\Throwable $e) {
        admin_abort(__('admin.action_failed'));
    }

    return $this->response()->success(compact('path'));
}
```
