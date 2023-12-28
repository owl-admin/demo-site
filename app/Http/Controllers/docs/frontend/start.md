
> __自行更改前端需要你有对前端有一定了解~__
> __自行更改前端需要你有对前端有一定了解~__
> __自行更改前端需要你有对前端有一定了解~__



> 如果你改出了问题, 可以重新发布资源并覆盖 
> `php artisan admin:publish --assets --force`

<br>

## __发布前端文件__

```bash
php artisan admin:publish --views
```

执行后会将前端需要的文件发布至 `resources/admin-views` 下
这是一个标准的前端项目结构

### __记得先安装依赖__

```bash
# 如果你没有pnpm, 请先安装pnpm (npm i -g pnpm)
pnpm i
```

<br>

## __部分命令__


#### __运行__

```bash
pnpm run dev
```

#### __打包__

```bash
pnpm run build
```


> 打包后将打包文件 (默认在 `dist` 目录下), 复制/移动到 `public/admin` 下即可
