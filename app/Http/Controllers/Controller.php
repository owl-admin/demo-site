<?php

namespace App\Http\Controllers;

use Slowlyo\OwlAdmin\Admin;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function response()
    {
        return Admin::response();
    }

    public function getChangelog()
    {
        return cache()->remember('admin_changelog', 3600, function () {
            $data = array_merge($this->getGithub(), $this->getGitee());
            $_arr = [];
            foreach ($data as $item) {
                $_time  = key_exists('published_at', $item) ? $item['published_at'] : $item['created_at'];
                $_arr[] = [
                    'tag_name'     => $item['tag_name'],
                    'published_at' => date('Y-m-d H:i:s', strtotime($_time)),
                    'body'         => $item['body'],
                    'html_url'     => key_exists('html_url',
                        $item) ? $item['html_url'] : 'https://gitee.com/slowlyo/owl-admin/releases/tag/' . $item['tag_name'],
                ];
            }

            return $_arr;
        });
    }
}
