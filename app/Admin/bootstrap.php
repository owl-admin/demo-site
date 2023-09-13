<?php

use Slowlyo\OwlAdmin\Admin;


// Navbar ==========================================================================================

$msgBtn = amisMake()
    ->UrlAction()
    ->icon('fa-brands fa-github')
    ->blank()
    ->url('https://github.com/Slowlyo/owl-admin-demo')
    ->tooltip('demo 源码')
    ->className('mr-2 rounded-full');

Admin::prependNav($msgBtn);


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
        'url'       => '/dev_example/left_tree_right_table',
        'icon'      => 'emojione:evergreen-tree',
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
