<?php

namespace App\Admin\Controllers\DevExample;

use Illuminate\View\View;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - Blade 页面权限控制。
 */
class BladePermissionController extends AdminController
{
    /**
     * 渲染由后台认证和权限中间件保护的 Blade iframe 页面。
     */
    public function index(): View
    {
        return view('admin.pages.blade_permission');
    }
}
