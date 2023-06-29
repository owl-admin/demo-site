<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;

class IndexController extends Controller
{
    public function index()
    {
        $app = amis('app')
            ->brandName(config('admin.name'))
            ->logo(url(config('admin.logo')))
            ->header($this->header())
            ->pages($this->cachedPages())
            ->toJson();

        return view('doc', compact('app'));
    }

    private function cachedPages()
    {
        return cache()->rememberForever('docs.pages', fn() => $this->pages());
    }

    private function pages()
    {
        $item = function ($url, $label, $path, $icon = '') {
            $schemaApi = $this->getSchemaApi($path);
            $item      = compact('url', 'label', 'schemaApi');

            $icon && $item['icon'] = $icon;

            return $item;
        };

        return [
            [
                'url'      => '/',
                'redirect' => '/readme',
            ],
            [
                'label'    => '文档',
                'children' => [
                    $item('/readme', 'Readme', 'https://gitee.com/slowlyo/owl-admin/raw/master/README.md', 'fa fa-book'),
                    [
                        'label'    => '入门',
                        'icon'     => 'fa fa-graduation-cap',
                        'url'      => '/guide',
                        'redirect' => '/guide/install',
                        'children' => [
                            $item('/guide/install', '安装', '/docs/guide/install.md', 'fa fa-download'),
                            $item('/guide/upgrade', '升级', '/docs/guide/upgrade.md', 'fa fa-upload'),
                            $item('/guide/structure', '项目结构', '/docs/guide/structure.md', 'fa fa-sitemap'),
                            $item('/guide/helper', '助手函数', '/docs/guide/helper.md', 'fa fa-magic'),
                            $item('/guide/modal', '弹窗操作', '/docs/guide/modal.md', 'fa fa-window-restore'),
                            $item('/guide/custom', '自定义业务逻辑', '/docs/guide/custom.md', 'fas fa-cogs'),
                            $item('/guide/component-use', '组件的使用', '/docs/guide/component-use.md', 'fas fa-puzzle-piece'),
                            $item('/guide/export', '数据导出', '/docs/guide/export.md', 'fas fa-file-export'),
                        ],
                    ],
                    [
                        'label'    => '前端',
                        'icon'     => 'fa fa-desktop',
                        'url'      => '/frontend',
                        'redirect' => '/frontend/start',
                        'children' => [
                            $item('/frontend/start', '开始', '/docs/frontend/start.md', 'fas fa-play'),
                            $item('/frontend/cors', '跨域', '/docs/frontend/cors.md', 'fas fa-exchange-alt'),
                            $item('/frontend/dynamic', '动态加载资源', '/docs/frontend/dynamic.md', 'fas fa-sync'),
                            $item('/frontend/global-function', '全局函数', '/docs/frontend/global-function.md', 'fas fa-code'),
                        ],
                    ],
                    [
                        'label'    => '扩展',
                        'icon'     => 'fa fa-plug',
                        'url'      => '/extension',
                        'redirect' => '/extension/use',
                        'children' => [
                            $item('/extension/use', '使用', '/docs/extension/use.md', 'fas fa-check-circle'),
                            $item('/extension/develop', '开发', '/docs/extension/develop.md', 'fas fa-laptop-code'),
                        ],
                    ],
                    [
                        'label'    => '内置模块',
                        'icon'     => 'fa fa-cubes',
                        'url'      => '/modules',
                        'redirect' => '/modules/code-generator',
                        'children' => [
                            $item('/modules/code-generator', '代码生成器', '/docs/modules/code-generator.md', 'fa fa-code'),
                            $item('/modules/setting', '设置', '/docs/modules/setting.md', 'fa fa-cog'),
                        ],
                    ],
                    [
                        'label'    => '自定义组件',
                        'icon'     => 'fas fa-puzzle-piece',
                        'url'      => '/custom-components',
                        'redirect' => '/custom-components/iconify',
                        'children' => [
                            $item('/custom-components/iconify', 'Iconify', '/docs/custom-components/iconify.md'),
                            $item('/custom-components/wangeditor', 'WangEditor', '/docs/custom-components/wangeditor.md'),
                        ],
                    ],
                    [
                        'label'    => '示例',
                        'icon'     => 'fa fa-file-alt',
                        'url'      => '/examples',
                        'redirect' => '/examples/custom-login',
                        'children' => [
                            $item('/examples/custom-login', '自定义登录页', '/docs/examples/custom-login.md'),
                            $item('/examples/custom-user-menu', '自定义用户菜单', '/docs/examples/custom-user-menu.md'),
                            $item('/examples/custom-admin-path', '自定义后台路径', '/docs/examples/custom-admin-path.md'),
                            $item('/examples/excel-import', 'Excel 导入', '/docs/examples/excel-import.md'),
                            $item('/examples/model-relation', '模型关联展示数据', '/docs/examples/model-relation.md'),
                            $item('/examples/top-bar', '在顶部操作栏添加内容', '/docs/examples/top-bar.md'),
                            $item('/examples/dynamic-add-menu', '动态添加菜单', '/docs/examples/dynamic-add-menu.md'),
                        ],
                    ],
                    [
                        'url'       => '/changelog',
                        'label'     => '更新日志',
                        'icon'      => 'fa fa-list',
                        'schemaApi' => url('/api/docs/changelog'),
                    ],
                ],
            ],
        ];
    }

