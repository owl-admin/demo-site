<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;
use Slowlyo\SlowAdmin\Admin;
use Slowlyo\SlowAdmin\Renderers\Tpl;
use Slowlyo\SlowAdmin\Renderers\Form;
use Slowlyo\SlowAdmin\Renderers\Alert;
use Slowlyo\SlowAdmin\Renderers\Dialog;
use Slowlyo\SlowAdmin\Extend\Extension;
use Slowlyo\SlowAdmin\Renderers\Drawer;
use Slowlyo\SlowAdmin\Renderers\CRUDTable;
use Slowlyo\SlowAdmin\Renderers\TextControl;
use Slowlyo\SlowAdmin\Renderers\FileControl;
use Slowlyo\SlowAdmin\Renderers\TableColumn;
use Slowlyo\SlowAdmin\Renderers\DialogAction;
use Slowlyo\SlowAdmin\Renderers\DrawerAction;
use Slowlyo\SlowAdmin\Renderers\SchemaPopOver;

class ExtensionController extends \Slowlyo\SlowAdmin\Controllers\DevTools\ExtensionController
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
