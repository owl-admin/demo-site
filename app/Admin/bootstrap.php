<?php

use Slowlyo\OwlAdmin\Admin;


// Navbar ==========================================================================================

// Github 链接
$githubBtn = amis()
    ->UrlAction()
    ->icon('fa-brands fa-github')
    ->blank()
    ->url('https://github.com/Slowlyo/owl-admin-demo')
    ->tooltip('demo 源码')
    ->className('mr-2 rounded-full');

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
    // dev example
    [
        'id'    => 9998,
        'title' => '开发示例',
        'url'   => '/dev_example',
        'icon'  => 'vscode-icons:file-type-bolt',
        'order' => 1,
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
        'id'       => 11001,
        'title'    => 'AMIS 示例',
        'url'      => 'https://aisuda.bce.baidu.com/amis/examples/index',
        'url_type' => 2,
        'icon'     => 'twemoji:link',
        'order'    => 2,
    ],

    // dcat demo
    [
        'id'    => 200,
        'title' => 'Dcat Demo 复刻',
        'url'   => '/dcat',
        'icon'  => 'carbon:demo',
        'order' => 1,
    ],
    [
        'id'        => 201,
        'parent_id' => 200,
        'title'     => '布局',
        'url'       => '/dcat/layout',
        'icon'      => 'ri:layout-5-line',
        'order'     => 1,
    ],
    [
        'id'        => 202,
        'parent_id' => 200,
        'title'     => '列表',
        'url'       => '/dcat/list',
        'icon'      => 'material-symbols-light:lists',
        'order'     => 1,
    ],
    [
        'id'        => 203,
        'parent_id' => 202,
        'title'     => '默认表格',
        'url'       => '/dcat/list/table',
        'icon'      => 'material-symbols:backup-table-rounded',
        'order'     => 1,
    ],
]);
