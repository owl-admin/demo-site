<?php

namespace App\Admin\Controllers;

use Slowlyo\SlowAdmin\Controllers\AuthController as AdminAuthController;

class AuthController extends AdminAuthController
{
    public function saveUserSetting($id): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }
}
