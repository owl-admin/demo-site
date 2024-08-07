<?php

namespace App\Admin\Controllers\Dcat;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 表单布局: column
 */
class FormLayoutColumnController extends AdminController
{
    public function index()
    {
        $schema = amis()->Page()->body([
            // 查看源码的按钮
            Components::make()
                ->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]])
                ->className('mb-3'),

            amis()->Card()->body($this->form()),
        ]);

        return $this->response()->success($schema);
    }

    public function form()
    {
        return amis()->Form()->mode('horizontal')->columnCount(2)->body([
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
            amis()->TextControl('text', 'Text'),
        ]);
    }
}
