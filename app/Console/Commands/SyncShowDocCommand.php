<?php

namespace App\Console\Commands;

use Illuminate\Support\Str;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use App\Http\Controllers\IndexController;

class SyncShowDocCommand extends Command
{
    protected $signature = 'sync:show-doc';

    protected $description = '同步到show doc';

    public function handle(): void
    {
        if (cache()->has('doc_synced')) {
            $this->info('synced...');
            return;
        }
        $this->sync();
    }

    public function cachedPages()
    {
        return (new IndexController())->cachedPages()[1]['children'];
    }

    public function sync($pages = [], $cat = '')
    {
        if (!$pages) {
            $pages = $this->cachedPages();
        }

        foreach ($pages as $page) {
            if (key_exists('schemaApi', $page)) {
                $this->syncPage($page, $cat);
            } else {
                $this->sync(data_get($page, 'children', []), $page['label']);
            }
        }

        cache()->forever('doc_synced', true);
    }

    public function syncPage($page, $cat = '')
    {
        $path = urldecode(str_replace('/api/docs/load_md?path=', '', $page['schemaApi']));

        if (Str::endsWith($path, 'changelog')) {
            return;
        }

        $this->info('syncing : ' . $path);

        if (Str::startsWith($path, '/')) {
            $content = file_get_contents(app_path('Http/Controllers' . $path));
        } else {
            // 外部文章 缓存一小时
            $content = cache()->remember('docs_external_article_' . $path, 3600, fn() => file_get_contents($path));
        }

        $api = 'https://www.showdoc.cc/server/api/item/updateByApi';

        Http::post($api, [
            'api_key'      => config('app.show_doc.api_key'),
            'api_token'    => config('app.show_doc.api_token'),
            'cat_name'     => $cat,
            'page_title'   => $page['label'],
            'page_content' => $content,
        ]);
    }
}
