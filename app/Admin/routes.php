<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Route::group([
    'domain'     => config('admin.route.domain'),
    'prefix'     => config('admin.route.prefix'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->resource('home', \App\Admin\Controllers\HomeController::class);

    $router->put('/user_setting/{id}', [\App\Admin\Controllers\AuthController::class, 'saveUserSetting']);

    $router->post('/login', [\App\Admin\Controllers\AuthController::class, 'login']);

    // 管理员
    $router->resource('admin_users', \App\Admin\Controllers\AdminUserController::class);
    // 菜单
    $router->resource('admin_menus', \App\Admin\Controllers\AdminMenuController::class);
    // 角色
    $router->resource('admin_roles', \App\Admin\Controllers\AdminRoleController::class);
    // 权限
    $router->resource('admin_permissions', \App\Admin\Controllers\AdminPermissionController::class);

    // 开发工具
    $router->group(['prefix' => 'dev_tools'], function (Router $router) {
        // 代码生成器
        $router->resource('code_generator', \App\Admin\Controllers\CodeGeneratorController::class);
    });

    // example
    $router->group(['prefix' => 'example'], function (Router $router) {
        // form
        $router->get('form', [\App\Admin\Controllers\Example\FormController::class, 'index']);
        $router->get('form_all', [\App\Admin\Controllers\Example\FormController::class, 'all']);
        $router->get('reaction', [\App\Admin\Controllers\Example\FormController::class, 'reaction']);
        $router->get('condition_builder', [\App\Admin\Controllers\Example\FormController::class, 'conditionBuilder']);
        $router->get('dialog', [\App\Admin\Controllers\Example\FormController::class, 'dialog']);
        $router->get('tabs', [\App\Admin\Controllers\Example\FormController::class, 'tabs']);
        $router->get('wizard', [\App\Admin\Controllers\Example\FormController::class, 'wizard']);
    });
});
