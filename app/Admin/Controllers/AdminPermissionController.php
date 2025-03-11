<?php

namespace App\Admin\Controllers;

use App\Support\Components;
use Slowlyo\OwlAdmin\Renderers\Page;

class AdminPermissionController extends \Slowlyo\OwlAdmin\Controllers\AdminPermissionController
{
    public function list(): Page
    {
        return parent::list()->toolbar(
            Components::make()->codeView(base_path('vendor/slowlyo/owl-admin/src/Controllers/AdminPermissionController.php'))
        );
    }
}
