<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Hash;
use Slowlyo\OwlAdmin\Models\AdminMenu;
use Slowlyo\OwlAdmin\Models\AdminPermission;
use Slowlyo\OwlAdmin\Models\AdminRole;
use Slowlyo\OwlAdmin\Models\AdminUser;
use Slowlyo\OwlAdmin\Services\AdminMenuService;
use Tests\TestCase;

class BladePermissionPageTest extends TestCase
{
    use RefreshDatabase;

    /**
     * 验证菜单关联权限后，未授权用户不能访问 Blade 页面，授权用户可以正常渲染。
     */
    public function test_blade_page_requires_its_menu_permission(): void
    {
        $parentMenu = AdminMenu::query()->create([
            'id' => 9998,
            'title' => '开发示例',
            'url' => '/dev_example',
        ]);
        $menu = AdminMenu::query()->create([
            'parent_id' => 9998,
            'title' => 'Blade 页面权限示例',
            'url' => '/dev_example/blade_permission',
            'url_type' => AdminMenu::TYPE_IFRAME,
            'iframe_url' => '/admin-api/pages/blade_permission',
        ]);
        $permission = AdminPermission::forceCreate([
            'name' => 'Blade 页面权限示例',
            'slug' => 'dev_example.blade_permission',
            'http_path' => ['/pages/blade_permission*'],
        ]);
        $permission->menus()->attach([$parentMenu->id, $menu->id]);

        // 父菜单也落库后，菜单管理的树形列表不会丢弃该子菜单。
        $this->assertStringContainsString(
            'Blade 页面权限示例',
            json_encode(AdminMenuService::make()->getTree(), JSON_UNESCAPED_UNICODE)
        );

        $role = AdminRole::forceCreate([
            'name' => 'Blade 示例角色',
            'slug' => 'blade-demo',
        ]);
        $user = AdminUser::query()->create([
            'username' => 'blade-demo',
            'password' => Hash::make('password'),
            'name' => 'Blade 示例用户',
        ]);
        $user->roles()->attach($role);

        // 未分配权限时，即使持有有效登录令牌也会被权限中间件拦截。
        $this->withToken($user->createToken('blade-demo')->plainTextToken)
            ->get('/admin-api/pages/blade_permission')
            ->assertOk()
            ->assertJsonPath('status', 1);

        $role->permissions()->attach($permission);

        // 角色获得同一权限后，菜单绑定和页面路径校验同时满足。
        $this->withToken($user->createToken('blade-demo-authorized')->plainTextToken)
            ->get('/admin-api/pages/blade_permission')
            ->assertOk()
            ->assertSee('Blade 页面权限控制')
            ->assertSee('BladePermissionController');

        // 菜单接口应返回挂在开发示例下的受控菜单，前端据此生成导航树。
        $menuResponse = $this->withToken($user->createToken('blade-demo-menu')->plainTextToken)
            ->get('/admin-api/menus')
            ->assertOk();
        $this->assertStringContainsString(
            'Blade 页面权限示例',
            json_encode($menuResponse->json(), JSON_UNESCAPED_UNICODE)
        );
    }
}
