<?php

namespace App\Admin\Controllers;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

class IframeController extends AdminController
{
    public function index()
    {
        $schema = $this->basePage()->bodyClassName('custom-page')->css([
            '.bg-\[var\(--owl-body-bg\)\]' => ['background' => 'white'],
            '.custom-page'                 => ['height' => 'calc(100vh - 65px)', 'overflow' => 'hidden'],
            '.owl-container'                         => ['padding' => '0 !important'],
        ])->body([
            // 查看源码的按钮
            Components::make()
                ->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]])
                ->className('absolute top-32 right-4')
                ->level('success'),

            amis()->IFrame()->className('my-iframe')->src('http://doc.owladmin.com'),
        ]);

        return $this->response()->success($schema);
    }
}
