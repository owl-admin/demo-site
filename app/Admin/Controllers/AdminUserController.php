<?php

namespace App\Admin\Controllers;

use App\Support\Components;
use Slowlyo\OwlAdmin\Renderers\Page;

class AdminUserController extends \Slowlyo\OwlAdmin\Controllers\AdminUserController
{
    public function list(): Page
    {
        return parent::list()->toolbar(
            Components::make()->codeView(base_path('vendor/slowlyo/owl-admin/src/Controllers/AdminUserController.php'))
        );
    }
}
