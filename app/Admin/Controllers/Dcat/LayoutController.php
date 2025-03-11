<?php

namespace App\Admin\Controllers\Dcat;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 布局示例
 */
class LayoutController extends AdminController
{
    public function index()
    {
        $card = fn($className, $text) => amis()->Card()->className($className)->body($text);

        $schema = amis()->Page()->body([
            // 查看源码的按钮
            Components::make()
                ->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]])
                ->className('mb-3'),

            // 一行一列
            amis()->Grid()->columns([
                amis()->GridColumn()->md(12)->body([$card('bg-cyan-300 h-32', 'col-md-12')]),
            ]),
            // 一行三列
            amis()->Grid()->className('mt-2')->columns([
                amis()->GridColumn()->md(4)->body([$card('bg-indigo-300 h-32', 'col-md-4')]),
                amis()->GridColumn()->md(4)->body([$card('bg-indigo-300 h-32', 'col-md-4')]),
                amis()->GridColumn()->md(4)->body([$card('bg-indigo-300 h-32', 'col-md-4')]),
            ]),
            // 一行两列
            amis()->Grid()->className('mt-2')->columns([
                amis()->GridColumn()->md(9)->valign('between')->body([
                    // 一行一列
                    amis()->Grid()->columns([
                        amis()->GridColumn()->md(12)->body([$card('bg-cyan-300 h-28', 'col-md-12')]),
                    ]),
                    // 一行三列
                    amis()->Grid()->className('mt-9')->columns([
                        amis()->GridColumn()->md(4)->body([$card('bg-blue-200 h-full', 'col-md-4')]),
                        amis()->GridColumn()->md(4)->body([$card('bg-blue-200 h-full', 'col-md-4')]),
                        amis()->GridColumn()->md(4)->className('h-full')->body([
                            // 一行两列
                            amis()->Grid()->className('h-full')->columns([
                                amis()->GridColumn()->md(6)->body([$card('bg-blue-300 h-full', 'col-md-6')]),
                                amis()->GridColumn()->md(6)->body([$card('bg-blue-300 h-full', 'col-md-6')]),
                            ]),
                        ]),
                    ]),
                ]),
                amis()->GridColumn()->md(3)->body([$card('bg-blue-400 h-full', 'col-md-4')]),
            ]),
        ]);

        return $this->response()->success($schema);
    }
}
