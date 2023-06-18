框架提供了基础的数据导出功能, 可以很方便的实现导出数据到 `.xlsx` 文件


> 此功能依赖于 [laravel-excel](https://docs.laravel-excel.com) ( maatwebsite/excel )
> 如果 `maatwebsite/excel` 安装时报错, 请先安装 `psr/simple-cache:^2.0`
> 相关 [issue](https://github.com/SpartnerNL/Laravel-Excel/issues/3815)

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

## 部分自定义配置

### 导出文件名

```php
// 在控制器中重写 exportFileName 方法
protected function exportFileName()
{
    return '此处为导出文件名';
}
```
<br>

### 表头

```php
// 在控制器中重写 exportHeadings 方法
protected function exportHeadings()
{
    return [
        '姓名',
        '年龄',
        '性别',
        '...'
    ];
}
```
<br>

### 导出列

```php
// 在控制器中重写 exportColumns 方法
protected function exportColumns($row)
{
    return [
        $row->name,
        $row->age,
        // 可以在这里自定义处理数据, 如:
        $row->gender == 1 ? '男' : '女',
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
    $query = $this->service->listQuery()->when($ids, fn($query) => $query->whereIn('id', explode(',', $ids)));

    // 此处使用 laravel-excel 导出，可自行修改
    AdminExport::make($query)
        ->setHeadings($this->exportHeadings())
        ->setMap(fn($row) => $this->exportColumns($row))
        ->store($path);

    return $this->response()->success(compact('path'));
}
```
