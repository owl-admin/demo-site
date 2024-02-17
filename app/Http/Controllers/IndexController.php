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

    public function cachedPages()
    {
        if (Str::contains(request()->url(), 'owl-admin-demo.test/doc') || app()->runningInConsole()) {
            return $this->pages();
        }

        return cache()->rememberForever('docs.pages', fn() => $this->pages());
    }

    private function pages()
    {
        $item = function ($url, $label, $path, $icon = '') {
            $schemaApi = '/api/docs/load_md?path=' . urlencode($path);
            $item      = compact('url', 'label', 'schemaApi');

            $icon && $item['icon'] = $icon;

            return $item;
        };

        return [
            ['url' => '/', 'redirect' => '/readme'],
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
                            $item('/guide/install', '安装', '/docs/guide/install.md'),
                            $item('/guide/upgrade', '升级', '/docs/guide/upgrade.md'),
                            $item('/guide/structure', '项目结构', '/docs/guide/structure.md'),
                            $item('/guide/helper', '助手函数', '/docs/guide/helper.md'),
                            $item('/guide/component-use', '组件的使用', '/docs/guide/component-use.md'),
                            $item('/guide/artisan', '内置命令', '/docs/guide/artisan.md'),
                        ],
                    ],
                    [
                        'label'    => '原理',
                        'icon'     => 'fa fa-book',
                        'url'      => '/theory',
                        'redirect' => '/theory/amis',
                        'children' => [
                            $item('/theory/amis', 'Amis', '/docs/theory/amis.md'),
                            $item('/theory/frame', '框架', '/docs/theory/frame.md'),
                        ],
                    ],
                    [
                        'label'    => 'CRUD',
                        'icon'     => 'fa fa-code',
                        'url'      => '/crud',
                        'redirect' => '/crud/base',
                        'children' => [
                            $item('/crud/base', '基础概念', '/docs/crud/base.md'),
                            $item('/crud/create', '增', '/docs/crud/create.md'),
                            $item('/crud/delete', '删', '/docs/crud/delete.md'),
                            $item('/crud/update', '改', '/docs/crud/update.md'),
                            $item('/crud/read', '查', '/docs/crud/read.md'),
                            $item('/crud/modal', '弹窗操作', '/docs/crud/modal.md'),
                            $item('/crud/export', '数据导出', '/docs/crud/export.md'),
                        ],
                    ],
                    [
                        'label'    => '前端',
                        'icon'     => 'fa fa-desktop',
                        'url'      => '/frontend',
                        'redirect' => '/frontend/start',
                        'children' => [
                            $item('/frontend/start', '开始', '/docs/frontend/start.md'),
                            $item('/frontend/cors', '跨域', '/docs/frontend/cors.md'),
                            $item('/frontend/dynamic', '动态加载资源', '/docs/frontend/dynamic.md'),
                            $item('/frontend/global-function', '全局函数', '/docs/frontend/global-function.md'),
                        ],
                    ],
                    [
                        'label'    => '扩展',
                        'icon'     => 'fa fa-plug',
                        'url'      => '/extension',
                        'redirect' => '/extension/use',
                        'children' => [
                            $item('/extension/use', '使用', '/docs/extension/use.md'),
                            $item('/extension/develop', '开发', '/docs/extension/develop.md'),
                        ],
                    ],
                    [
                        'label'    => '多应用',
                        'icon'     => 'fa fa-sitemap',
                        'url'      => '/multi-application',
                        'redirect' => '/multi-application/use',
                        'children' => [
                            $item('/multi-application/use', '使用', '/docs/multi-application/use.md'),
                            $item('/multi-application/guide', '指南', '/docs/multi-application/guide.md'),
                        ],
                    ],
                    [
                        'label'    => '内置模块',
                        'icon'     => 'fa fa-cubes',
                        'url'      => '/modules',
                        'redirect' => '/modules/code-generator',
                        'children' => [
                            $item('/modules/code-generator', '代码生成器', '/docs/modules/code-generator.md'),
                            $item('/modules/setting', '设置', '/docs/modules/setting.md'),
                        ],
                    ],
                    [
                        'label'    => '自定义组件',
                        'icon'     => 'fas fa-puzzle-piece',
                        'url'      => '/custom-components',
                        'redirect' => '/custom-components/iconify',
                        'children' => [
                            $item('/custom-components/iconify', '图标 Iconify', '/docs/custom-components/iconify.md'),
                            $item('/custom-components/wangeditor', 'WangEditor', '/docs/custom-components/wangeditor.md'),
                            $item('/custom-components/watermark', '水印 Watermark', '/docs/custom-components/watermark.md'),
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
                            $item('/examples/component-encapsulation', '组件封装', '/docs/examples/component-encapsulation.md'),
                            $item('/examples/condition-builder', '条件组合查询', '/docs/examples/condition-builder.md'),
                        ],
                    ],
                    $item('/changelog', '更新日志', '/docs/changelog.md', 'fa fa-history'),
                ],
            ],
        ];
    }

    public function header()
    {
        $link = function ($label, $url, $icon = null) {
            return amis()
                ->UrlAction()
                ->label($label)
                ->url($url)
                ->icon($icon)
                ->blank()
                ->className('p-0 pr-3')
                ->iconClassName('text-xl doc-header-icon')
                ->level('link');
        };

        $changelog     = $this->getChangelog();
        $latestVersion = $changelog[0]['tag_name'] ?? null;

        return amis()->Flex()
            ->className('w-full h-full')
            ->justify('space-between')
            ->alignItems('center')
            ->items([
                amis()
                    ->Flex()
                    ->className('w-full')
                    ->justify('')
                    ->alignItems('center')
                    ->items([
                        $this->searchDialog(),
                        $link('备用文档站', 'https://www.showdoc.com.cn/owladmin'),
                        amis()
                            ->Wrapper()
                            ->className('text-success font-bold')
                            ->body($latestVersion ? 'Latest: ' . $latestVersion : ''),
                    ]),
                amis()->Flex()
                    ->className('w-full h-full')
                    ->justify('end')
                    ->alignItems('center')
                    ->items([
                        $link('官网', 'https://owladmin.com'),
                        $link('Demo', 'http://demo.owladmin.com'),
                        $link('', 'https://github.com/Slowlyo/owl-admin', '/static/icon/github.svg'),
                        $link('', 'https://gitee.com/slowlyo/owl-admin', '/static/icon/gitee.svg'),
                        $link('', 'https://jq.qq.com/?_wv=1027&k=5La4Ir6c', '/static/icon/qq.svg'),
                        // $link('', 'https://bbs.csdn.net/forums/owladmin', '/static/icon/csdn.svg'),
                    ]),
            ]);
    }

    private function searchDialog()
    {
        return amis()
            ->DialogAction()
            ->id('search-dialog')
            ->label('搜索')
            ->icon('fa fa-search')
            ->level('link')
            ->className('text-gray-700 mr-5')
            ->hotKey('command+k,ctrl+k')
            ->dialog(
                amis()
                    ->Dialog()
                    ->title()
                    ->actions([])
                    ->closeOnEsc()
                    ->closeOnOutside()
                    ->showCloseButton(false)
                    ->body(
                        amis()->Form()->wrapWithPanel(false)->autoFocus()->body([
                            amis()
                                ->TextControl('keywords', false)
                                ->placeholder('请输入关键字')
                                ->description('可使用Ctrl+K快捷键打开搜索框'),
                            amis()
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

                $result[] = amis()->LinkAction()->className('w-full')->link($page['url'])
                    ->body(
                        amis()->Card()->className('bg-gray-50 hover:border-primary')->header([
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

        $schema = amis()->Wrapper()->className('pc:px-64 bg-gray-100 h-full')->body([
            amis()->Alert()->showIcon()->body(
                amis()
                    ->Tpl()
                    ->tpl("Owl 核心在于 amis, 组件使用请参考官方文档 👉 <a href='https://aisuda.bce.baidu.com/amis/zh-CN/components/index' target='_blank'>https://aisuda.bce.baidu.com/amis</a>")
            ),
            amis()->Card()->body(
                amis()->Markdown()->value($content)->options([
                    'html'    => true,
                    'linkify' => true,
                    'breaks'  => true,
                ])
            ),
        ]);

        return $this->response()->success(
            amis()->Page()->bodyClassName('p-0')->body($schema)
        );
    }
}
