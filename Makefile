.PHONY: help build serve watch clean check test epub

MDBOOK ?= mdbook
MDBOOK_EPUB ?= mdbook-epub

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

epub: ## 构建 EPUB 电子书到 book/
	@command -v $(MDBOOK_EPUB) >/dev/null || { \
		echo "未找到 $(MDBOOK_EPUB)，请先安装：cargo install mdbook-epub"; exit 1; }
	$(MDBOOK_EPUB) -s .
	@echo "OK: EPUB 位于 book/*.epub"
