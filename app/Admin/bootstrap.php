<?php

use Slowlyo\OwlAdmin\Admin;


$footer = '<a href="https://github.com/slowlyo/owl-admin" target="_blank" class="font-bold">Owl Admin</a>
<span>&emsp;&emsp;站点将在每天 0:00 重置</span>';

config()->set('admin.layout.footer', $footer);

// Navbar ==========================================================================================

// Github 链接
$githubBtn = amis()
    ->UrlAction()
    ->icon('fa-brands fa-github')
    ->blank()
    ->url('https://github.com/Slowlyo/owl-admin-demo')
    ->tooltip('demo 源码')
    ->iconClassName('text-xl pt-1')
    ->className('mr-2 bcustom_order-0 hover:bcustom_order-0');

// 版本信息
$composer = \Slowlyo\OwlAdmin\Support\Composer::parse(base_path('composer.lock'))->toArray();
$info     = collect($composer['packages'])->where('name', 'slowlyo/owl-admin');

$version = $info->value('version');
$diff    = \Carbon\Carbon::parse($info->value('time'))->timezone('Asia/Shanghai')->diffForHumans(now());

$versionInfo = amis()
    ->Alert()
    ->className('m-0 mr-5')
    ->body(sprintf('Version: <b>%s</b> (%s)', $version, $diff));

Admin::prependNav(amis()->Flex()->items([$versionInfo, $githubBtn]));

// 密码填充
Admin::scripts('window.localStorage.setItem("admin-api-loginParams", "JTdCJTIydXNlcm5hbWUlMjIlM0ElMjJhZG1pbiUyMiUyQyUyMnBhc3N3b3JkJTIyJTNBJTIyYWRtaW4lMjIlN0Q=")');

// Menu ==========================================================================================

