<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;

class AdminMenuController extends \Slowlyo\OwlAdmin\Controllers\AdminMenuController
{
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
