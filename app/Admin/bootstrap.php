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
$versionInfo = cache()->rememberForever('demo_version_info', function () {
    $composer = \Slowlyo\OwlAdmin\Support\Composer::parse(base_path('composer.lock'))->toArray();

    $info = collect($composer['packages'])->where('name', 'slowlyo/owl-admin');

    $version  = $info->value('version');
    $updateAt = \Carbon\Carbon::parse($info->value('time'))->timezone('Asia/Shanghai')->toDateTimeString();

    return amis()
        ->Alert()
        ->className('m-0 mr-5')
        ->body(sprintf('版本: <b>%s</b> &emsp; 更新于: %s', $version, $updateAt));
});

Admin::prependNav(amis()->Flex()->items([$versionInfo, $githubBtn]));


// Menu ==========================================================================================

Admin::menu()->add([
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
]);

Admin::scripts('window.localStorage.setItem("admin-api-loginParams", "JTdCJTIydXNlcm5hbWUlMjIlM0ElMjJhZG1pbiUyMiUyQyUyMnBhc3N3b3JkJTIyJTNBJTIyYWRtaW4lMjIlN0Q=")');
