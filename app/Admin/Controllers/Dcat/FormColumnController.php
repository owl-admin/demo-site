<?php

namespace App\Admin\Controllers\Dcat;

use App\Support\Components;
use Slowlyo\OwlAdmin\Traits\IconifyPickerTrait;
use Slowlyo\OwlAdmin\Controllers\AdminController;
use Slowlyo\OwlAdmin\Services\AdminPermissionService;

/**
 * 表单字段
 */
class FormColumnController extends AdminController
{
    use IconifyPickerTrait;

    public function index()
    {
        $schema = amis()->Page()->body($this->form());

        return $this->response()->success($schema);
    }

    public function form()
    {
        $options = [];

        foreach (range(1, 10) as $i) {
            $options[] = [
                'label' => '选项' . $i,
                'value' => $i,
            ];
        }

        return amis()->Card()->body([
            amis()->Tabs()->toolbar([
                // 查看源码的按钮
                Components::make()
                    ->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]])
                    ->level('link'),
            ])->tabs([
                // Form 1
                amis()->Tab()->title('Form-1')->body(
                    amis()->Form()->mode('horizontal')->body([
                        amis()->TextControl('text', 'Text')->required()->placeholder('Input text'),
                        amis()->TextControl('password', 'Password')
                            ->type('input-password')
                            ->placeholder('Input password'),
                        amis()->TextControl('email', 'Email')->type('input-email')->placeholder('Input email'),
                        amis()->TextControl('url', 'Url')->type('input-url')->placeholder('Input url'),
                        amis()->InputColorControl('color', 'Color'),

                        amis()->Divider(),

                        amis()->PickerControl('select_table', 'Select Table')
                            ->valueField('id')
                            ->labelField('name')
                            ->source('${faker_users}')
                            ->size('lg')
                            ->pickerSchema(Components::make()->fakerUserTable()),
                        amis()->PickerControl('multiple_select_table', 'Multiple Select Table')
                            ->valueField('id')
                            ->labelField('name')
                            ->source('${faker_users}')
                            ->size('lg')
                            ->multiple()
                            ->pickerSchema(Components::make()->fakerUserTable()),
                        $this->iconifyPicker('icon', 'Icon'),
                        amis()->NumberControl('number', 'Number')->displayMode('enhance')->value(0),
                        amis()->SwitchControl('switch', 'Switch')->value(1),

                        amis()->Divider(),

                        amis()->DateControl('date', 'Date'),
                        amis()->TimeControl('time', 'Time'),
                        amis()->DateTimeControl('datetime', 'Datetime'),
                        amis()->DateRangeControl('date_range', 'Date Range'),
                        amis()->InputTimeRange()->name('time_range')->label('Time Range'),
                        amis()->InputDatetimeRange()->name('datetime_range')->label('Datetime Range'),
                        amis('control')->label('Html')->body(
                            amis()->Html()->html('<b>自定义HTML</b>')
                        ),
                        amis()->TextareaControl('textarea', 'Textarea'),

                        amis()->Divider(),

                        amis()->TableControl('table', 'Table')
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
                    ])
                ),

                // Form 2
                amis()->Tab()->title('Form-2')->body(
                    amis()->Form()->mode('horizontal')->body([
                        amis()->TagControl('tag', 'Tag')->placeholder('Input tag'),
                        amis()->SelectControl('select', 'Select')->options($options),
                        amis()->SelectControl('select_multiple', 'Select Multiple')->options($options)->multiple(),
                        amis()->ImageControl('image', 'Image')->receiver(''),
                        amis()->FileControl('multiple_file', 'Multiple File')->receiver('')->multiple(),
                        amis()->CheckboxesControl('checkbox', 'Checkbox')->options($options)->checkAll()->selectFirst(),
                        amis()->RadiosControl('radio', 'Radio')->options($options)->selectFirst(),
                        amis()->TreeControl('tree', 'Tree')
                            ->multiple()
                            ->options(AdminPermissionService::make()->getTree())
                            ->searchable()
                            ->cascade()
                            ->joinValues(false)
                            ->extractValue()
                            ->labelField('name')
                            ->valueField('id'),
                        amis()->TransferControl('transfer', 'Transfer')->options($options)->searchable(),
                        amis()->RichTextControl('editor', 'Editor'),
                    ])
                ),
            ]),
        ]);
    }
}
