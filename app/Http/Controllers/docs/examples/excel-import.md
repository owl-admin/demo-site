> 这里举例一种 Excel 导入的写法, 或许不是最佳实现, 仅作参考~

> 数据量不大的情况下, 使用 [InputExcel](https://aisuda.bce.baidu.com/amis/zh-CN/components/form/input-excel) 也是个不错的主意~

<br>

### 1. 在 `CRUD` 的工具栏添加两个按钮


```php
public function list(): Page
{
    $crud = $this->baseCRUD()
        ->headerToolbar([
            $this->createButton(true),
			// 导入按钮
            Components::make()->importAction(admin_url('xxx_records/import')),
            // 模板下载按钮
			Components::make()->downloadImportTemplate('template/XXX导入模板.xlsx'),
            ...$this->baseHeaderToolBar(),
        ])
		// ....
	}
```

_注意: 此处的 `Components` 是自己封装的, 里面可以放一些常用的非基础组件, 并非框架自带~_

<br>

#### 导入按钮实现

这里实现了一个弹窗表单, 上传文件并提交~

```php
// 这里我封装到了一个单独的 class 中
// 你也可以直接放到对应的 Controller , 或者是直接塞到 headerToolbar 里面, 随你高兴~
public function importAction($api)
{
    return amis()->DialogAction()->label('导入')->icon('fa fa-upload')->dialog(
        amis()->Dialog()->title('导入')->body(
            amis()->Form()->mode('normal')->api($api)->body([
                amis()->FileControl()->name('file')->required(true)->drag(true),
            ]),
        )
    );
}
```

<br>

#### 模板下载按钮实现

这里传入了文件地址, 通过跳转链接的方式, 让浏览者自动下载文件~

_注: 这里我的模板文件路径为: `/public/template/XXX导入模板.xlsx`_

```php
public function downloadImportTemplate($path)
{
    return amis()
        ->UrlAction()
        ->blank(true)
        ->label('下载模板')
        ->icon('fa fa-download')
        ->url(url($path));
}
```

<br>

### 2.实现导入接口

```php
// file: app/Admin/routes.php
// 添加一个路由
$router->post('xxx_records/import', [\App\Admin\Controllers\XXXRecordController::class, 'import']);
```

```php
// 控制器中实现导入数据
public function import(Request $request)
{
    $file = storage_path('app/public/' . $request->input('file'));

    $data = fastexcel()->import($file);
    
    XXXRecord::insert($data->toArray());

    return $this->response()->successMessage('导入成功');
}
```

_注: 此处使用 [fast-excel](https://github.com/rap2hpoutre/fast-excel) 实现了最基础的数据导入, 其他逻辑自行添加~_
