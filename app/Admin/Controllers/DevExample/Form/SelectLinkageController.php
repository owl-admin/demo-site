<?php

namespace App\Admin\Controllers\DevExample\Form;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - 表单 - 下拉联动
 */
class SelectLinkageController extends AdminController
{
    public function index()
    {
        return $this->response()->success([
            // 查看源码的按钮
            Components::make()->codeView([
                ['title' => 'Controller', 'language' => 'php', 'path' => __FILE__],
            ]),
            amis()->Wrapper()->size('sm'),
            $this->useSource(),
            $this->useService(),
            $this->chainedSelect(),
        ]);
    }

    public function useSource()
    {
        return amis()->Card()->header(['title' => '通过 source 联动'])->body([
            amis()->Form()->wrapWithPanel(false)->debug()->body([
                amis()->GroupControl()->body([
                    amis()->SelectControl('select_a', 'Select A')->options(['A', 'B', 'C', 'D', 'E']),
                    amis()->SelectControl('select_b', 'Select B')
                        // 在 service 中传递上一个 select 的值
                        // api 的特性: 当地址中的 参数发生变化, 会重新发起请求
                        ->source('get:/dev_example/form/select_linkage_options?prefix=${select_a}'),
                ]),
            ]),
        ]);
    }


    public function useService()
    {
        return amis()->Card()->header(['title' => '通过 Service 联动'])->body([
            // 在 service - api 中传递上一个 select 的值
            // api 的特性: 当地址中的 参数发生变化, 会重新发起请求
            amis()->Form()->wrapWithPanel(false)->debug()->body([
                amis()->Service()
                    ->api('get:/dev_example/form/select_linkage_options?fromService=1&prefix=${select_a}')
                    ->body([
                        amis()->GroupControl()->body([
                            amis()->SelectControl('select_a', 'Select A')->options(['A', 'B', 'C', 'D', 'E']),
                            amis()->SelectControl('select_b', 'Select B')->source('${options}'),
                        ]),
                    ]),
            ]),
        ]);
    }

    public function chainedSelect()
    {
        return amis()->Card()->header(['title' => 'Chained Select'])->body([
            amis()->Form()->wrapWithPanel(false)->debug()->body([
                amis()->ChainedSelectControl('chained_select')
                    ->source('get:/dev_example/form/select_linkage_options?prefix=${level}'),
            ]),
        ]);
    }

    public function options()
    {
        $prefix      = request('prefix', 0);
        $fromService = request('fromService');

        $options = collect(range(1, 10))->map(fn($i) => "{$prefix} - {$i}")->map(fn($i) => [
            'label' => $i,
            'value' => $i,
        ]);

        if ($fromService) {
            $options = compact('options');
        }

        return $this->response()->success($options);
    }
}
