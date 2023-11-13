<?php

namespace App\Admin\Controllers\DevExample;

use App\Support\Components;
use App\Services\LeftTreeRightTableService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - 左树右表
 *
 * @property LeftTreeRightTableService service
 */
class LeftTreeRightTableController extends AdminController
{
    public string $serviceName = LeftTreeRightTableService::class;

    public function index()
    {
        if ($this->actionOfGetData()) {
            return $this->response()->success($this->service->list());
        }

        if ($this->actionOfExport()) {
            return $this->export();
        }

        return $this->response()->success($this->page());
    }

    public function page()
    {
        return amis()->Page()->body(
            amis()->Flex()->items([
                amis()->Card()->className('w-1/4 mr-5 mb-0')->body([
                    // 边栏切换
                    amis()->RadiosControl('treeType')->value('tree')->options([
                        ['label' => 'Tree', 'value' => 'tree'],
                        ['label' => 'Nav', 'value' => 'nav'],
                    ]),

                    amis()->Divider(),

                    // 用 Nav 实现边栏
                    amis()
                        ->Nav()
                        ->stacked()
                        ->links($this->service->tree())
                        ->visibleOn('${treeType == "nav"}')
                        ->name('tree'),

                    // 用 Tree 实现边栏
                    amis()
                        ->Form()
                        ->id('treeForm')
                        ->wrapWithPanel(false)
                        ->target('window')
                        ->visibleOn('${treeType == "tree"}')
                        ->body(
                        // 按照 amis 示例, 这里应该是设置完 submitOnChange 和 target:window 之后就可以了
                        // 但是不生效, 曲线救国使用 onEvent 结合路径跳转实现
                            amis()
                                ->TreeControl('tree')
                                ->submitOnChange()
                                ->options($this->service->tree())
                                ->showIcon(false)
                                ->onEvent([
                                    // 当选中项发生变化时, 触发事件
                                    'change' => [
                                        'actions' => [
                                            // 跳转到指定路径, 并且将选中项的值作为参数传递
                                            [
                                                'actionType' => 'url',
                                                'args'       => [
                                                    'url' => '/dev_example/left_tree_right_table?tree=${tree}',
                                                ],
                                            ],
                                        ],
                                    ],
                                ])
                        ),
                ]),
                $this->list(),
            ])
        );
    }

    /**
     * 这里就是正常的 crud 的内容
     *
     * @return \Slowlyo\OwlAdmin\Renderers\Page
     */
    public function list()
    {
        $crud = $this->baseCRUD()
            ->headerToolbar([
                // 查看源码的按钮
                Components::make()->codeView([
                    ['title' => 'Controller', 'language' => 'php', 'path' => __FILE__],
                    [
                        'title'    => 'Service',
                        'language' => 'php',
                        'path'     => app_path('/Services/LeftTreeRightTableService.php'),
                    ],
                ])->align('right'),
            ])
            ->footerToolbar([])
            ->filterTogglable(false)
            ->columns([
                amis()->TableColumn('id', 'ID'),
                amis()->TableColumn('title', '名称'),
                amis()->TableColumn('state', '状态')->type('status'),
                amis()->TableColumn('image', '图片')->type('image'),
                amis()->TableColumn('created_at', __('admin.created_at'))->type('datetime'),
                amis()->TableColumn('updated_at', __('admin.updated_at'))->type('datetime'),
            ]);

        return $this->baseList($crud);
    }
}
