### SvgIcon
_用于显示 iconify 图标_

| 属性名  | 说明 |
| ------------ | ------------ |
| className | Dom 的类名 |
| icon | 图标名称<br>查找图标: [https://icones.js.org](https://icones.js.org) |


##### 示例

```php
use Slowlyo\OwlAdmin\Renderers\WangEditor;

// ...

SvgIcon::make()->icon('ic:baseline-person');

// 红色图标
SvgIcon::make()->icon('ic:baseline-person')->className('text-red-500');

// 或者这样
amis()->SvgIcon()->icon('ic:baseline-person');
```
