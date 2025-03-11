<?php

namespace App\Admin\Controllers\Dcat;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 弹窗表单
 */
class FormModalController extends AdminController
{
    public function index()
    {
        $schema = amis()->Page()->body([
            amis()->Panel()->body([
                amis()->DialogAction()->label('Dialog')->level('success')->dialog(
                    amis()->Dialog()->title('Dialog form')->body($this->form())
                ),

                amis()->Tpl()->tpl('<br>'),
                amis()->Tpl()->tpl('<br>'),

                amis()->DrawerAction()->label('Drawer')->level('primary')->drawer(
                    amis()->Drawer()->closeOnOutside()->title('Drawer form')->body($this->form())
                ),

                amis()->Tpl()->tpl('<br>'),
                amis()->Tpl()->tpl('<br>'),
                amis()->Tpl()->tpl('<br>'),
                // 查看源码的按钮
                Components::make()->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]]),
            ]),
        ]);

        return $this->response()->success($schema);
    }

    public function form()
    {
        $options = [
            ['label' => '选项1', 'value' => 1],
            ['label' => '选项2', 'value' => 2],
        ];

        return amis()->Form()->body([
            amis()->TextControl('text', 'Text'),
            amis()->TextareaControl('textarea', 'Textarea'),
            amis()->SelectControl('select', 'Select')->options($options),
            amis()->RadiosControl('radio', 'Radio')->options($options),
            amis()->CheckboxesControl('checkbox', 'Checkbox')->options($options),
        ]);
    }
}
