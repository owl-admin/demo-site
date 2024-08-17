<?php

namespace App\Admin\Controllers\DevExample\Form;

use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - 表单 - 下拉联动
 */
class SelectLinkageController extends AdminController
{
    public function index()
    {
        return $this->response()->success([
            $this->useService(),
            $this->chainedSelect(),
        ]);
    }

    public function useService()
    {
        return amis()->Card()->header(['title' => 'Service 联动'])->body([
            amis()->Form()->wrapWithPanel(false)->debug()->body([
                amis()->GroupControl()->body([
                    amis()->SelectControl('select_a', 'Select A')->options(['A', 'B', 'C', 'D', 'E']),
                    amis()->SelectControl('select_b', 'Select B')
                        ->source('get:/dev_example/form/select_linkage_options?prefix=${select_a}'),
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
        $prefix = request('prefix', 0);

        $options = collect(range(1, 10))->map(fn($i) => "{$prefix} - {$i}")->map(fn($i) => [
            'label' => $i,
            'value' => $i,
        ]);

        return $this->response()->success($options);
    }
}
