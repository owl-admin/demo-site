<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;

class CodeGeneratorController extends \Slowlyo\OwlAdmin\Controllers\DevTools\CodeGeneratorController
{
    public function store(Request $request): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }
}
