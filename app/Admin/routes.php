<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Route::get('/admin', fn() => \Slowlyo\OwlAdmin\Admin::view());

Route::group([
    'domain'     => config('admin.route.domain'),
    'prefix'     => config('admin.route.prefix'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->resource('dashboard', \App\Admin\Controllers\HomeController::class);

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

    // iframe
    $router->resource('iframe', \App\Admin\Controllers\IframeController::class);

    // dev example
    $router->group(['prefix' => 'dev_example'], function (Router $router) {
        $router->resource('left_tree_right_table', \App\Admin\Controllers\DevExample\LeftTreeRightTableController::class)
            ->only('index');
        $router->resource('data_mapping', \App\Admin\Controllers\DevExample\DataMappingController::class);
        $router->resource('condition_builder', \App\Admin\Controllers\DevExample\ConditionBuilderController::class);
        $router->resource('blade_view', \App\Admin\Controllers\DevExample\BladeViewController::class);
        $router->resource('articles', \App\Admin\Controllers\DevExample\ArticleController::class);

        // 表单
        $router->group(['prefix' => 'form'], function (Router $router) {
            $router->get('select_linkage', [
                \App\Admin\Controllers\DevExample\Form\SelectLinkageController::class,
                'index',
            ]);
            $router->get('select_linkage_options', [
                \App\Admin\Controllers\DevExample\Form\SelectLinkageController::class,
                'options',
            ]);
        });
    });

    // dcat demo
    $router->group(['prefix' => 'dcat'], function (Router $router) {
        $router->get('statement', [\App\Admin\Controllers\Dcat\StatementController::class, 'index']);

        // 布局
        $router->get('layout', [\App\Admin\Controllers\Dcat\LayoutController::class, 'index']);

        // 列表
        $router->group(['prefix' => 'list'], function (Router $router) {
            // 默认表格
            $router->get('table', [\App\Admin\Controllers\Dcat\TableController::class, 'index']);
            $router->get('table_faker_filter', [\App\Admin\Controllers\Dcat\TableController::class, 'fakerFilter']);
            // 组合表头
            $router->get('table_head', [\App\Admin\Controllers\Dcat\TableHeadController::class, 'index']);
            // 固定列
            $router->get('fixed_column', [\App\Admin\Controllers\Dcat\FixedColumnController::class, 'index']);
            // 异步加载
            $router->get('async_table', [\App\Admin\Controllers\Dcat\AsyncTableController::class, 'index']);
            // 树形表格
            $router->get('tree_table', [\App\Admin\Controllers\Dcat\TreeTableController::class, 'index']);
            // 筛选器
            $router->get('selector', [\App\Admin\Controllers\Dcat\SelectorTableController::class, 'index']);
            // 自定义视图
            $router->get('custom', [\App\Admin\Controllers\Dcat\CustomTableController::class, 'index']);
        });

        // 表单
        $router->group(['prefix' => 'form'], function (Router $router) {
            // 表单字段
            $router->get('column', [\App\Admin\Controllers\Dcat\FormColumnController::class, 'index']);
            // 弹窗表单
            $router->get('modal', [\App\Admin\Controllers\Dcat\FormModalController::class, 'index']);
            // 分步表单
            $router->get('step', [\App\Admin\Controllers\Dcat\FormStepController::class, 'index']);
            // 表单动态显示
            $router->get('when', [\App\Admin\Controllers\Dcat\FormWhenController::class, 'index']);
            // 表单布局
            $router->group(['prefix' => 'layout'], function (Router $router) {
                // column
                $router->get('column', [\App\Admin\Controllers\Dcat\FormLayoutColumnController::class, 'index']);
                // tab
                $router->get('tab', [\App\Admin\Controllers\Dcat\FormLayoutTabController::class, 'index']);
                // raw
                $router->get('raw', [\App\Admin\Controllers\Dcat\FormLayoutRawController::class, 'index']);
            });
        });
    });
});
