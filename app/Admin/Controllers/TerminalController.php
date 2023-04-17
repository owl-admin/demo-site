<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;

class TerminalController extends \Slowlyo\OwlAdmin\Controllers\DevTools\TerminalController{
    public function preload(Request $request)
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }

    public function exec(Request $request)
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }
}
