<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * 运行应用程序的数据库填充
     */
    public function run(): void
    {
        // 运行管理员相关的 seeders
        $this->call([
            AdminUsersSeeder::class,
            AdminRolesSeeder::class,
            AdminPermissionsSeeder::class,
            AdminMenusSeeder::class,
            AdminRoleUsersSeeder::class,
            AdminRolePermissionsSeeder::class,
            AdminPermissionMenuSeeder::class,
            AdminSettingsSeeder::class,
        ]);

        // User::factory(10)->create();

        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
        ]);
    }
}
