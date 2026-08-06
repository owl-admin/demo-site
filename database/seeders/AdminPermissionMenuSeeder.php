<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminPermissionMenuSeeder extends Seeder
{
    /**
     * 运行数据库填充
     */
    public function run(): void
    {
        $permissionMenus = [
            ['permission_id' => 1, 'menu_id' => 1, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 2, 'menu_id' => 2, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 3, 'menu_id' => 3, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 3, 'menu_id' => 2, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 4, 'menu_id' => 4, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 4, 'menu_id' => 2, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 5, 'menu_id' => 5, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 5, 'menu_id' => 2, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 6, 'menu_id' => 6, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 6, 'menu_id' => 2, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 8, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 9, 'menu_id' => 9, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 9, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 10, 'menu_id' => 10, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 10, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 11, 'menu_id' => 11, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 11, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 12, 'menu_id' => 12, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 12, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 13, 'menu_id' => 13, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 13, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 14, 'menu_id' => 14, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 14, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 15, 'menu_id' => 15, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 15, 'menu_id' => 8, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 16, 'menu_id' => 16, 'created_at' => null, 'updated_at' => null],
            ['permission_id' => 16, 'menu_id' => 9998, 'created_at' => null, 'updated_at' => null],
        ];

        DB::table('admin_permission_menu')->insert($permissionMenus);
    }
}
