<?php

$msgBtn = amisMake()
    ->UrlAction()
    ->icon('fa-brands fa-github')
    ->blank()
    ->url('https://github.com/Slowlyo/owl-admin-demo')
    ->tooltip('demo 源码')
    ->className('mr-2 rounded-full');

\Slowlyo\OwlAdmin\Admin::prependNav($msgBtn);
