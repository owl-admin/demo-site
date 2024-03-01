## 主要逻辑方法

| 方法         | 说明   |
|:-----------|:-----|
| __store__  | 新增数据 |
| __update__ | 修改数据 |
| __delete__ | 删除数据 |
| __list__   | 查询数据 |

<br>

## 经常需要重写的方法

| 方法               | 说明                           |
|:-----------------|:-----------------------------|
| __addRelations__ | 添加关联关系                       |
| __sortable__     | 排序 (注意: 原方法中带有部分逻辑, 重写需要留意)  |
| __searchable__   | 搜索  (注意: 原方法中带有部分逻辑, 重写需要留意) |
| __sortColumn__   | 排序字段                         |
| __saving__       | 保存前                          |
| __saved__        | 保存后                          |
| __deleted__      | 删除后                          |

<br>

## 方法列表

```php

/**
 * service 中查询使用的模型
 */
public function getModel(){}

/**
 * 获取主键名称
 */
public function primaryKey(){}

/**
 * 详情 获取数据
 *
 * @param $id
 *
 * @return Builder|Builder[]|\Illuminate\Database\Eloquent\Collection|Model|null
 */
public function getDetail($id){}

/**
 * 编辑 获取数据
 *
 * @param $id
 *
 * @return Model|\Illuminate\Database\Eloquent\Collection|Builder|array|null
 */
public function getEditData($id){}

/**
 * 列表 获取查询
 *
 * @return Builder
 */
public function listQuery(){}

/**
 * 添加关联关系
 *
 * 预留钩子, 方便处理只需要添加 [关联] 的情况
 *
 * @param        $query
 * @param string $scene 场景: list, detail, edit
 *
 * @return void
 */
public function addRelations($query, string $scene = 'list'){}

/**
 * 排序
 *
 * @param $query
 *
 * @return void
 */
public function sortable($query){}

/**
 * 搜索
 *
 * @param $query
 *
 * @return void
 */
public function searchable($query){}

/**
 * 列表 排序字段
 *
 * @return string
 */
public function sortColumn(){}

/**
 * 修改
 *
 * @param $primaryKey
 * @param $data
 *
 * @return bool
 */
public function update($primaryKey, $data){}

/**
 * 新增
 *
 * @param $data
 *
 * @return bool
 */
public function store($data){}

/**
 * 删除
 *
 * @param string $ids
 *
 * @return mixed
 */
public function delete(string $ids){}

/**
 * 快速编辑
 *
 * @param $data
 *
 * @return true
 */
public function quickEdit($data){}

/**
 * 快速编辑单条
 *
 * @param $data
 *
 * @return bool
 */
public function quickEditItem($data){}

/**
 * saving 钩子 (执行于新增/修改前)
 *
 * 可以通过判断 $primaryKey 是否存在来判断是新增还是修改
 *
 * @param $data
 * @param $primaryKey
 *
 * @return void
 */
public function saving($data, $primaryKey = ''){}

/**
 * saved 钩子 (执行于新增/修改后)
 *
 * 可以通过 $isEdit 来判断是新增还是修改
 *
 * @param $model
 * @param $isEdit
 *
 * @return void
 */
public function saved($model, $isEdit = false){}

/**
 * deleted 钩子 (执行于删除后)
 *
 * @param $ids
 *
 * @return void
 */
public function deleted($ids){}
```
