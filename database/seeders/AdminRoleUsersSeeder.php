<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminRoleUsersSeeder extends Seeder
{
    /**
     * 运行数据库填充
     */
    public function run(): void
    {
        DB::table('admin_role_users')->insert([
            'role_id' => 1,
            'user_id' => 1,
            'created_at' => '2022-09-06 18:21:39',
            'updated_at' => '2022-09-06 18:21:39',
        ]);
    }
}
