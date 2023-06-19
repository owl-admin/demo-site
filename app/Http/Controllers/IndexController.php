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
            ->api(url('api/docs/base'))
            ->toJson();

        return view('doc', compact('app'));
    }

    public function base()
    {
        $menus = [
            [
                'url'      => '/',
                'redirect' => '/readme',
            ],
            [
                'label'    => '文档',
                'children' => [
                    [
                        'url'    => '/readme',
                        'label'  => 'Readme',
                        'icon'   => 'fa fa-book',
                        // 'schema' => $this->loadMD('/docs/guide/readme.md'),
                        'schema' => $this->loadMD('https://gitee.com/slowlyo/owl-admin/raw/master/README.md'),
                    ],
                    [
                        'label'    => '入门',
                        'icon'     => 'fa fa-graduation-cap',
                        'url'      => '/guide',
                        'redirect' => '/guide/install',
                        'children' => [
                            [
                                'url'    => '/guide/install',
                                'label'  => '安装',
                                'icon'   => 'fa fa-download',
                                'schema' => $this->loadMD('/docs/guide/install.md'),
                            ],
                            [
                                'url'    => '/guide/upgrade',
                                'label'  => '升级',
                                'icon'   => 'fa fa-upload',
                                'schema' => $this->loadMD('/docs/guide/upgrade.md'),
                            ],
                            [
                                'url'    => '/guide/structure',
                                'label'  => '项目结构',
                                'icon'   => 'fa fa-sitemap',
                                'schema' => $this->loadMD('/docs/guide/structure.md'),
                            ],
                            [
                                'url'    => '/guide/helper',
                                'label'  => '助手函数',
                                'icon'   => 'fa fa-magic',
                                'schema' => $this->loadMD('/docs/guide/helper.md'),
                            ],
                            [
                                'url'    => '/guide/modal',
                                'label'  => '弹窗操作',
                                'icon'   => 'fa fa-window-restore',
                                'schema' => $this->loadMD('/docs/guide/modal.md'),
                            ],
                            [
                                'url'    => '/guide/custom',
                                'label'  => '自定义业务逻辑',
                                'icon'   => 'fas fa-cogs',
                                'schema' => $this->loadMD('/docs/guide/custom.md'),
                            ],
                            [
                                'url'    => '/guide/component-use',
                                'label'  => '组件的使用',
                                'icon'   => 'fas fa-puzzle-piece',
                                'schema' => $this->loadMD('/docs/guide/component-use.md'),
                            ],
                            [
                                'url'    => '/guide/export',
                                'label'  => '数据导出',
                                'icon'   => 'fas fa-file-export',
                                'schema' => $this->loadMD('/docs/guide/export.md'),
                            ],
                        ],
                    ],
                    [
                        'label'    => '前端',
                        'icon'     => 'fa fa-desktop',
                        'url'      => '/frontend',
                        'redirect' => '/frontend/start',
                        'children' => [
                            [
                                'url'    => '/frontend/start',
                                'label'  => '开始',
                                'icon'   => 'fas fa-play',
                                'schema' => $this->loadMD('/docs/frontend/start.md'),
                            ],
                            [
                                'url'    => '/frontend/cors',
                                'label'  => '跨域',
                                'icon'   => 'fas fa-exchange-alt',
                                'schema' => $this->loadMD('/docs/frontend/cors.md'),
                            ],
                            [
                                'url'    => '/frontend/dynamic',
                                'label'  => '动态加载资源',
                                'icon'   => 'fas fa-sync',
                                'schema' => $this->loadMD('/docs/frontend/dynamic.md'),
                            ],
                            [
                                'url'    => '/frontend/global-function',
                                'label'  => '全局函数',
                                'icon'   => 'fas fa-code',
                                'schema' => $this->loadMD('/docs/frontend/global-function.md'),
                            ],
                        ],
                    ],
                    [
                        'label'    => '扩展',
                        'icon'     => 'fa fa-plug',
                        'url'      => '/extension',
                        'redirect' => '/extension/use',
                        'children' => [
                            [
                                'url'    => '/extension/use',
                                'label'  => '使用',
                                'icon'   => 'fas fa-check-circle',
                                'schema' => $this->loadMD('/docs/extension/use.md'),
                            ],
                            [
                                'url'    => '/extension/develop',
                                'label'  => '开发',
                                'icon'   => 'fas fa-laptop-code',
                                'schema' => $this->loadMD('/docs/extension/develop.md'),
                            ],
                        ],
                    ],
                    [
                        'label'    => '内置模块',
                        'icon'     => 'fa fa-cubes',
                        'url'      => '/modules',
                        'redirect' => '/modules/code-generator',
                        'children' => [
                            [
                                'url'    => '/modules/code-generator',
                                'label'  => '代码生成器',
                                'icon'   => 'fa fa-code',
                                'schema' => $this->loadMD('/docs/modules/code-generator.md'),
                            ],
                            // 设置
                            [
                                'url'    => '/modules/setting',
                                'label'  => '设置',
                                'icon'   => 'fa fa-cog',
                                'schema' => $this->loadMD('/docs/modules/setting.md'),
                            ],
                        ],
                    ],
                    [
                        'label'    => '自定义组件',
                        'icon'     => 'fas fa-puzzle-piece',
                        'url'      => '/custom-components',
                        'redirect' => '/custom-components/iconify',
                        'children' => [
                            [
                                'url'    => '/custom-components/iconify',
                                'label'  => 'Iconify',
                                'schema' => $this->loadMD('/docs/custom-components/iconify.md'),
                            ],
                            [
                                'url'    => '/custom-components/wangeditor',
                                'label'  => 'WangEditor',
                                'schema' => $this->loadMD('/docs/custom-components/wangeditor.md'),
                            ],
                        ],
                    ],
                    [
                        'label'    => '示例',
                        'icon'     => 'fa fa-file-alt',
                        'url'      => '/examples',
                        'redirect' => '/examples/custom-login',
                        'children' => [
                            [
                                'url'    => '/examples/custom-login',
                                'label'  => '自定义登录页',
                                'schema' => $this->loadMD('/docs/examples/custom-login.md'),
                            ],
                            [
                                'url'    => '/examples/custom-user-menu',
                                'label'  => '自定义用户菜单',
                                'schema' => $this->loadMD('/docs/examples/custom-user-menu.md'),
                            ],
                            [
                                'url'    => '/examples/custom-admin-path',
                                'label'  => '自定义后台路径',
                                'schema' => $this->loadMD('/docs/examples/custom-admin-path.md'),
                            ],
                            [
                                'url'    => '/examples/excel-import',
                                'label'  => 'Excel 导入',
                                'schema' => $this->loadMD('/docs/examples/excel-import.md'),
                            ],
                            [
                                'url'    => '/examples/model-relation',
                                'label'  => '模型关联展示数据',
                                'schema' => $this->loadMD('/docs/examples/model-relation.md'),
                            ],
                            [
                                'url'    => '/examples/top-bar',
                                'label'  => '在顶部操作栏添加内容',
                                'schema' => $this->loadMD('/docs/examples/top-bar.md'),
                            ],
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

        return $this->response()->success(
            amis('app')->pages($menus)->id('base-app-reload')
        );
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
                        $link('Q群',
                            'http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=ftIIJ4kKr72mvBpoA7-ttvFafvKuu3F8&authKey=Y2nBcGpw%2FDxJ1V4jPtSyQgDJzTZXB2KEVQOm1mKYyxuVbM9SOEkQN4Mbhm%2BsAlTr&noverify=0&group_code=754544686'),
                        $link('GitHub', 'https://github.com/Slowlyo/owl-admin'),
                        $link('Gitee', 'https://gitee.com/slowlyo/owl-admin'),
                        $link('Demo', 'http://admin-demo.slowlyo.top'),
                        $link('Amis', 'https://aisuda.bce.baidu.com/amis/zh-CN/docs/index')->className('text-danger'),
                    ]),
            ]);
    }

    public function loadMD($path)
    {
        if (Str::startsWith($path, '/')) {
            $path = __DIR__ . $path;
        }

        return amisMake()->Wrapper()->className('pc:px-64 bg-gray-100')->body([
            amisMake()->Alert()->showIcon()->body(
                amisMake()
                    ->Tpl()
                    ->tpl("owl 核心在于 amis, 组件使用请参考官方文档 👉 <a href='https://aisuda.bce.baidu.com/amis/zh-CN/components/index' target='_blank'>https://aisuda.bce.baidu.com/amis</a>")
            ),
            amisMake()->Card()->body(
                amisMake()->Markdown()->value(file_get_contents($path))->options([
                    'html'    => true,
                    'linkify' => true,
                    'breaks'  => true,
                ])
            ),
        ]);
    }
}
