<?php

namespace App\Admin\Controllers\Dcat;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 表单动态显示
 */
class FormWhenController extends AdminController
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
        $options = [
            ['value' => 'show_text', 'label' => '显示文本框'],
            ['value' => 'show_editor', 'label' => '显示编辑器'],
            ['value' => 'show_uploader', 'label' => '显示文件上传'],
        ];

        return amis()->Tabs()->tabs([
            // radio
            amis()->Tab()->title('Radio')->body([
                amis()->Form()->mode('horizontal')->body([
                    amis()->TextControl('title', 'Title')->value('单选框动态展示')->static(),
                    amis()->RadiosControl('when', 'Radio')->options($options)->selectFirst(),

                    amis()->TextControl('text', 'Text')->visibleOn('${when == "show_text"}'),
                    amis()->RichTextControl('editor', 'Editor')->visibleOn('${when == "show_editor"}'),
                    amis()->ImageControl('uploader', 'Uploader')->visibleOn('${when == "show_uploader"}'),
                ]),
            ]),

            // checkbox
            amis()->Tab()->title('Checkbox')->body([
                amis()->Form()->mode('horizontal')->body([
                    amis()->TextControl('title', 'Title')->value('复选框动态展示')->static(),
                    amis()->CheckboxesControl('when', 'Checkbox')->options($options)->selectFirst(),

                    amis()->TextControl('text', 'Text')->visibleOn('${ARRAYINCLUDES(SPLIT(when), "show_text")}'),
                    amis()->RichTextControl('editor', 'Editor')
                        ->visibleOn('${ARRAYINCLUDES(SPLIT(when), "show_editor")}'),
                    amis()->ImageControl('uploader', 'Uploader')
                        ->visibleOn('${ARRAYINCLUDES(SPLIT(when), "show_uploader")}'),
                ]),
            ]),

            // select
            amis()->Tab()->title('Select')->body([
                amis()->Form()->mode('horizontal')->body([
                    amis()->TextControl('title', 'Title')->value('下拉选框动态展示')->static(),
                    amis()->SelectControl('when', 'Select')->options($options),

                    amis()->TextControl('text', 'Text')->visibleOn('${when == "show_text"}'),
                    amis()->RichTextControl('editor', 'Editor')->visibleOn('${when == "show_editor"}'),
                    amis()->ImageControl('uploader', 'Uploader')->visibleOn('${when == "show_uploader"}'),
                ]),
            ]),

            // multiple select
            amis()->Tab()->title('MultipleSelect')->body([
                amis()->Form()->mode('horizontal')->body([
                    amis()->TextControl('title', 'Title')->value('下拉选框多选动态展示')->static(),
                    amis()->SelectControl('when', 'Selects')->options($options)->multiple(),

                    amis()->TextControl('text', 'Text')->visibleOn('${ARRAYINCLUDES(SPLIT(when), "show_text")}'),
                    amis()->RichTextControl('editor', 'Editor')
                        ->visibleOn('${ARRAYINCLUDES(SPLIT(when), "show_editor")}'),
                    amis()->ImageControl('uploader', 'Uploader')
                        ->visibleOn('${ARRAYINCLUDES(SPLIT(when), "show_uploader")}'),
                ]),
            ]),
        ]);
    }
}
