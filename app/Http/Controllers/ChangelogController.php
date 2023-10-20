<?php

namespace App\Http\Controllers;

class ChangelogController extends Controller
{
    public function index()
    {
        $crud = amis()->CRUDCards()->source('${changelog_list}')->card(
            amis()->Card()->header(['title' => '${tag_name}'])->body([
                amis()->TableColumn('html_url', '详情')
                    ->type('tpl')
                    ->tpl('<a href="${html_url}" target="_blank">点击查看</a>'),
                amis()->TableColumn('', '更新内容')->popOver(
                    amis()->Wrapper()->className('p-4')->trigger('hover')->position('right-bottom')->offset([
                        'top' => 20,
                        'left' => 30
                    ])->body(
                        amis()->Markdown()->name('body')->options([
                            'html'    => true,
                            'linkify' => true,
                            'breaks'  => true,
                        ])
                    )
                ),
                amis()->TableColumn('published_at', '发布时间'),
            ])
        );

        return $this->response()->success(
            amis()->Page()->data([
                'changelog_list' => $this->getChangelog(),
            ])->body($crud)
        );
    }
}
