# Demo Site Agent Guide

## 项目定位

这是一个以演示为目的的应用，不是精简后的生产业务系统。

- 示例页面、示例控制器、示例服务、种子数据都属于产品的一部分。
- 用于演示的假数据能力必须在运行环境可用，不能只放在 `require-dev`。
- 任何会在页面请求、Seeder、Factory、初始化脚本里执行的依赖，都必须放在 `composer.json` 的 `require`。
- `fakerphp/faker` 属于运行时依赖，因为演示页面和初始化播种都会使用它。

## 开发约定

- 优先保持示例可运行、可访问、可初始化。
- 不要因为“生产优化”删除演示功能依赖。
- 修改 Docker 构建逻辑时，要确认 `composer install --no-dev` 后应用仍可正常启动。
- 改动 Seeder、Factory、示例数据生成逻辑后，至少验证初始化和关键演示页。

## Docker 环境

项目默认通过 Docker 运行，当前运行时基于 PHP 8.4。

### 方式一：独立构建并运行演示镜像

在项目根目录执行：

```bash
make build
make run
```

常用命令：

```bash
make logs
make shell
make stop
make clean
```

默认约定：

- 镜像名：`owl-admin-demo:latest`
- 容器名：`owl-admin-demo`
- 访问地址：`http://localhost:8080`
- 后台地址：`http://localhost:8080/admin`

### 方式二：在 DNMP 开发容器中调试

当前仓库通常挂载在 `php84` 容器的 `/www/admin/demo-site`。

常用命令：

```bash
docker exec php84 sh -lc 'cd /www/admin/demo-site && php -v'
docker exec php84 sh -lc 'cd /www/admin/demo-site && composer install'
docker exec php84 sh -lc 'cd /www/admin/demo-site && php artisan test'
docker exec php84 sh -lc 'cd /www/admin/demo-site && php artisan migrate --force'
docker exec php84 sh -lc 'cd /www/admin/demo-site && php artisan db:seed --force'
```

说明：

- 本机 PHP 版本可能与项目要求不一致，优先在 `php84` 容器内执行 Composer、Artisan、测试命令。
- 如果要验证镜像最终行为，使用 `make build` 和 `make run`。

## 初始化流程

运行镜像后，容器入口脚本会执行 `docker/start.sh`。

- 首次启动如果不存在 `.env`，会自动执行 `./init.sh demo.owladmin.com`。
- `init.sh` 会创建 `database/database.sqlite`、复制 `.env`、生成 `APP_KEY`、执行迁移和播种。
- 因为初始化会执行 `php artisan db:seed --force`，所以 Seeder 依赖的包必须存在于生产依赖中。

## 变更检查

提交与 Docker、依赖、Seeder、Factory、示例页面相关的改动前，至少确认以下命令之一可通过：

```bash
docker exec php84 sh -lc 'cd /www/admin/demo-site && php artisan test'
docker exec php84 sh -lc 'cd /www/admin/demo-site && composer install --no-dev --dry-run --no-interaction'
```
