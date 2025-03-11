<?php

namespace App\Admin\Controllers\Dcat;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 分步表单
 */
class FormStepController extends AdminController
{
    public function index()
    {
        $schema = amis()->Page()->body([
            // 查看源码的按钮
            Components::make()->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]])->className('mb-3'),

            amis()->Card()->body($this->form()),
        ]);

        return $this->response()->success($schema);
    }

    public function form()
    {
        return amis()->Wizard()->steps([
            amis()->Form()->title('基本信息')->mode('horizontal')->body([
                amis()->TextControl('name', '姓名'),
                amis()->NumberControl('age', '年龄'),
                amis()->RadiosControl('gender', '性别')->selectFirst()->options(['未知', '男', '女']),
                amis()->TextControl('native_place', '籍贯'),
                amis()->TextControl('home_page', '个人主页')->type('input-url'),
                amis()->TextareaControl('intro', '简介'),
            ]),
            amis()->Form()->title('兴趣爱好')->mode('horizontal')->body([
                amis()->SelectControl('love', '爱好')->options(['唱', '跳', 'Rap', '篮球']),
                amis()->TextControl('book', '书籍'),
                amis()->TextControl('music', '音乐'),
            ]),
            amis()->Form()->title('地址')->mode('horizontal')->body([
                amis()->TextControl('address', '街道地址'),
                amis()->TextControl('zip', '邮政编码'),
                amis()->TextControl('tel', '联系电话'),
            ]),
            amis()->Form()->title('Done')->mode('horizontal')->body([
                'ok',
            ]),
        ]);
    }
}
