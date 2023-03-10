<?php

namespace App\Admin\Controllers;

use App\Support\Components;

class HomeController extends \Slowlyo\OwlAdmin\Controllers\HomeController
{
    public function index(): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        $page = $this->basePage()->css($this->css())->body([
            amisMake()->Grid()->columns([
                $this->frameworkInfo()->md(5),
                amisMake()->Flex()->items([$this->pieChart(), $this->cube()]),
            ]),
            amisMake()->Grid()->columns([
                $this->lineChart()->md(8),
                amisMake()
                    ->Flex()
                    ->className('h-full')
                    ->items([$this->clock(), $this->giteeWidget()])
                    ->direction('column'),
            ]),
        ])->toolbar(
            Components::make()->codeView(
                base_path('vendor/slowlyo/owl-admin/src/Controllers/HomeController.php')
            )
        );

        return $this->response()->success($page);
    }

    private function css(): array
    {
        return [
            '.amis-scope .clear-card-mb'                 => [
                'margin-bottom' => '0 !important',
            ],
            '.amis-scope .cxd-Image'                     => [
                'border' => '0',
            ],
            '.amis-scope .bg-blingbling'                 => [
                'color'             => '#fff',
                'background'        => 'linear-gradient(to bottom right, #2C3E50, #FD746C, #FF8235, #ffff1c, #92FE9D, #00C9FF, #a044ff, #e73827)',
                'background-repeat' => 'no-repeat',
                'background-size'   => '1000% 1000%',
                'animation'         => 'gradient 60s ease infinite',
            ],
            '@keyframes gradient'                        => [
                '0%{background-position:0% 0%}
                  50%{background-position:100% 100%}
                  100%{background-position:0% 0%}',
            ],
            '.amis-scope .bg-blingbling .cxd-Card-title' => [
                'color' => '#fff',
            ],
        ];
    }
}
