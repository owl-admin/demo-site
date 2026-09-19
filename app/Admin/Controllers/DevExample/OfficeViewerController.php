<?php

namespace App\Admin\Controllers\DevExample;

use App\Support\Components;
use Slowlyo\OwlAdmin\Controllers\AdminController;

/**
 * 开发示例 - Office 组件示例
 */
class OfficeViewerController extends AdminController
{
    public function index()
    {
        return $this->response()->success($this->basePage()->body([
            Components::make()->codeView([
                ['title' => 'Controller', 'language' => 'php', 'path' => __FILE__],
            ]),

            amis()->Alert()
                ->level('info')
                ->showIcon(true)
                ->className('mt-4 mb-3')
                ->body('office-viewer 支持预览 docx / xlsx / csv / tsv，暂不支持 ppt；PDF 请使用独立的 pdf-viewer 组件。'),

            amis()->Tabs()->tabs([
                amis()->Tab()->title('Word')->body([
                    amis()->Tpl()->className('mb-2 text-gray-600')->tpl(
                        '使用 office-viewer 预览本地 Word 文档（docx）。'
                    ),
                    amis('office-viewer')
                        ->src('/samples/office/simple.docx')
                        ->height(520),
                ]),

                amis()->Tab()->title('Excel')->body([
                    amis()->Tpl()->className('mb-2 text-gray-600')->tpl(
                        'office-viewer 亦可预览 xlsx（以及 csv / tsv）。可通过 excelOptions 控制公式栏与底部 Sheet 标签栏。'
                    ),
                    amis('office-viewer')
                        ->src('/samples/office/all.xlsx')
                        ->height(560)
                        ->excelOptions([
                            'showFormulaBar'  => true,
                            'showSheetTabBar' => true,
                        ]),
                ]),

                amis()->Tab()->title('PDF')->body([
                    amis()->Tpl()->className('mb-2 text-gray-600')->tpl(
                        'PDF 使用独立的 pdf-viewer 组件进行预览。'
                    ),
                    amis('pdf-viewer')
                        ->src('/samples/office/simple.pdf')
                        ->height(560),
                ]),

                amis()->Tab()->title('相关：input-excel')->body([
                    amis()->Alert()
                        ->level('warning')
                        ->showIcon(true)
                        ->className('mb-3')
                        ->body('input-excel 用于把 Excel 解析成表单值，不是文档预览组件。'),
                    amis()->Card()->title('input-excel 示例')->body(
                        amis()->Form()->mode('normal')->wrapWithPanel(false)->body([
                            amis()->InputExcel()
                                ->name('excel')
                                ->label('上传 Excel')
                                ->description('选择 xlsx/csv 等文件后，会将内容解析到表单字段中（可在下方 JSON 中查看）。'),
                            amis()->Json()->name('excel')->levelExpand(2),
                        ])
                    ),
                ]),
            ]),
        ]));
    }
}
