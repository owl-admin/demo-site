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

//Admin::menu()->add([
//    [
//        'id' => 9998,
//        'title' => '开发示例',
//        'url' => '/dev_example',
//        'icon' => 'vscode-icons:file-type-bolt',
//        'order' => 1
//    ],
//    [
//        'id' => 10001,
//        'parent_id' => 9998,
//        'title' => '左树右表',
//        'url' => '/dev_example/left_tree_right_table',
//        'icon' => 'emojione:evergreen-tree',
//    ]
//]);
