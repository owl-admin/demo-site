<?php

namespace App\Services;

use Slowlyo\OwlAdmin\Services\AdminService;

class DataMappingService extends AdminService
{
    public function primaryKey()
    {
        return 'id';
    }

    public function categoryMap()
    {
        return [1 => '科技', 2 => '财经', 3 => '娱乐', 4 => '体育', 5 => '教育', 6 => '游戏',];
    }

    public function categoryTagMap()
    {
        $map = ['', '', 'active', 'inactive', 'error', 'success', 'warning'];

        return collect($this->categoryMap())->map(function ($item, $index) use ($map) {
            return "<span class='cxd-Tag cxd-Tag--normal cxd-Tag--normal--{$map[$index]}'>{$item}</span>";
        });
    }

    public function genderMap()
    {
        return [0 => '保密', 1 => '男', 2 => '女'];
    }

    /**
     * 列表数据
     *
     * @return array
     */
    public function list()
    {
        $total = rand(5, 10); // 随机生成 5~10 条数据
        $items = [];

        for ($i = 0; $i < $total; $i++) {
            $items[] = [
                'id'         => $i + 1,
                'state'      => rand(0, 1),
                'category'   => rand(1, 6),
                'categories' => array_map(fn() => rand(1, 6), range(0, rand(0, 2))),
                'gender'     => rand(0, 2),
                'deep'       => [
                    'title' => fake('zh_CN')->title,
                ],
            ];
        }

        return compact('total', 'items');
    }
}
