<?php

namespace App\Admin\Controllers;

use Slowlyo\OwlAdmin\Admin;
use App\Support\Components;
use Illuminate\Http\Request;

class ExtensionController extends \Slowlyo\OwlAdmin\Controllers\DevTools\ExtensionController
{
    public function index()
    {
        if ($this->actionOfGetData()) {
            $data = [];
            foreach (Admin::extension()->all() as $extension) {
                $data[] = $this->each($extension);
            }

            return $this->response()->success(['rows' => $data]);
        }

        $page = $this->basePage()->body($this->list())->toolbar(
            Components::make()->codeView(
                base_path('vendor/slowlyo/owl-admin/src/Controllers/DevTools/ExtensionController.php')
            )
        );

        return $this->response()->success($page);
    }

    public function store(Request $request)
    {
        return $this->response()->fail('演示环境禁止操作');
    }

    /**
     * 安装
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function install(Request $request)
    {
        return $this->response()->fail('演示环境禁止操作');
    }

    /**
     * 启用/禁用
     */
    public function enable(Request $request)
    {
        return $this->response()->fail('演示环境禁止操作');
    }

    /**
     * 卸载
     */
    public function uninstall(Request $request)
    {
        return $this->response()->fail('演示环境禁止操作');
    }

    /**
     * 保存扩展设置
     */
    public function saveConfig(Request $request)
    {
        return $this->response()->fail('演示环境禁止操作');
    }

    /**
     * 获取扩展设置
     */
    public function getConfig(Request $request)
    {
        return $this->response()->fail('演示环境禁止操作');
    }

    /**
     * 获取扩展设置表单
     */
    public function configForm(Request $request)
    {
        return $this->response()->fail('演示环境禁止操作');
    }
}
