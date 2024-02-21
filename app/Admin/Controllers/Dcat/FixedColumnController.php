<?php

namespace App\Admin\Controllers\Dcat;

use Faker\Factory;
use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 固定列
 */
class FixedColumnController extends AdminController
{
    public function index()
    {
        if ($this->actionOfGetData()) {
            return $this->response()->success($this->fakerData());
        }

        $schema = amis()->Page()->body([
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
                // 通过添加 fixed 属性，可以固定列
                amis()->TableColumn('name', 'Name')->fixed('left')->width(200),
                Components::make()->listLongText('content', 'Content', 100)->remark('long long long...')->width(400),
                amis()->TableColumn('cost', 'Cost')->sortable()->width(100)->labelClassName('font-bold text-primary'),
                amis()->TableColumn('avg_month_cost', 'AvgMonthCost'),
                amis()->TableColumn('avg_quarter_cost', 'AvgQuarterCost'),
                amis()->TableColumn('avg_year_cost', 'AvgYearCost'),
                amis()->TableColumn('avg_month_vist', 'AvgMonthVist'),
                amis()->TableColumn('avg_quarter_vist', 'AvgQuarterVist'),
                amis()->TableColumn('avg_year_vist', 'AvgYearVist'),
                amis()->TableColumn('date', 'Date')->sortable()->width(200),
                amis()->TableColumn('created_at', 'Created At')->sortable()->width(200),
                amis()->TableColumn('updated_at', 'Updated At')->sortable()->fixed('right')->width(200),
            ]);
    }

    public function fakerData()
    {
        $faker = Factory::create();

        $data = [];

        foreach (range(1, 20) as $i) {
            $data[] = [
                'id'               => $i,
                'name'             => $faker->name,
                'content'          => $faker->text,
                'cost'             => $faker->randomFloat(2, 100, 1000),
                'avg_month_cost'   => $faker->randomFloat(2, 100, 1000),
                'avg_quarter_cost' => $faker->randomFloat(2, 100, 1000),
                'avg_year_cost'    => $faker->randomFloat(2, 100, 1000),
                'avg_month_vist'   => $faker->randomFloat(2, 100, 1000),
                'avg_quarter_vist' => $faker->randomFloat(2, 100, 1000),
                'avg_year_vist'    => $faker->randomFloat(2, 100, 1000),
                'date'             => $faker->date(),
                'created_at'       => $faker->dateTime()->format('Y-m-d H:i:s'),
                'updated_at'       => $faker->dateTime()->format('Y-m-d H:i:s'),
            ];
        }

        return $data;
    }
}
