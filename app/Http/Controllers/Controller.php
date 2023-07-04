<?php

namespace App\Http\Controllers;

use Slowlyo\OwlAdmin\Admin;
use App\Support\ChangelogTrait;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests, ChangelogTrait;

    public function response()
    {
        return Admin::response();
    }
}
