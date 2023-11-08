<?php

namespace App\Admin\Controllers\DevExample;

use App\Models\User;
use App\Support\Components;
use Illuminate\Http\Request;
use App\Services\DataMappingService;
use Illuminate\Support\Facades\Http;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - 条件组合查询
 *
 * @property DataMappingService $service
 */
class ConditionBuilderController extends AdminController
{
    public function index()
    {
        $page = $this->basePage()->body([
                amis()->Form()->title()->debug()->api('post:/dev_example/condition_builder')->body([
                    $this->baseFilterConditionBuilder()
                        ->description('适合让用户自己拼查询条件，然后后端根据数据生成 query where')
                        ->fields([
                            ['label' => '文本', 'type' => 'text', 'name' => 'text'],
                            ['label' => '数字', 'type' => 'number', 'name' => 'number'],
                            [
                                'label'   => '选项',
                                'type'    => 'select',
                                'name'    => 'select',
                                'options' => [
                                    ['label' => 'A', 'value' => 'a'],
                                    ['label' => 'B', 'value' => 'b'],
                                    ['label' => 'C', 'value' => 'c'],
                                    ['label' => 'D', 'value' => 'd'],
                                    ['label' => 'E', 'value' => 'e'],
                                ],
                            ],
                            [
                                'label'    => '日期',
                                'children' => [
                                    ['label' => '日期', 'type' => 'date', 'name' => 'date'],
                                    ['label' => '时间', 'type' => 'time', 'name' => 'time'],
                                    ['label' => '日期时间', 'type' => 'datetime', 'name' => 'datetime'],
                                ],
                            ],
                        ]),

                    amis()->Divider(),

                    amis()->Tpl()->tpl('${formatted_sql|raw}'),
                ]),
            ]
        );

        return $this->response()->success($page);
    }

    public function store(Request $request)
    {
        $query = User::query()->withConditionBuilder();

        $sql = array_reduce($query->getBindings(), fn($sql, $binding) => preg_replace('/\?/', is_numeric($binding) ? $binding : "'" . $binding . "'", $sql, 1), $query->toSql());

        $url = 'https://c.runoob.com/wp-content/themes/toolrunoob/option/ajax.php?type=SqlFormatter';

        $response = Http::asForm()->post($url, ['query' => $sql]);

        if ($response->failed()) {
            return $this->response()->fail('SQL 格式化失败~');
        }

        return $this->response()->success(['formatted_sql' => $response->json('res')]);
    }
}
