<?php

namespace App\Admin\Controllers;

use App\Support\Components;
use Illuminate\Http\Request;

class CodeGeneratorController extends \Slowlyo\OwlAdmin\Controllers\DevTools\CodeGeneratorController
{
    public function index(): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        $page = amisMake()->Page()
            ->title(__('admin.code_generator'))
            ->body($this->form())
            ->toolbar(
                Components::make()->codeView(
                    base_path('vendor/slowlyo/owl-admin/src/Controllers/DevTools/CodeGeneratorController.php')
                )
            )
            ->remark(
                __('admin.code_generators.remark1') .
                "<a href='https://learnku.com/docs/laravel/9.x/migrations/12248#b419dd' target='_blank'>" .
                __('admin.code_generators.remark2') .
                "</a>, " . __('admin.code_generators.remark3')
            );

        return $this->response()->success($page);
    }

    public function store(Request $request): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }
}
