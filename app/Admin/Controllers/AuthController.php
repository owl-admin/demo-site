<?php

namespace App\Admin\Controllers;

use Slowlyo\SlowAdmin\Controllers\AuthController as AdminAuthController;
use Illuminate\Contracts\View\View;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\Foundation\Application;
use Slowlyo\SlowAdmin\Renderers\Form\Checkbox;
use Slowlyo\SlowAdmin\Renderers\Form\Form;
use Slowlyo\SlowAdmin\SlowAdmin;
use Slowlyo\SlowAdmin\Renderers\Card;
use Slowlyo\SlowAdmin\Renderers\Page;
use Slowlyo\SlowAdmin\Renderers\Button;
use Slowlyo\SlowAdmin\Renderers\Wrapper;
use Slowlyo\SlowAdmin\Renderers\Form\InputText;
use Slowlyo\SlowAdmin\Renderers\Form\InputPassword;


class AuthController extends AdminAuthController
{
    public function saveUserSetting($id): \Illuminate\Http\JsonResponse|\Illuminate\Http\Resources\Json\JsonResource
    {
        return $this->response()->fail('演示站点, 不支持该操作哟');
    }

    public function index(): View|Factory|Application
    {
        $remember = '';
        if (config('admin.auth.remember')) {
            $remember = Checkbox::make()->name('remember')->label(" ")->option('记住我');
        }
        $form = Form::make()
            ->title('')
            ->api(url(config('admin.route.prefix') . '/login'))
            ->redirect('/' . config('admin.route.prefix'))
            ->actions([
                Wrapper::make()->size('none')->className('pt-3')->body(
                    Button::make()
                        ->actionType('submit')
                        ->label('登 录')
                        ->level('primary')
                        ->className('w-24')
                ),
            ])
            ->body([
                InputText::make()->name('username')->label('用户名')->required(true)->value('admin'),
                InputPassword::make()->name('password')->label('密码')->required(true)->value('admin'),
                $remember,
            ]);

        $wrapper = Wrapper::make()
            ->className('w-full flex justify-center h-screen items-center bg-default')
            ->size('none')
            ->body(
                Wrapper::make()->size('none')->className('w-96 pb-60')->body([
                    Wrapper::make()
                        ->className('w-full flex justify-end p-5 text-2xl')
                        ->size('none')
                        ->body('Slow Admin'),
                    Card::make()->body($form),
                ])
            );

        $page = Page::make()
            ->css([
                '.amis-scope .cxd-Page-body'    => ['padding' => 0],
                '.amis-scope .cxd-Panel'        => ['border' => 0, 'margin-bottom' => 0],
                '.amis-scope .cxd-Panel-footer' => ['border' => 0],
            ])
            ->className('flex justify-center')
            ->body($wrapper)
            ->toJson();

        return SlowAdmin::make()->setVariable('page', $page)->render('slow-admin::login');
    }

}
