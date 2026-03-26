<?php

namespace App\Support;

use Faker\Factory as FakerFactory;

trait InteractsWithFaker
{
    /**
     * 缓存不同语言环境的 Faker 实例。
     *
     * @var array<string, object>
     */
    protected array $fakerInstances = [];

    /**
     * 获取指定语言环境的 Faker 实例。
     */
    protected function faker(?string $locale = null): object
    {
        $locale ??= config('app.faker_locale', 'en_US');

        // 已创建的实例直接复用，避免在循环里重复创建对象。
        if (isset($this->fakerInstances[$locale])) {
            return $this->fakerInstances[$locale];
        }

        return $this->fakerInstances[$locale] = FakerFactory::create($locale);
    }
}