    private function getSchemaApi($path)
    {
        return '/api/docs/load_md?path=' . urlencode($path);
    }

    public function header()
    {
        $link = function ($label, $url, $icon = null) {
            return amisMake()
                ->UrlAction()
                ->label($label)
                ->url($url)
                ->icon($icon)
                ->blank()
                ->level('link');
        };

        $changelog     = $this->getChangelog();
        $latestVersion = $changelog[0]['tag_name'] ?? null;

        return amisMake()->Flex()
            ->className('w-full h-full')
            ->justify('space-between')
            ->alignItems('center')
            ->items([
                $this->searchDialog(),
                amisMake()
                    ->Wrapper()
                    ->className('w-full')
                    ->body($latestVersion ? '最新版本: ' . $latestVersion : ''),
                amisMake()->Flex()
                    ->className('w-full h-full')
                    ->justify('end')
                    ->alignItems('center')
                    ->items([
                        $link('论坛', 'http://admin-discuss.slowlyo.top'),
                        amisMake()->Divider(),
                        $link('Q群',
                            'http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=ftIIJ4kKr72mvBpoA7-ttvFafvKuu3F8&authKey=Y2nBcGpw%2FDxJ1V4jPtSyQgDJzTZXB2KEVQOm1mKYyxuVbM9SOEkQN4Mbhm%2BsAlTr&noverify=0&group_code=754544686'),
                        $link('GitHub', 'https://github.com/Slowlyo/owl-admin'),
                        $link('Gitee', 'https://gitee.com/slowlyo/owl-admin'),
                        $link('Demo', 'http://admin-demo.slowlyo.top'),
                        $link('Amis', 'https://aisuda.bce.baidu.com/amis/zh-CN/docs/index')->className('text-danger'),
                    ]),
            ]);
    }

    private function searchDialog()
    {
        return amisMake()
            ->DialogAction()
            ->id('search-dialog')
            ->label('搜索')
            ->icon('fa fa-search')
            ->level('link')
            ->className('text-gray-700')
            ->hotKey('command+k,ctrl+k')
            ->dialog(
                amisMake()
                    ->Dialog()
                    ->title()
                    ->actions([])
                    ->closeOnEsc()
                    ->closeOnOutside()
                    ->showCloseButton(false)
                    ->body(
                        amisMake()->Form()->wrapWithPanel(false)->autoFocus()->body([
                            amisMake()
                                ->TextControl('keywords', false)
                                ->placeholder('请输入关键字')
                                ->description('可使用Ctrl+K快捷键打开搜索框'),
                            amisMake()
                                ->Service()
                                ->className('max-h-80 overflow-auto')
                                ->schemaApi('/api/docs/search?keywords=${keywords}'),
                        ])
                    )
            );
    }

    public function search()
    {
        $keywords = request('keywords');
        $pages    = collect($this->cachedPages()[1]['children'])
            ->pluck('children')
            ->flatten(1)
            ->filter()
            ->map(fn($item) => [
                'label' => $item['label'],
                'url'   => $item['url'],
                'path'  => str_replace('/api/docs/load_md?path=', '', urldecode($item['schemaApi'])),
            ]);

        $result = [];

        foreach ($pages as $page) {
            $content = file_get_contents(__DIR__ . $page['path']);

            $contentContains = Str::contains($content, $keywords);
            if (Str::contains($page['label'], $keywords) || $contentContains) {
                if ($contentContains) {
                    $start    = mb_strpos($content, $keywords) - 20;
                    $excerpts = mb_substr($content, max($start, 0), 40);
                }

                $result[] = amisMake()->LinkAction()->className('w-full')->link($page['url'])
                    ->body(
                        amisMake()->Card()->className('bg-gray-50 hover:border-primary')->header([
                            'title'    => $page['label'],
                            'subTitle' => $excerpts ?? '',
                        ])
                    )
                    ->onEvent([
                        'click' => [
                            'actions' => [
                                ['actionType' => 'closeDialog'],
                            ],
                        ],
                    ]);
            }
        }

        return $this->response()->success($result);
    }

    public function loadMD()
    {
        $path = request('path');

        if (Str::startsWith($path, '/')) {
            $content = file_get_contents(__DIR__ . $path);
        } else {
            // 外部文章 缓存一小时
            $content = cache()->remember('docs_external_article_' . $path, 3600, fn() => file_get_contents($path));
        }

        $schema = amisMake()->Wrapper()->className('pc:px-64 bg-gray-100 h-full')->body([
            amisMake()->Alert()->showIcon()->body(
                amisMake()
                    ->Tpl()
                    ->tpl("owl 核心在于 amis, 组件使用请参考官方文档 👉 <a href='https://aisuda.bce.baidu.com/amis/zh-CN/components/index' target='_blank'>https://aisuda.bce.baidu.com/amis</a>")
            ),
            amisMake()->Card()->body(
                amisMake()->Markdown()->value($content)->options([
                    'html'    => true,
                    'linkify' => true,
                    'breaks'  => true,
                ])
            ),
        ]);

        return $this->response()->success(
            amisMake()->Page()->bodyClassName('p-0')->body($schema)
        );
    }
}
