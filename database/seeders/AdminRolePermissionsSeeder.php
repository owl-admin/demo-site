<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminRolePermissionsSeeder extends Seeder
{
    /**
     * 运行数据库填充
     */
    public function run(): void
    {
        $rolePermissions = [
            [
                'role_id' => 1,
                'permission_id' => 1,
                'created_at' => '2023-12-28 06:09:27',
                'updated_at' => '2023-12-28 06:09:27',
            ],
            [
                'role_id' => 1,
                'permission_id' => 2,
                'created_at' => '2024-01-12 05:20:03',
                'updated_at' => '2024-01-12 05:20:03',
            ],
            [
                'role_id' => 1,
                'permission_id' => 3,
                'created_at' => '2024-01-12 05:20:03',
                'updated_at' => '2024-01-12 05:20:03',
            ],
            [
                'role_id' => 1,
                'permission_id' => 4,
                'created_at' => '2024-01-12 05:20:03',
                'updated_at' => '2024-01-12 05:20:03',
            ],
            [
                'role_id' => 1,
                'permission_id' => 5,
                'created_at' => '2024-01-12 05:20:03',
                'updated_at' => '2024-01-12 05:20:03',
            ],
            [
                'role_id' => 1,
                'permission_id' => 15,
                'created_at' => '2024-03-19 12:53:29',
                'updated_at' => '2024-03-19 12:53:29',
            ],
            [
                'role_id' => 1,
                'permission_id' => 14,
                'created_at' => '2024-03-19 12:53:29',
                'updated_at' => '2024-03-19 12:53:29',
            ],
        ];

        DB::table('admin_role_permissions')->insert($rolePermissions);
    }
}
