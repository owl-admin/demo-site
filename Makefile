# Docker 配置
IMAGE_NAME = owl-admin-demo
CONTAINER_NAME = owl-admin-demo
DOCKER_HUB_USER = slowlyo
TAG = latest
PORT = 8077

# 默认目标
.PHONY: help
help:
	@echo "可用命令:"
	@echo "  build      - 构建Docker镜像"
	@echo "  run        - 运行容器"
	@echo "  build-run  - 构建并运行"
	@echo "  stop       - 停止容器"
	@echo "  clean      - 停止并删除容器"
	@echo "  logs       - 查看容器日志"
	@echo "  shell      - 进入容器shell"
	@echo "  push       - 推送到Docker Hub"
	@echo "  tag        - 给镜像打标签"
	@echo ""

# 构建镜像
.PHONY: build
build:
	@echo "正在构建Docker镜像..."
	docker build -t $(IMAGE_NAME):$(TAG) .
	@echo "镜像构建完成: $(IMAGE_NAME):$(TAG)"

# 运行容器
.PHONY: run
run:
	@echo "正在启动容器..."
	@if [ "$$(docker ps -aq -f name=$(CONTAINER_NAME))" ]; then \
		echo "停止现有容器..."; \
		docker stop $(CONTAINER_NAME) || true; \
		docker rm $(CONTAINER_NAME) || true; \
	fi
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p $(PORT):80 \
		-e APP_ENV=production \
		-e APP_DEBUG=false \
		$(IMAGE_NAME):$(TAG)
	@echo "容器已启动，访问地址: http://localhost:$(PORT)"

# 构建并运行
.PHONY: build-run
build-run: build run

# 停止容器
.PHONY: stop
stop:
	@echo "正在停止容器..."
	docker stop $(CONTAINER_NAME) || true
	@echo "容器已停止"

# 清理容器
.PHONY: clean
clean: stop
	@echo "正在删除容器..."
	docker rm $(CONTAINER_NAME) || true
	@echo "容器已删除"

# 查看日志
.PHONY: logs
logs:
	docker logs -f $(CONTAINER_NAME)

# 进入容器
.PHONY: shell
shell:
	docker exec -it $(CONTAINER_NAME) bash

# 给镜像打标签
.PHONY: tag
tag:
	@echo "正在给镜像打标签..."
	docker tag $(IMAGE_NAME):$(TAG) $(DOCKER_HUB_USER)/$(IMAGE_NAME):$(TAG)
	@echo "标签已创建: $(DOCKER_HUB_USER)/$(IMAGE_NAME):$(TAG)"

# 推送到Docker Hub
.PHONY: push
push: tag
	@echo "正在推送镜像到Docker Hub..."
	docker push $(DOCKER_HUB_USER)/$(IMAGE_NAME):$(TAG)
	@echo "镜像推送完成: $(DOCKER_HUB_USER)/$(IMAGE_NAME):$(TAG)"

# 登录Docker Hub
.PHONY: login
login:
	@echo "登录Docker Hub..."
	docker login

# 完整发布流程
.PHONY: release
release: build tag push
	@echo "发布完成!"

# 开发模式 - 构建并运行，然后查看日志
.PHONY: dev
dev: build-run
	@echo "等待服务启动..."
	@sleep 5
	@make logs
