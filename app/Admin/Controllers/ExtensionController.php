<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;
use Slowlyo\OwlAdmin\Admin;
use Slowlyo\OwlAdmin\Renderers\Tpl;
use Slowlyo\OwlAdmin\Renderers\Form;
use Slowlyo\OwlAdmin\Renderers\Alert;
use Slowlyo\OwlAdmin\Renderers\Dialog;
use Slowlyo\OwlAdmin\Extend\Extension;
use Slowlyo\OwlAdmin\Renderers\Drawer;
use Slowlyo\OwlAdmin\Renderers\CRUDTable;
use Slowlyo\OwlAdmin\Renderers\TextControl;
use Slowlyo\OwlAdmin\Renderers\FileControl;
use Slowlyo\OwlAdmin\Renderers\TableColumn;
use Slowlyo\OwlAdmin\Renderers\DialogAction;
use Slowlyo\OwlAdmin\Renderers\DrawerAction;
use Slowlyo\OwlAdmin\Renderers\SchemaPopOver;

class ExtensionController extends \Slowlyo\OwlAdmin\Controllers\DevTools\ExtensionController
{
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
