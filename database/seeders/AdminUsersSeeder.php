<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminUsersSeeder extends Seeder
{
    /**
     * 运行数据库填充
     */
    public function run(): void
    {
        DB::table('admin_users')->insert([
            'id' => 1,
            'username' => 'admin',
            'password' => bcrypt('admin'),
            'name' => '超级管理员',
            'avatar' => null,
            'remember_token' => null,
            'created_at' => '2022-09-06 18:21:39',
            'updated_at' => '2022-09-06 18:21:39',
            'enabled' => 1,
        ]);
    }
}
