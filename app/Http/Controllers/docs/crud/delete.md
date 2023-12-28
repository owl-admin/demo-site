## __删除按钮__

- 控制器中的 `list` 方法负责构建数据列表

```php
public function list()
{
    $crud = $this->baseCRUD()
        // 配置 CRUD 组件的批量操作
        ->bulkActions([
            $this->bulkDeleteButton() // 批量删除按钮
            // 批量删除按钮会携带选中的主键字段, 发起 ajax 请求, 实现删除功能
        ])
        ->columns([
            amis()->TableColumn()->label('ID')->name('id')->sortable(),
            // ...
            
            // 这里是列表的行内操作按钮
            $this->rowActions([
                $this->rowEditButton(true), // 编辑按钮
                $this->rowDeleteButton(), // 删除按钮
                // 删除按钮会携带主键字段, 发起 ajax 请求, 实现删除功能
            ]),
        ]);

    return $this->baseList($crud);
}
```

<br>

## __删除逻辑__

- 通过列表上的操作按钮, 请求到 `AdminController` 中的 `destroy` 方法, 实现删除功能
- 如果有自定义删除逻辑的需求, 可以在对应的 `service` 中, 重写 `delete` 方法

```php
/**
 * 删除
 *
 * @param $ids
 *
 * @return JsonResponse|JsonResource
 */
public function destroy($ids)
{
    $rows = $this->service->delete($ids);

    return $this->autoResponse($rows, __('admin.delete'));
}

/**
 * service 中实际处理删除逻辑的方法, 可以在自己的 service 中重写该方法
 *
 * @param string $ids
 *
 * @return mixed
 */
public function delete(string $ids): mixed
{
    return $this->query()->whereIn($this->primaryKey(), explode(',', $ids))->delete();
}
```
