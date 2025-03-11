<?php

namespace App\Admin\Controllers\Dcat;

use Faker\Factory;
use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 组合表头
 */
class TableHeadController extends AdminController
{
    public function index()
    {
        if ($this->actionOfGetData()) {
            return $this->response()->success($this->fakerData());
        }

        $schema = amis()->Page()->body([
            app(TableController::class)->chartLine(),
            $this->table(),
        ]);

        return $this->response()->success($schema);
    }

    public function table()
    {
        return $this->baseCRUD()
            ->headerToolbar([
                // 查看源码的按钮
                Components::make()->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]]),
                ...$this->baseHeaderToolBar(),
            ])
            ->bulkActions([])
            ->filterTogglable(false)
            ->columns([
                Components::make()->listLongText('content', 'Content', 50)->remark('long long long...'),
                amis()->TableColumn('cost', 'Cost')->sortable()->labelClassName('font-bold text-primary'),
                // 通过添加 groupName 属性来分组
                amis()->TableColumn('avg_month_cost', 'AvgMonthCost')->set('groupName', 'AvgCost'),
                amis()->TableColumn('avg_quarter_cost', 'AvgQuarterCost')->set('groupName', 'AvgCost'),
                amis()->TableColumn('avg_year_cost', 'AvgYearCost')->set('groupName', 'AvgCost'),
                amis()->TableColumn('avg_month_vist', 'AvgMonthVist')->set('groupName', 'AvgVist'),
                amis()->TableColumn('avg_quarter_vist', 'AvgQuarterVist')->set('groupName', 'AvgVist'),
                amis()->TableColumn('avg_year_vist', 'AvgYearVist')->set('groupName', 'AvgVist'),
                amis()->TableColumn('date', 'Date')->sortable(),
            ]);
    }

    public function fakerData()
    {
        $faker = Factory::create();

        $data = [];

        foreach (range(1, 20) as $i) {
            $data[] = [
                'id'               => $i,
                'content'          => $faker->text,
                'cost'             => $faker->randomFloat(2, 100, 1000),
                'avg_month_cost'   => $faker->randomFloat(2, 100, 1000),
                'avg_quarter_cost' => $faker->randomFloat(2, 100, 1000),
                'avg_year_cost'    => $faker->randomFloat(2, 100, 1000),
                'avg_month_vist'   => $faker->randomFloat(2, 100, 1000),
                'avg_quarter_vist' => $faker->randomFloat(2, 100, 1000),
                'avg_year_vist'    => $faker->randomFloat(2, 100, 1000),
                'date'             => $faker->date(),
            ];
        }

        return $data;
    }
}
