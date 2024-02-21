<?php

namespace App\Admin\Controllers\Dcat;

use Faker\Factory;
use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 树形表格
 */
class TreeTableController extends AdminController
{
    public function index()
    {
        if ($this->actionOfGetData()) {
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
            ->draggable()
            ->columns([
                /*
                 * 表格结构无需特殊处理, 返回的数据中存在 children 字段, 则会自动渲染成树形表格
                 */
                amis()->TableColumn('id', 'ID'),
                amis()->TableColumn('name', 'Name')->className('text-primary'),
                amis()->TableColumn('order', 'Order'),
                amis()->TableColumn('slug', 'Slug')->type('tag'),
                amis()->TableColumn('http_path', 'Http Path'),
                amis()->TableColumn('created_at', 'Created At'),
                amis()->TableColumn('updated_at', 'Updated At'),
            ]);
    }

    public function fakerData($len = 10, $deep = 1)
    {
        $faker = Factory::create();
        $data  = [];

        foreach (range(1, $len) as $i) {
            $_item = [
                'id'         => $i,
                'name'       => $faker->name,
                'order'      => $faker->randomNumber(2),
                'slug'       => $faker->slug,
                'http_path'  => $faker->title,
                'created_at' => $faker->dateTime()->format('Y-m-d H:i:s'),
                'updated_at' => $faker->dateTime()->format('Y-m-d H:i:s'),
            ];

            if (mt_rand(0, 1) && $deep < 5) {
                $_item['children'] = $this->fakerData(mt_rand(0, 5), $deep + 1);
            }

            $data[] = $_item;
        }

        return $data;
    }
}
