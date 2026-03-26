<?php

namespace Tests\Unit;

use App\Models\User;
use Tests\TestCase;

class UserFactoryTest extends TestCase
{
    /**
     * 验证用户工厂能生成基础示例数据。
     */
    public function test_definition_can_generate_demo_data(): void
    {
        $factory = User::factory();
        $definition = $factory->definition();

        $this->assertNotEmpty($definition['name']);
        $this->assertMatchesRegularExpression('/@/', $definition['email']);
    }
}
