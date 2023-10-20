<?php

namespace App\Support;

class Components
{
    public static function make()
    {
        return new self();
    }

    public function codeView($path)
    {
        if (is_string($path)) {
            $content = amis()
                ->EditorControl()
                ->language('php')
                ->readOnly(true)
                ->size('xxl')
                ->value(file_get_contents($path));
        } else {
            $tabs = [];
            foreach ($path as $item) {
                $tabs[] = [
                    'title' => $item['title'],
                    'tab'   => amis()
                        ->EditorControl()
                        ->language($item['language'] ?? 'php')
                        ->readOnly(true)
                        ->size('xxl')
                        ->value(file_get_contents($item['path'])),
                ];
            }
            $content = amis()->Tabs()->tabs($tabs);
        }

        return amis()->DialogAction()->label('页面源码')->icon('fa fa-code')->dialog(
            amis()
                ->Dialog()
                ->title('页面源码')
                ->actions([])
                ->title('')
                ->size('lg')
                ->closeOnEsc(true)
                ->closeOnOutside(true)
                ->body($content)
        );
    }
}
