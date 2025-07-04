<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminRolesSeeder extends Seeder
{
    /**
     * 运行数据库填充
     */
    public function run(): void
    {
        DB::table('admin_roles')->insert([
            'id' => 1,
            'name' => '超级管理员',
            'slug' => 'administrator',
            'created_at' => '2022-09-06 18:21:39',
            'updated_at' => '2022-09-06 18:21:39',
        ]);
    }
}
