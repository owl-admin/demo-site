<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Slowlyo\SlowAdmin\Models\AdminUser;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;
use Slowlyo\SlowAdmin\Controllers\AuthController as AdminAuthController;

class AuthController extends AdminAuthController
{
    public function saveUserSetting($id): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }

    public function login(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'username' => 'required',
                'password' => 'required',
            ], [
                'username' . '.required' => __('admin.required', ['attribute' => __('admin.username')]),
                'password.required'      => __('admin.required', ['attribute' => __('admin.password')]),
            ]);

            if ($validator->fails()) {
                abort(Response::HTTP_BAD_REQUEST, $validator->errors()->first());
            }

            $user = AdminUser::query()->where('username', $request->username)->first();

            if ($user && Hash::check($request->password, $user->password)) {
                $token = $user->createToken('admin')->plainTextToken;

                return $this->response()->success(compact('token'), __('admin.login_successful'));
            }

            abort(Response::HTTP_BAD_REQUEST, __('admin.login_failed') . '(admin/admin)');
        } catch (\Exception $e) {
            return $this->response()->fail($e->getMessage());
        }
    }
}
