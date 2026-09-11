.PHONY: help build serve watch clean check test

MDBOOK ?= mdbook

help: ## 显示可用命令
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

build: ## 构建 HTML 到 book/
	$(MDBOOK) build

serve: ## 本地预览（默认 http://localhost:3000，自动重载）
	$(MDBOOK) serve --open

watch: ## 监听源文件变化并重新构建，不启动服务器
	$(MDBOOK) watch

clean: ## 删除构建产物 book/
	$(MDBOOK) clean

check: ## 检查 mdbook 环境与配置
	$(MDBOOK) --version
	@$(MDBOOK) build --dest-dir /tmp/mdbook-check >/dev/null && echo "OK: 构建通过"

test: build ## 别名：构建并校验
	@echo "OK: 构建产物位于 book/"
