<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Route::group([
    'domain'     => config('admin.route.domain'),
    'prefix'     => config('admin.route.prefix'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->resource('dashboard', \App\Admin\Controllers\HomeController::class);

    $router->put('/user_setting', [\App\Admin\Controllers\AuthController::class, 'saveUserSetting']);

    $router->post('/login', [\App\Admin\Controllers\AuthController::class, 'login']);

    $router->post('/_settings', function (){
        return \Slowlyo\OwlAdmin\Admin::response()->fail('演示环境禁止修改设置');
    });


    $router->group(['prefix' => 'system'], function (\Illuminate\Routing\Router $router) {
        // 管理员
        $router->resource('admin_users', \App\Admin\Controllers\AdminUserController::class);
        // 菜单
        $router->resource('admin_menus', \App\Admin\Controllers\AdminMenuController::class);
        // 快速编辑
        $router->post('admin_menu_quick_save', [\App\Admin\Controllers\AdminMenuController::class, 'quickEdit']);
        // 角色
        $router->resource('admin_roles', \App\Admin\Controllers\AdminRoleController::class);
        // 权限
        $router->resource('admin_permissions', \App\Admin\Controllers\AdminPermissionController::class);

        $router->post('_admin_permissions_auto_generate', [
            \App\Admin\Controllers\AdminPermissionController::class,
            'autoGenerate',
        ]);
    });

    // 开发工具
    $router->group(['prefix' => 'dev_tools'], function (Router $router) {
        // 代码生成器
        $router->resource('code_generator', \App\Admin\Controllers\CodeGeneratorController::class);
        // 扩展
        $router->resource('extensions', \App\Admin\Controllers\ExtensionController::class);
        // 本地扩展安装
        $router->post('extensions/install', [\App\Admin\Controllers\ExtensionController::class, 'install']);
        // 启用/禁用扩展
        $router->post('extensions/enable', [\App\Admin\Controllers\ExtensionController::class, 'enable']);
        // 卸载扩展
        $router->post('extensions/uninstall', [\App\Admin\Controllers\ExtensionController::class, 'uninstall']);
        // 获取扩展配置
        $router->post('extensions/get_config', [\App\Admin\Controllers\ExtensionController::class, 'getConfig']);
        // 保存扩展配置
        $router->post('extensions/save_config', [\App\Admin\Controllers\ExtensionController::class, 'saveConfig']);
        // 获取扩展配置表单
        $router->post('extensions/config_form', [\App\Admin\Controllers\ExtensionController::class, 'configForm']);
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

    // 图片上传
    $router->any('upload_image', function () {
        return \Slowlyo\OwlAdmin\Admin::response()->fail('上传失败', 500);
    });
    // 文件上传
    $router->any('upload_file', function () {
        return \Slowlyo\OwlAdmin\Admin::response()->fail('上传失败', 500);
    });

    // 富文本编辑器上传
    $router->any('upload_rich', function () {
        return \Slowlyo\OwlAdmin\Admin::response()->fail('上传失败', 500);
    });
});
