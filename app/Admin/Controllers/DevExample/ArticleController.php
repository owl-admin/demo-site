<?php

namespace App\Admin\Controllers\DevExample;

use App\Support\Components;
use App\Services\ArticleService;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - 文章 CRUD
 */
class ArticleController extends AdminController
{
    // 写 crud 的时候 $serviceName 这个属性是必须的, 需要告诉 Controller 要用哪个 service 来处理数据
    protected string $serviceName = ArticleService::class;

    public function list()
    {
        $crud = $this->baseCRUD()
            ->filter($this->baseFilter()->body([
                amis()->TextControl('user_name', '作者名称')->size('md')->clearable(),
            ]))
            ->headerToolbar([
                $this->createButton(true, 'lg'),
                ...$this->baseHeaderToolBar(),

                // 查看源码的按钮
                Components::make()->codeView([
                    ['title' => 'Controller', 'language' => 'php', 'path' => __FILE__],
                    ['title' => 'Service', 'language' => 'php', 'path' => app_path('Services/ArticleService.php')],
                    ['title' => 'Model', 'language' => 'php', 'path' => app_path('Models/Article.php')],
                ]),
            ])
            ->columns([
                amis()->TableColumn('id', 'ID')->sortable(),
                amis()->TableColumn('title', '标题')->searchable(),
                amis()->TableColumn('image', '图片')->type('image')->enlargeAble(true),
                amis()->TableColumn('user.name', '作者'),
                amis()->TableColumn('view', '阅读量')->sortable(),
                amis()->TableColumn('created_at', '创建时间')->sortable(),
                amis()->TableColumn('updated_at', '更新时间')->sortable(),
                $this->rowActions([
                    // 非弹窗
                    $this->rowShowButton(),
                    // 弹窗
                    $this->rowEditButton(true, 'lg'),
                    $this->rowDeleteButton(),
                ]),
            ]);

        return $this->baseList($crud);
    }

    public function form()
    {
        return $this->baseForm()->body([
            amis()->TextControl('title', '标题')->required(),
            amis()->ImageControl('image', '图片')->required()->maxSize(1024 * 1024 * 1024),
            amis()->SelectControl('user_id', '作者')->options($this->service->userOptions())->required()->searchable(),
            amis()->NumberControl('view', '阅读量')->min(0)->step(1)->required()->value(0),
            amis()->EditorControl('content', '内容')->required()->language('markdown'),
        ]);
    }

    public function detail()
    {
        return $this->baseDetail()->body([
            amis()->TextControl('id', 'ID')->static(),
            amis()->TextControl('title', '标题')->static(),
            amis()->TextControl('user.name', '作者')->static(),
            amis()->StaticExactControl('image', '图片')->type('static-image')->enlargeAble(true),
            amis()->TextControl('view', '阅读量')->static(),
            amis('control')->label('内容')->body(
                amis()->Markdown()->value('${content}')
            ),
        ]);
    }
}
