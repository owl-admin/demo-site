<?php

namespace App\Admin\Controllers\Dcat;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 表单布局: tab
 */
class FormLayoutTabController extends AdminController
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
        return amis()->Form()->debug()->mode('horizontal')->tabs([
            amis()->Tab()->title('Basic Info')->body([
                amis()->TextControl('username', 'Username'),
                amis()->TextControl('name', 'Name'),
                amis()->TextControl('mobile', 'Mobile'),
                amis()->TextControl('email', 'Email'),
                amis()->TextareaControl('description', 'Description'),
                amis()->ImageControl('avatar', 'Avatar')->receiver(''),
            ]),
            amis()->Tab()->title('Profile')->body([
                amis()->TextControl('address', 'Address'),
                amis()->TextControl('phone', 'Phone'),
                amis()->TextControl('code', 'Code'),
            ]),
            amis()->Tab()->title('Jobs')->body([
                amis()->TableControl('jobs', 'Jobs')
                    ->addable()
                    ->draggable()
                    ->copyable()
                    ->resizable()
                    ->removable()
                    ->columns([
                        amis()->TextControl('key', 'Key')->placeholder('Input key'),
                        amis()->TextControl('value', 'Value')->placeholder('Input value'),
                        amis()->TextControl('desc', 'Desc')->placeholder('Input desc'),
                    ]),
            ]),
        ]);
    }
}
