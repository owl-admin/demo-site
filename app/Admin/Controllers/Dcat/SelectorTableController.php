<?php

namespace App\Admin\Controllers\Dcat;

use Faker\Factory;
use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 筛选器
 */
class SelectorTableController extends AdminController
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
            // 筛选
            ->filter($this->baseFilter()->actions([])->body([
                // 更改值立即刷新列表
                amis()->ButtonGroupControl('filter_option', '更改值立即刷新列表')->options([
                    ['value' => 'a', 'label' => 'Option A'],
                    ['value' => 'b', 'label' => 'Option B'],
                    ['value' => 'c', 'label' => 'Option C'],
                    ['value' => 'd', 'label' => 'Option D'],
                    ['value' => 'e', 'label' => 'Option E'],
                ])->submitOnChange()->btnLevel('light'),
            ]))
            ->bulkActions([])
            ->filterTogglable(false)
            ->columns([
                amis()->TableColumn('id', 'ID'),
                amis()->TableColumn('name', 'Name')->className('text-primary'),
                amis()->TableColumn('order', 'Order'),
                amis()->TableColumn('slug', 'Slug')->type('tag'),
                amis()->TableColumn('http_path', 'Http Path'),
                amis()->TableColumn('created_at', 'Created At'),
                amis()->TableColumn('updated_at', 'Updated At'),
            ]);
    }

    public function fakerData()
    {
        $faker = Factory::create();
        $data  = [];

        foreach (range(1, 15) as $i) {
            $data[] = [
                'id'         => $i,
                'name'       => request('filter_option') . ' - ' . $faker->name,
                'order'      => $faker->randomNumber(2),
                'slug'       => $faker->slug,
                'http_path'  => $faker->title,
                'created_at' => $faker->dateTime()->format('Y-m-d H:i:s'),
                'updated_at' => $faker->dateTime()->format('Y-m-d H:i:s'),
            ];
        }

        return $data;
    }
}
