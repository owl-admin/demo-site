<?php

namespace App\Admin\Controllers;

use App\Support\Components;

class CodeGeneratorController extends \Slowlyo\OwlAdmin\Controllers\DevTools\CodeGeneratorController
{
    public function index(): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        if ($this->actionOfGetData()) {
            return $this->response()->success($this->service->list());
        }

        return $this->response()->success(
            amis()->Page()->css($this->css())->body($this->list())
                ->toolbar(
                    Components::make()->codeView(
                        base_path('vendor/slowlyo/owl-admin/src/Controllers/DevTools/CodeGeneratorController.php')
                    )
                )
        );
    }

    private function css()
    {
        return [
            '.cxd-Table-content'                             => ['padding-bottom' => '15px'],
            '.item-comment'                                  => [
                'width'         => '220px',
                'height'        => '18px',
                'overflow'      => 'hidden',
                'text-overflow' => 'ellipsis',
                'white-space'   => 'nowrap',
                'color'         => '#a9aeb8',
                'font-size'     => '12px',
            ],
            '.column-name'                                   => [
                'max-width'     => '160px',
                'overflow'      => 'hidden',
                'text-overflow' => 'ellipsis',
                'white-space'   => 'nowrap',
                'font-weight'   => 'bold',
            ],
            '.custom-subform-item'                           => [
                'border'        => '1px solid #eee',
                'border-radius' => '4px',
                'margin'        => '5px',
                'width'         => '16%',
                'padding'       => '10px',
                'min-width'     => '220px',
                'position'      => 'relative',
            ],
            '.custom-subform-item .cxd-SubForm-valueDragBar' => [
                'position' => 'absolute',
                'top'      => '5px',
                'left'     => '10px',
            ],
            '.custom-subform-item .cxd-SubForm-valueLabel'   => [
                'margin-left' => '20px',
            ],
            '.custom-subform-item .cxd-SubForm-valueEdit'    => [
                'position' => 'absolute',
                'top'      => '5px',
                'right'    => '30px',
            ],
            '.custom-subform-item .cxd-SubForm-valueDel'     => [
                'position' => 'absolute',
                'top'      => '5px',
                'right'    => '10px',
            ],
        ];
    }
}

