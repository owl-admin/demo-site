<?php

namespace Tests;

use Illuminate\Contracts\Console\Kernel;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Testing\CachedState;
use Illuminate\Foundation\Testing\Concerns\WithCachedConfig;
use Illuminate\Foundation\Testing\Concerns\WithCachedRoutes;
use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    /**
     * 使用专用测试环境文件启动应用，避免缺少 .env 时产生告警。
     */
    public function createApplication()
    {
        $app = require Application::inferBasePath().'/bootstrap/app.php';

        $app->loadEnvironmentFrom('.env.testing');

        $this->traitsUsedByTest = array_flip(class_uses_recursive(static::class));

        // 命中配置缓存测试时，沿用框架的缓存配置标记逻辑。
        if (isset(CachedState::$cachedConfig) &&
            isset($this->traitsUsedByTest[WithCachedConfig::class])) {
            $this->markConfigCached($app);
        }

        // 命中路由缓存测试时，在启动阶段恢复缓存路由标记。
        if (isset(CachedState::$cachedRoutes) &&
            isset($this->traitsUsedByTest[WithCachedRoutes::class])) {
            $app->booting(fn () => $this->markRoutesCached($app));
        }

        $app->make(Kernel::class)->bootstrap();

        return $app;
    }
}
