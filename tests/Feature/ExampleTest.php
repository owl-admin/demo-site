<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * 验证首页会跳转到管理后台。
     */
    public function test_the_home_page_redirects_to_admin(): void
    {
        $response = $this->get('/');

        $response->assertRedirect('/admin');
    }
}
