<?php

namespace App\Admin\Controllers\Example;

use Slowlyo\OwlAdmin\Renderers\Page;
use Slowlyo\OwlAdmin\Controllers\AdminController;

class FormController extends AdminController
{
    public function index()
    {
        return $this->returnJsonPage('表单各种展示模式汇总', 'Elements/form.json');
    }

    public function all()
    {
        return $this->returnJsonPage('所有Form示例', 'Elements/all_form.json');
    }

    public function reaction()
    {
        return $this->returnJsonPage('显隐切换示例', 'Elements/reaction.json');
    }

    public function conditionBuilder()
    {
        return $this->returnJsonPage('条件生成器', 'Elements/condition_builder.json');
    }

    public function dialog()
    {
        return $this->returnJsonPage('弹框', 'Elements/dialog.json');
    }

    public function tabs()
    {
        return $this->returnJsonPage('选项卡', 'Elements/tabs.json');
    }

    public function wizard()
    {
        return $this->returnJsonPage('步骤表单', 'Elements/wizard.json');
    }

    private function returnJsonPage($title, $path)
    {
        $body = file_get_contents(admin_path($path));

        $page = Page::make()->title($title)->body(json_decode($body));

        return $this->response()->success($page);
    }
}
