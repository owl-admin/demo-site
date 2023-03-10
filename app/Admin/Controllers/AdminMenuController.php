<?php

namespace App\Admin\Controllers;

use App\Support\Components;
use Illuminate\Http\Request;
use Slowlyo\OwlAdmin\Renderers\Page;

class AdminMenuController extends \Slowlyo\OwlAdmin\Controllers\AdminMenuController
{
    public function list(): Page
    {
        return parent::list()->toolbar(
            Components::make()->codeView(base_path('vendor/slowlyo/owl-admin/src/Controllers/AdminMenuController.php'))
        );
    }

    public function quickEdit()
    {
        return $this->response()->fail('演示环境禁止操作');
    }

    public function destroy($ids)
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }

    public function store(Request $request)
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }

    public function update(Request $request)
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }
}
