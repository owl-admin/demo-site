<?php

namespace App\Admin\Controllers;

use App\Support\Components;
use Slowlyo\OwlAdmin\Renderers\Page;

class AdminMenuController extends \Slowlyo\OwlAdmin\Controllers\AdminMenuController
{
    public function list(): Page
    {
        return parent::list()->toolbar(
            Components::make()->codeView(base_path('vendor/slowlyo/owl-admin/src/Controllers/AdminMenuController.php'))
        );
    }
}
