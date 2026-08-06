<?php

use App\Admin\Controllers\DevExample\BladePermissionController;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Slowlyo\OwlAdmin\Admin;

Route::group([
    'domain'     => Admin::config('admin.route.domain'),
    'prefix'     => trim(Admin::config('admin.route.prefix') . '/' . Admin::config('admin.iframe_page.route_prefix'), '/'),
    'middleware' => Admin::config('admin.route.middleware'),
], function (Router $router) {
    // 该路由必须经过 admin.permission，避免仅隐藏菜单却仍可直接访问 Blade 页面。
    $router->get('blade_permission', [BladePermissionController::class, 'index']);
});
