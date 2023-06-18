<?php

namespace App\Http\Controllers;

class ChangelogController extends Controller
{
    public function index()
    {
        $crud = amisMake()->CRUDCards()->source('${changelog_list}')->card(
            amisMake()->Card()->header(['title' => '${tag_name}'])->body([
                amisMake()->TableColumn('html_url', '详情')
                    ->type('tpl')
                    ->tpl('<a href="${html_url}" target="_blank">点击查看</a>'),
                amisMake()->TableColumn('', '更新内容')->popOver(
                    amisMake()->Wrapper()->className('p-4')->trigger('hover')->position('right-bottom')->offset([
                        'top' => 20,
                        'left' => 30
                    ])->body(
                        amisMake()->Markdown()->name('body')->options([
                            'html'    => true,
                            'linkify' => true,
                            'breaks'  => true,
                        ])
                    )
                ),
                amisMake()->TableColumn('published_at', '发布时间'),
            ])
        );

        return $this->response()->success(
            amisMake()->Page()->data([
                'changelog_list' => $this->getChangelog(),
            ])->body($crud)
        );
    }
}