Admin::menu()->add([
    // region dev example
    [
        'id'           => 9998,
        'title'        => '开发示例',
        'url'          => '/dev_example',
        'icon'         => 'vscode-icons:file-type-bolt',
        'custom_order' => 1,
    ],
    [
        'id'        => 10001,
        'parent_id' => 9998,
        'title'     => '左树右表',
        'url'       => '/dev_example/left_tree_right_table?tree=1',
        'icon'      => 'emojione:evergreen-tree',
    ],
    [
        'id'        => 10002,
        'parent_id' => 9998,
        'title'     => '数据映射',
        'url'       => '/dev_example/data_mapping',
        'icon'      => 'icon-park:data-display',
    ],
    [
        'id'        => 10003,
        'parent_id' => 9998,
        'title'     => '条件组合查询',
        'url'       => '/dev_example/condition_builder',
        'icon'      => 'carbon:model-builder',
    ],
    [
        'id'        => 10004,
        'parent_id' => 9998,
        'title'     => '使用 blade 视图',
        'url'       => '/dev_example/blade_view',
        'icon'      => 'vscode-icons:file-type-blade',
    ],
    [
        'id'        => 10005,
        'parent_id' => 9998,
        'title'     => 'CRUD 示例 (文章)',
        'url'       => '/dev_example/articles',
        'icon'      => 'fluent-emoji-flat:bookmark-tabs',
    ],
    [
        'id'        => 10006,
        'parent_id' => 9998,
        'title'     => '表单',
        'url'       => '/dev_example/form',
        'icon'      => 'twemoji:avocado',
    ],
    [
        'id'        => 100061,
        'parent_id' => 10006,
        'title'     => '下拉联动',
        'url'       => '/dev_example/form/select_linkage',
        'icon'      => 'hugeicons:cursor-magic-selection-02',
    ],
    // endregion

    [
        'id'           => 11001,
        'title'        => 'AMIS 示例',
        'url'          => 'https://aisuda.bce.baidu.com/amis/examples/index',
        'url_type'     => 2,
        'icon'         => 'twemoji:link',
        'custom_order' => 2,
    ],
    [
        'id'           => 12001,
        'title'        => 'iframe',
        'url'          => '/iframe',
        'icon'         => 'material-symbols:iframe-outline-rounded',
        'custom_order' => 2,
    ],

    // region dcat demo
    [
        'id'           => 200,
        'title'        => 'Dcat Demo',
        'url'          => '/dcat',
        'icon'         => 'carbon:demo',
        'custom_order' => 1,
    ],
    [
        'id'        => 201,
        'parent_id' => 200,
        'title'     => '布局',
        'url'       => '/dcat/layout',
        'icon'      => 'ri:layout-5-line',
    ],
    [
        'id'        => 202,
        'parent_id' => 200,
        'title'     => '列表',
        'url'       => '/dcat/list',
        'icon'      => 'material-symbols-light:lists',
    ],
    [
        'id'        => 203,
        'parent_id' => 202,
        'title'     => '默认表格',
        'url'       => '/dcat/list/table',
        'icon'      => 'material-symbols:backup-table-rounded',
    ],
    [
        'id'        => 204,
        'parent_id' => 202,
        'title'     => '组合表头',
        'url'       => '/dcat/list/table_head',
        'icon'      => 'mdi:table-headers-eye',
    ],
    [
        'id'        => 205,
        'parent_id' => 202,
        'title'     => '固定列',
        'url'       => '/dcat/list/fixed_column',
        'icon'      => 'tabler:freeze-row-column',
    ],
    [
        'id'        => 206,
        'parent_id' => 202,
        'title'     => '异步加载',
        'url'       => '/dcat/list/async_table',
        'icon'      => 'carbon:async',
    ],
    [
        'id'        => 207,
        'parent_id' => 202,
        'title'     => '树形表格',
        'url'       => '/dcat/list/tree_table',
        'icon'      => 'clarity:tree-view-line',
    ],
    [
        'id'        => 208,
        'parent_id' => 202,
        'title'     => '筛选器',
        'url'       => '/dcat/list/selector',
        'icon'      => 'material-symbols:filter-alt-outline-sharp',
    ],
    [
        'id'        => 209,
        'parent_id' => 202,
        'title'     => '自定义视图',
        'url'       => '/dcat/list/custom',
        'icon'      => 'material-symbols:dashboard-customize-outline',
    ],
    [
        'id'        => 210,
        'parent_id' => 200,
        'title'     => '表单',
        'url'       => '/dcat/form',
        'icon'      => 'material-symbols:format-image-right-rounded',
    ],
    [
        'id'        => 211,
        'parent_id' => 210,
        'title'     => '表单字段',
        'url'       => '/dcat/form/column',
        'icon'      => 'bi:list-columns',
    ],
    [
        'id'        => 212,
        'parent_id' => 210,
        'title'     => '弹窗表单',
        'url'       => '/dcat/form/modal',
        'icon'      => 'material-symbols:dialogs-outline-rounded',
    ],
    [
        'id'        => 213,
        'parent_id' => 210,
        'title'     => '分步表单',
        'url'       => '/dcat/form/step',
        'icon'      => 'streamline:steps-number',
    ],
    [
        'id'        => 214,
        'parent_id' => 210,
        'title'     => '表单动态显示',
        'url'       => '/dcat/form/when',
        'icon'      => 'material-symbols:dynamic-form-outline',
    ],
    [
        'id'        => 215,
        'parent_id' => 210,
        'title'     => '表单布局',
        'url'       => '/dcat/form/layout',
        'icon'      => 'ri:layout-3-line',
    ],
    [
        'id'        => 216,
        'parent_id' => 215,
        'title'     => 'Column布局',
        'url'       => '/dcat/form/layout/column',
        'icon'      => 'material-symbols:view-column-2-outline',
    ],
    [
        'id'        => 217,
        'parent_id' => 215,
        'title'     => 'Tab布局',
        'url'       => '/dcat/form/layout/tab',
        'icon'      => 'material-symbols:tabs-outline',
    ],
    [
        'id'        => 218,
        'parent_id' => 215,
        'title'     => 'Raw布局',
        'url'       => '/dcat/form/layout/raw',
        'icon'      => 'material-symbols:featured-play-list-outline',
    ],

    [
        'id'        => 299,
        'parent_id' => 200,
        'title'     => '说明',
        'url'       => '/dcat/statement',
        'icon'      => 'noto:warning',
    ],

    // endregion
]);
