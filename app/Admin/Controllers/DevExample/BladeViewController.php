<?php

namespace App\Admin\Controllers\DevExample;

use App\Models\User;
use App\Support\Components;
use Illuminate\Http\Request;
use App\Services\DataMappingService;
use Illuminate\Support\Facades\Http;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - 条件组合查询
 *
 * @property DataMappingService $service
 */
class BladeViewController extends AdminController
{
    public function index()
    {
        $schema = $this->basePage()->body([
            // 查看源码的按钮
            Components::make()->codeView([
                ['title' => 'Controller', 'language' => 'php', 'path' => __FILE__],
                ['title' => 'View', 'language' => 'php', 'path' => resource_path('views/welcome.blade.php')],
            ]),

            amis()->Card()->className('mt-4')->body(
                view('welcome')->render(), // amis 支持直接渲染 html
            )
        ]);

        return $this->response()->success($schema);
    }
}
