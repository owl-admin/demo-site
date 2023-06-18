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
                'changelog_list' => $this->fetchData(),
            ])->body($crud)
        );
    }

    public function fetchData()
    {
        return cache()->remember('admin_changelog', 3600, function () {
            $data = array_merge($this->getGithub(), $this->getGitee());
            $_arr = [];
            foreach ($data as $item) {
                $_time  = key_exists('published_at', $item) ? $item['published_at'] : $item['created_at'];
                $_arr[] = [
                    'tag_name'     => $item['tag_name'],
                    'published_at' => date('Y-m-d H:i:s', strtotime($_time)),
                    'body'         => $item['body'],
                    'html_url'     => key_exists('html_url',
                        $item) ? $item['html_url'] : 'https://gitee.com/slowlyo/owl-admin/releases/tag/' . $item['tag_name'],
                ];
            }

            return $_arr;
        });
    }

    public function getGithub($page = 1)
    {
        $githubToken = config('app.github_token');
        $githubApi   = 'https://api.github.com/repos/slowlyo/owl-admin/releases';
        $data        = [];

        request:
        $result = $this->get($githubApi, ['page' => $page, 'per_page' => 100], [
            'Authorization: Bearer ' . $githubToken,
            'Accept: application/vnd.github.v3+json',
            'X-GitHub-Api-Version: 2022-11-28',
            'User-Agent: Slowlyo',
        ]);

        if ($result) {
            $data = array_merge($data, $result);
            if (count($result) == 100) {
                sleep(1);
                $page++;
                goto request;
            }
        }

        return $data;
    }

    public function getGitee($page = 1)
    {
        if (file_exists('gitee.json')) {
            return json_decode(file_get_contents('gitee.json'), true);
        }

        $api  = 'https://gitee.com/api/v5/repos/slowlyo/owl-admin/releases';
        $data = [];

        request:
        $result = $this->get($api, ['page' => $page, 'direction' => 'desc', 'per_page' => 100], [
            'User-Agent: Slowlyo',
        ]);

        if ($result) {
            $data = array_merge($data, $result);
            if (count($result) == 100) {
                sleep(1);
                $page++;
                goto request;
            }
        }

        return $data;
    }

    public function get($url, $data, $headers = [])
    {
        $url      = $url . '?' . http_build_query($data);
        $context  = stream_context_create([
            'http' => [
                'method' => 'GET',
                'header' => implode("\r\n", $headers),
            ],
        ]);
        $response = file_get_contents($url, false, $context);
        return json_decode($response, true);
    }
}
