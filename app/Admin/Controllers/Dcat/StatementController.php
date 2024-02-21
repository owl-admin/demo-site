<?php

namespace App\Admin\Controllers\Dcat;

use Slowlyo\OwlAdmin\Controllers\AdminController;

class StatementController extends AdminController
{
    public function index()
    {
        $schema = amis()->Page()->body([
            amis()->Card()->body(
                amis()->Markdown()->value('
## 本栏参考自 Dcat Admin 官方 Demo

- 👉 [Dcat Adin Demo 源码](https://github.com/jqhph/dcat-admin-demo)
- Dcat Admin 是一个非常优秀的 Laravel 后台框架, 感谢前人的肩膀~ ([@jqhph](https://github.com/jqhph))
')
            ),
        ]);

        return $this->response()->success($schema);
    }
}
