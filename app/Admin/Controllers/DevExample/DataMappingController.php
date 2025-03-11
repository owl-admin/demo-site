<?php

namespace App\Admin\Controllers\DevExample;

use App\Support\Components;
use App\Services\DataMappingService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - 数据映射
 *
 * @property DataMappingService $service
 */
class DataMappingController extends AdminController
{
    public string $serviceName = DataMappingService::class;

    public function list()
    {
        return $this->baseCRUD()
            ->headerToolbar([
                amis('reload'),
                // 查看源码的按钮
                Components::make()->codeView([
                    ['title' => 'Controller', 'language' => 'php', 'path' => __FILE__],
                    [
                        'title'    => 'Service',
                        'language' => 'php',
                        'path'     => app_path('/Services/DataMappingService.php'),
                    ],
                ])->align('right'),
            ])
            ->footable()
            ->data([
                'genderMap'   => $this->service->genderMap(),
                'categoryMap' => $this->service->categoryMap(),
            ])->columns([
                amis()->TableColumn('id', 'ID'),
                // Mapping 组件
                amis()->TableColumn('category', '类型 (Mapping组件)')
                    ->type('mapping')
                    ->map($this->service->categoryMap()),
                // Each 组件
                amis()->TableColumn('categories', '类型 (Each组件)')
                    ->type('each')
                    ->items(
                        amis()->Tpl()->tpl('<p><%= this.categoryMap[this.item] %></p>')
                    ),
                // Status 组件
                amis()->TableColumn('state', '状态 (Status组件)')->type('status'),
                // Mapping 组件渲染 Tag 组件
                amis()->TableColumn('category', '类型 (Tag)')
                    ->type('mapping')
                    ->map($this->service->categoryTagMap()),
                // 表达式
                amis()->TableColumn('${genderMap[gender]}', '性别 (表达式)'),
                amis()->TableColumn('deep.title', '多维数据'),
                amis()->TableColumn('${index}', '行索引'),
                amis()->TableColumn('${items[index]}', '行数据')->breakpoint('*')->type('json')->jsonTheme('eighties'),
            ]);
    }
}
