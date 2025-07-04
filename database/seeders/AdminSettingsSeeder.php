<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminSettingsSeeder extends Seeder
{
    /**
     * 运行数据库填充
     */
    public function run(): void
    {
        $settings = [
            [
                'key' => 'admin_locale',
                'values' => '"zh_CN"',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'key' => 'system_theme_setting',
                'values' => '{"darkTheme":false,"footer":true,"breadcrumb":true,"themeColor":"#1677ff","layoutMode":"double","siderTheme":"light","topTheme":"light","animateInType":"alpha","animateInDuration":600,"animateOutType":"alpha","animateOutDuration":600,"loginTemplate":"default","keepAlive":false,"enableTab":true,"tabIcon":true,"accordionMenu":false}',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        DB::table('admin_settings')->insert($settings);
    }
}
