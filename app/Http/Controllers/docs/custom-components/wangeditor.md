### __WangEditor__
_可能会更好用的富文本编辑器~_

| 属性名 | 说明 |
| ------------ | ------------ |
| className | Dom 的类名 |
| name | 字段名 |
| label | 字段标签 |
| placeholder | 占位符 |
| required | 是否必填 |
| requiredOn | 是否必填的条件 |
| value | 默认值 |
| description | 描述 |
| remark | 备注 |
| labelAlign | 表单项标签对齐方式，默认右对齐，仅在 mode为horizontal 时生效 "right" |
| labelRemark | 表单项标签描述 |
| disabled | 是否禁用 |
| disabledOn | 当前表单项是否禁用的条件 |
| visible | 是否显示 |
| visibleOn | 当前表单项是否显示的条件 |
| clearValueOnHidden | 当前表单项隐藏时是否清除值 |
| validations | 校验规则 |
| validationErrors | 校验错误信息 |
| validateApi | 校验接口 |
| autoFill | 自动填充 |
| static  | 是否静态展示 |
| autoFocus | 自动获取焦点 |
| maxLength | 最大长度 |
| toolbarKeys | 工具栏按钮 |
| insertKeys | 插入按钮 |
| excludeKeys | 排除按钮 |
| uploadImageServer | 上传图片的服务器地址 |
| uploadImageMaxSize | 上传图片的最大大小 单位: K 默认 2M |
| uploadImageMaxNumber | 上传图片的最大数量 默认 100 |
| uploadVideoServer | 上传视频的服务器地址 |
| uploadVideoMaxSize | 上传视频的最大大小 单位: K 默认 10M |
| uploadVideoMaxNumber | 上传视频的最大数量 默认 5 |
| height | 编辑器高度 px |

<br>

### __示例__

```php
use Slowlyo\OwlAdmin\Renderers\WangEditor;

// ...

// 一般在 form 中使用
WangEditor::make()->name('content')->label('内容');

// 用于详情展示
WangEditor::make()->static(true)->name('content')->label('内容');

// 或者这样
amis()->WangEditor()->name('content')->label('内容');
```
