<?php

namespace App\Admin\Controllers\Dcat;

use Faker\Factory;
use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 自定义视图
 */
class CustomTableController extends AdminController
{
    public function index()
    {
        $schema = amis()->Page()->data(['list_data' => $this->fakerData()])->body([
            amis()->Card()->body($this->view()),
        ]);

        return $this->response()->success($schema);
    }

    public function view()
    {
        return amis()->Tabs()->toolbar([
            // 查看源码的按钮
            Components::make()->codeView([['title' => 'Controller', 'language' => 'php', 'path' => __FILE__]])->level('link'),
        ])->tabs([
            // 表格视图
            amis()->Tab()->title('表格视图')->body([
                amis()->CRUDTable()->source('${list_data}')->columns([
                    amis()->TableColumn('id', 'ID'),
                    amis()->TableColumn('name', 'Name'),
                    amis()->TableColumn('image', 'Image')->type('image'),
                ]),
            ]),
            // 卡片视图
            amis()->Tab()->title('卡片视图')->body([
                amis()->CRUDCards()->source('${list_data}')->card(
                    amis()->Card()->body([
                        amis()->Image()->name('image'),
                        ['label' => 'ID', 'name' => 'id'],
                        ['label' => 'Name', 'name' => 'name'],
                    ])
                ),
            ]),
            // 列表视图
            amis()->Tab()->title('列表视图')->body([
                amis()->CRUDList()->source('${list_data}')->listItem(
                    amis()->ListItem()->avatar('${image | raw}')->body(
                        amis()->HBox()->columns([
                            ['label' => 'ID', 'name' => 'id'],
                            ['label' => 'Name', 'name' => 'name'],
                        ])
                    )
                ),
            ]),
        ]);
    }

    public function fakerData()
    {
        $faker = Factory::create();
        $data  = [];

        foreach (range(1, 15) as $i) {
            $data[] = [
                'id'    => $i,
                'name'  => $faker->name,
                'image' => 'https://slowlyo.gitee.io/static/images/wallpaper/wallpaper-' . mt_rand(1, 11) . '.jpg',
            ];
        }

        return $data;
    }
}
