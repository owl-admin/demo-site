<?php

namespace App\Admin\Controllers;

use Illuminate\Foundation\Application;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\JsonResource;
use Slowlyo\OwlAdmin\Controllers\HomeController as BaseHomeController;
use Slowlyo\OwlAdmin\Support\Composer as ComposerSupport;

class HomeController extends BaseHomeController
{
    /**
     * 渲染首页仪表盘。
     */
    public function index(): JsonResponse|JsonResource
    {
        $page = $this->basePage()->css($this->css())->body([
            amis()->Grid()->className('mb-1')->columns([
                $this->frameworkInfo()->set('md', 5),
                amis()->Flex()->items([
                    $this->pieChart(),
                    $this->cube(),
                ]),
            ]),
            amis()->Grid()->columns([
                $this->lineChart()->set('md', 8),
                amis()->Flex()->className('h-full')->direction('column')->items([
                    $this->clock(),
                    $this->codeView(),
                ]),
            ]),
            amis()->Grid()->className('mt-3')->columns([
                $this->dependencyCard()->set('md', 12),
            ]),
        ]);

        return $this->response()->success($page);
    }

    /**
     * 生成运行依赖卡片。
     */
    public function dependencyCard()
    {
        return amis()
            ->Panel()
            ->className('clear-card-mb dependency-panel')
            ->title('运行依赖')
            ->body(amis()->Html()->html($this->dependencyHtml()))
            ->id('dependency-panel')
            ->set('animations', [
                'enter' => [
                    'duration' => 0.5,
                    'type'     => 'fadeInUp',
                ],
            ]);
    }

    /**
     * 生成依赖卡片内容。
     */
    private function dependencyHtml(): string
    {
        $items = collect($this->dependencies())->map(function (array $dependency) {
            return sprintf(
                '<div class="dependency-item"><div class="dependency-label">%s</div><div class="dependency-version">%s</div><div class="dependency-meta">%s</div></div>',
                e($dependency['label']),
                e($dependency['version']),
                e($dependency['meta']),
            );
        })->implode('');

        return sprintf(
            '<div class="dependency-subtitle">版本来自当前运行环境与 composer 配置</div><div class="dependency-grid">%s</div>',
            $items
        );
    }

    /**
     * 汇总首页需要展示的依赖版本。
     */
    private function dependencies(): array
    {
        return [
            [
                'label'   => 'Owl Admin',
                'version' => $this->packageVersion('slowlyo/owl-admin'),
                'meta'    => '后台框架',
            ],
            [
                'label'   => 'Laravel',
                'version' => $this->normalizeVersion(Application::VERSION),
                'meta'    => '应用框架',
            ],
            [
                'label'   => 'Sanctum',
                'version' => $this->packageVersion('laravel/sanctum'),
                'meta'    => '认证扩展',
            ],
            [
                'label'   => 'PHP',
                'version' => $this->normalizeVersion(PHP_VERSION),
                'meta'    => '当前运行环境',
            ],
            [
                'label'   => 'PHP 约束',
                'version' => $this->phpConstraint(),
                'meta'    => 'composer.json',
            ],
        ];
    }

    /**
     * 读取已安装依赖版本。
     */
    private function packageVersion(string $package): string
    {
        $version = ComposerSupport::getVersion($package);

        // 依赖未安装时给出明确占位，避免页面出现空值。
        if (! $version) {
            return '未检测';
        }

        return $this->normalizeVersion($version);
    }

    /**
     * 读取项目声明的 PHP 版本约束。
     */
    private function phpConstraint(): string
    {
        $constraint = ComposerSupport::parse(base_path('composer.json'))->get('require.php');

        // 未声明约束时直接返回占位，避免误导为当前运行版本。
        if (! $constraint) {
            return '未声明';
        }

        return $constraint;
    }

    /**
     * 统一格式化版本号。
     */
    private function normalizeVersion(?string $version): string
    {
        // 空版本统一返回占位，避免前端渲染空白。
        if (! $version) {
            return '未检测';
        }

        return ltrim($version, 'v');
    }

    /**
     * 首页样式。
     */
    private function css(): array
    {
        return [
            '.clear-card-mb'                 => [
                'margin-bottom' => '0 !important',
            ],
            '.cxd-Image'                     => [
                'border' => '0',
            ],
            '.bg-blingbling'                 => [
                'color'             => '#fff',
                'background'        => 'linear-gradient(to bottom right, #00C9FF, #FD746C, #FF8235, #ffff1c, #92FE9D, #2C3E50, #a044ff, #e73827)',
                'background-repeat' => 'no-repeat',
                'background-size'   => '1000% 1000%',
                'animation'         => 'gradient 60s ease infinite',
            ],
            '@keyframes gradient'            => [
                '0%{background-position:0% 0%} 50%{background-position:100% 100%} 100%{background-position:0% 0%}',
            ],
            '.bg-blingbling .cxd-Card-title' => [
                'color' => '#fff',
            ],
            '.dependency-grid'               => [
                'display'               => 'grid',
                'grid-template-columns' => 'repeat(auto-fit, minmax(180px, 1fr))',
                'gap'                   => '16px',
            ],
            '.dependency-subtitle'           => [
                'margin-bottom' => '16px',
                'font-size'     => '13px',
                'color'         => '#6b7280',
            ],
            '.dependency-item'               => [
                'padding'       => '18px 20px',
                'border'        => '1px solid #e5e7eb',
                'border-radius' => '12px',
                'background'    => '#f8fafc',
            ],
            '.dependency-label'              => [
                'margin-bottom' => '10px',
                'font-size'     => '13px',
                'color'         => '#6b7280',
            ],
            '.dependency-version'            => [
                'font-size'   => '28px',
                'font-weight' => '700',
                'line-height' => '1.2',
                'color'       => '#111827',
            ],
            '.dependency-meta'               => [
                'margin-top' => '8px',
                'font-size'  => '12px',
                'color'      => '#9ca3af',
            ],
        ];
    }
}
