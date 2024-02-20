<?php

namespace App\Admin\Controllers\Dcat;

use Faker\Factory;
use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 默认表格
 */
class TableController extends AdminController
{
    public function index()
    {
        // 模拟数据
        if ($this->actionOfGetData()) {
            return $this->response()->success($this->fakerData());
        }

        // 页面结构
        $schema = amis()->Page()->body([
            amis()->Grid()->className('mt-2')->columns([
                amis()->GridColumn()->md(4)->body($this->totalUsers()),
                amis()->GridColumn()->md(4)->body($this->newUsers()),
                amis()->GridColumn()->md(4)->body($this->newDevices()),
            ]),
            $this->table(),
        ]);

        return $this->response()->success($schema);
    }

    /**
     * 表格结构
     *
     * @return \Slowlyo\OwlAdmin\Renderers\CRUDTable
     */
    public function table()
    {
        $language = (object)['PHP', 'JAVA', 'GO', 'C'];
        $methods  = (object)['GET', 'POST', 'PUT', 'DELETE'];

        return $this->baseCRUD()
            ->headerToolbar([
                // 查看源码的按钮
                Components::make()->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]]),
                ...$this->baseHeaderToolBar(),
            ])
            ->quickSaveApi('')
            ->quickSaveItemApi('')
            ->bulkActions([])
            ->footable()
            ->data(['methods' => $methods])
            ->filterTogglable(false)
            ->columns([
                amis()->TableColumn('id', 'Id'),

                amis()->TableColumn('label', 'Label')->type('each')->items(
                    amis()->Tpl()->tpl('<span class="label label-info mr-2">${item}</span>')
                ),

                amis()->TableColumn('progress_bar', 'Progress Bar')->type('progress'),

                amis()->TableColumn('select', 'Select')
                    ->type('select')
                    ->options($methods)
                    ->value('GET')
                    ->size('sm'),

                amis()->TableColumn('switch', 'Switch')->type('switch'),

                amis()->TableColumn('switch_group', 'Switch Group')
                    ->type('form')
                    ->mode('horizontal')
                    ->wrapWithPanel(false)
                    ->body([
                        amis()->SwitchControl('is_new', 'is_new:'),
                        amis()->SwitchControl('is_hot', 'is_hot:'),
                        amis()->SwitchControl('publishd', 'publishd:'),
                    ]),

                amis()->TableColumn('checkbox', 'Check Box')->quickEdit(
                    amis()->CheckboxesControl()->inline(false)->options($methods)
                )->type('each')->items(
                    amis()->Tpl()->tpl('<span class="label label-info mr-2">${methods[item]}</span>')
                ),

                amis()->TableColumn('radio', 'Radio')->type('mapping')->map($language)->quickEdit(
                    amis()->RadiosControl()->inline(false)->options($language)
                ),

                amis()->TableColumn('more')->breakpoint('*')->type('table')->columns([
                    amis()->TableColumn('name', 'Name'),
                    amis()->TableColumn('email', 'Email'),
                    amis()->TableColumn('date', 'Date'),
                ]),
            ]);
    }

    public function totalUsers()
    {
        return amis()->Service()->api('/dcat/list/table_faker_filter?q=${q}&type=total_users')->body([
            amis()->Card()
                ->className('h-48')
                ->header(['title' => 'Total Users'])
                ->toolbar([$this->filterSelect('q')])
                ->body([
                    amis()->Tpl()->tpl('<span class="text-3x font-medium">${num}</span>'),
                    amis()->Tpl()
                        ->tpl('<div class="pt-3 font-medium"><span class="text-success">${percent}%</span> Increase</div>'),
                ]),
        ]);
    }

    public function newUsers()
    {
        return amis()->Card()
            ->className('h-48')
            ->header(['title' => 'New Users'])
            ->toolbar([$this->filterSelect('a')])
            ->body([
                amis()->Chart()->height(100)->api('/dcat/list/table_faker_filter?q=${a}&type=new_users')->config([
                    'xAxis'   => ['show' => false, 'data' => '${date}'],
                    'yAxis'   => ['show' => false],
                    'tooltip' => ['trigger' => 'axis', 'position' => [10, 10]],
                    'grid'    => ['left' => -50, 'right' => -50, 'top' => 0, 'bottom' => 0],
                    'series'  => [
                        [
                            'name'      => 'New Users',
                            'data'      => '${list}',
                            'type'      => 'line',
                            'smooth'    => true,
                            'areaStyle' => [],
                        ],
                    ],
                ]),
            ]);
    }

    public function newDevices()
    {
        return amis()->Card()
            ->className('h-48')
            ->header(['title' => 'New Devices'])
            ->toolbar([$this->filterSelect('q')])
            ->body([
                amis()->Chart()->height(100)->api('/dcat/list/table_faker_filter?q=${q}&type=new_devices')->config([
                    'tooltip' => ['trigger' => 'item', 'position' => [10, 10]],
                    'legend'  => ['top' => 'center', 'left' => 'start', 'orient' => 'vertical'],
                    'series'  => [
                        [
                            'type'      => 'pie',
                            'radius'    => ['60%', '100%'],
                            'label'     => ['show' => false, 'position' => 'center'],
                            'labelLine' => ['show' => false],
                            'data'      => [
                                ['value' => '${desktop}', 'name' => 'Desktop'],
                                ['value' => '${mobile}', 'name' => 'Mobile'],
                            ],
                        ],
                    ],
                ]),
            ]);
    }

    /**
     * 下拉选择框
     *
     * @param $name
     *
     * @return \Slowlyo\OwlAdmin\Renderers\SelectControl
     */
    public function filterSelect($name)
    {
        return amis()->SelectControl($name)->value(7)->size('sm')->options([
            7   => 'Last 7 Days',
            28  => 'Last 28 Days',
            30  => 'Last Month',
            365 => 'Last Year',
        ]);
    }

    /**
     * 模拟表格数据
     *
     * @return array
     */
    public function fakerData()
    {
        $faker = Factory::create();

        $roundArr = function ($len) use ($faker) {
            $data = [];
            for ($i = 0; $i < $len; $i++) {
                $data[] = [
                    'name'  => $faker->name,
                    'email' => $faker->email,
                    'date'  => $faker->date,
                ];
            }

            return $data;
        };

        $data = [];
        for ($i = 0; $i < 10; $i++) {
            $data[] = [
                'id'           => $i + 1,
                'label'        => array_pad([], mt_rand(1, 2), $faker->name()),
                'progress_bar' => mt_rand(1, 100),
                'switch'       => mt_rand(0, 1),
                'editable'     => mt_rand(0, 14),
                'checkbox'     => value(function () use ($faker) {
                    $values = [];
                    for ($i = 0; $i < mt_rand(1, 4); $i++) {
                        $values[] = mt_rand(0, 3);
                    }
                    return array_values(array_unique($values));
                }),
                'select'       => mt_rand(0, 3),
                'radio'        => mt_rand(0, 3),
                'is_new'       => mt_rand(0, 1),
                'is_hot'       => mt_rand(0, 1),
                'published'    => mt_rand(0, 1),
                'more'         => $roundArr(mt_rand(1, 3)),
            ];
        }
        return $data;
    }

    /**
     * 模拟图表数据
     *
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
     */
    public function fakerFilter()
    {
        $q = request('q');

        $data = [];
        switch (request('type')) {
            case 'total_users':
                $data['num']     = $q * mt_rand(10, 100);
                $data['percent'] = mt_rand(1, 100);
                break;
            case 'new_users':
                $data['date'] = collect(today()->subDays($q - 1)->daysUntil(today()))
                    ->map(fn($i) => $i->toDateString())
                    ->all();
                $data['list'] = value(function () use ($q) {
                    $data = [];
                    for ($i = 0; $i < $q; $i++) {
                        $data[] = mt_rand(50, 100);
                    }
                    return $data;
                });
                break;
            case 'new_devices':
                $data['desktop'] = mt_rand(100, 1000);
                $data['mobile']  = mt_rand(100, 1000);
                break;
        }

        return $this->response()->success($data);
    }
}
