# Owl Admin Demo

owl-admin demo站点源码

- Laravel 13
- PHP 8.4 Docker 镜像

## Docker 快速运行

### 方式一：直接拉取运行（推荐）
```bash
# 拉取并运行最新版本
docker run -d --name owl-demo -p 8080:80 ghcr.io/owl-admin/demo-site::master
```

### 方式二：本地构建运行
```bash
# 构建镜像
make build

# 运行容器
make run

# 或者一键构建并运行
make build run
```

### 访问应用
- 应用地址：http://localhost:8080
- 管理后台：http://localhost:8080/admin

### 其他命令
```bash
# 推送到 DockerHub
make push

# 停止容器
docker stop owl-demo

# 查看日志
docker logs owl-demo
```

## Blade 权限示例

初始化后可在“开发示例”中打开“Blade 页面权限示例”。为角色授予同名权限后，菜单显示和 iframe 页面访问会同时生效。

## 传统部署

### 欢迎和我一起维护 Demo / 框架文档
