<?php

namespace App\Admin\Controllers\Dcat;

use Faker\Factory;
use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 异步加载
 */
class AsyncTableController extends AdminController
{
    public function index()
    {
        if ($this->actionOfGetData()) {
            if ($type = request('type')) {
                return $this->response()->success($this->asyncSchema($type));
            }

            return $this->response()->success($this->fakerData());
        }

        $schema = amis()->Page()->body([$this->table()]);

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
                Components::make()->listLongText('content', 'Content', 100)->remark('long long long...')->width(400),
                amis()->TableColumn('cost', 'Cost')->sortable()->width(100)->labelClassName('font-bold text-primary'),
                // 表单
                amis()->DialogAction()->label('异步表单')->level('link')->icon('fa fa-edit')->dialog(
                    amis()->Dialog()->title('弹窗标题')->body(
                        amis()->Service()->schemaApi('get:' . $this->getListGetDataPath() . '&type=form')
                    )
                ),
                // 表格
                amis()->DialogAction()->label('异步表格')->level('link')->icon('fa fa-table')->dialog(
                    amis()->Dialog()->size('lg')->title('弹窗标题')->body(
                        amis()->Service()->schemaApi('get:' . $this->getListGetDataPath() . '&type=table')
                    )
                ),
                amis()->TableColumn('avg_quarter_cost', 'AvgQuarterCost'),
                amis()->TableColumn('avg_year_cost', 'AvgYearCost'),
                amis()->TableColumn('date', 'Date')->sortable()->width(200),
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

    public function asyncSchema($type)
    {
        $schema = '';
        switch ($type) {
            case 'form':
                $schema = amis()->Form()->wrapWithPanel(false)->mode('horizontal')->body([
                    amis()->TextControl('name', 'Name')->placeholder('请输入名称')->required(),
                    amis()->ImageControl('avatar', 'Avatar')->disabled(),
                    amis()->TextControl('owl_password', 'Old Password')->type('input-password'),
                    amis()->TextControl('password', 'Password')
                        ->type('input-password')
                        ->minLength(5)
                        ->maxLength(20)
                        ->description('请输入5-20个字符'),
                    amis()->TextControl('confirm_password', 'Password Confirmation')
                        ->type('input-password')
                        ->minLength(5)
                        ->maxLength(20)
                        ->description('请输入确认密码'),
                ]);
                break;
            case 'table':
                $schema = Components::make()->fakerUserTable();
                break;
        }

        return $schema;
    }
}
