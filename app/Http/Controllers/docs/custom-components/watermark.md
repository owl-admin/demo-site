### __Watermark__

_antd 水印组件_

| 属性名       | 说明                                                                           |
|-----------|------------------------------------------------------------------------------|
| className | Dom 的类名                                                                      |
| width     | 水印的宽度，content 的默认值为自身的宽度                                                     |
| height    | 水印的宽度，content 的默认值为自身的高度                                                     |
| rotate    | 水印绘制时，旋转的角度，单位 °                                                             |
| zIndex    | 追加的水印元素的 z-index                                                             |
| image     | 图片源，建议导出 2 倍或 3 倍图，优先级高 (支持 base64 格式)                                       |
| content   | 水印文字内容                                                                       |
| font      | 文字样式   具体配置参考 (https://ant-design.antgroup.com/components/watermark-cn#font) |
| gap       | 水印之间的间距                                                                      |
| offset    | 水印距离容器左上角的偏移量，默认为 gap/2                                                      |

<br>

### __示例__

```php
amis()->Watermark()->body(
    // 水印包裹的内容
    amis()->TextControl()
)
->width(100) // 设置宽度 (一般不需要)
->height(200) // 设置高度 (一般不需要)
->className('p-5') // eg: 添加内边距
->rotate(90) // 设置旋转角度
->zIndex(999) // 设置 z-index
// ->image(config('admin.logo')) // 可以设置图片
->content('Owl Admin') // 设置水印的文字内容
->font([ // 文字样式
    'color' => 'red'
])
->gap([100, 100]) // 设置水印之间的间距
;
```
