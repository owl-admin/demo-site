<?php

namespace App\Services;

use Slowlyo\OwlAdmin\Services\AdminService;

class LeftTreeRightTableService extends AdminService
{
    public function primaryKey()
    {
        return 'id';
    }

    public function list()
    {
        $tree   = request('tree');
        $suffix = $tree ? " (tree: {$tree})" : '';

        $total = rand(1, 5);
        $items = [];

        for ($i = 0; $i < $total; $i++) {
            $items[] = [
                'id'         => $i + 1,
                'title'      => fake('zh_CN')->title . $suffix,
                'state'      => rand(0, 1),
                'image'      => fake()->imageUrl,
                'created_at' => fake()->dateTime->format('Y-m-d H:i:s'),
                'updated_at' => fake()->dateTime->format('Y-m-d H:i:s'),
            ];
        }

        return compact('total', 'items');
    }

    public function tree()
    {
        return [
            [
                'label' => '一级 1',
                'value' => 1,
                'to'    => '/dev_example/left_tree_right_table?tree=1',
            ],
            [
                'label'    => '一级 2',
                'value'    => 2,
                'to'       => '/dev_example/left_tree_right_table?tree=2',
                'children' => [
                    [
                        'label' => '二级 2-1',
                        'value' => 21,
                        'to'    => '/dev_example/left_tree_right_table?tree=21',
                    ],
                    [
                        'label' => '二级 2-2',
                        'value' => 22,
                        'to'    => '/dev_example/left_tree_right_table?tree=22',
                    ],
                ],
            ],
            [
                'label' => '一级 3',
                'value' => 3,
                'to'    => '/dev_example/left_tree_right_table?tree=3',
            ],
        ];
    }
}
