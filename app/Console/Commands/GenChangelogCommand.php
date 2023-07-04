<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Support\ChangelogTrait;

class GenChangelogCommand extends Command
{
    use ChangelogTrait;

    protected $signature = 'gen:changelog';

    protected $description = '生成更新日志';

    public function handle(): void
    {
        $path      = app_path('Http/Controllers/docs/changelog.md');
        $changelog = $this->getChangelog();
        $content   = '';

        foreach ($changelog as $item) {
            $content .= <<<EOF
## {$item['tag_name']}

{$item['body']}

<br>

___{$item['published_at']}___

[查看详情]({$item['html_url']})

<br>


EOF;

        }

        file_put_contents($path, $content);
    }
}
