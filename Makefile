core_rel ?= ../../homebrew/homebrew-core/Formula
core_loc ?= $(HOME)/code/pub/homebrew-core/Formula
prev ?= bottle/prev

ifeq ($(wildcard $(core_rel)),)
core := $(core_loc)
else
core := $(core_rel)
endif

ifdef n
fn:=$(shell printf "%.1s" $n)
	ifneq ($(wildcard $(core)/$(fn)),)
	core := $(core)/$(fn)
	endif
fn:=$(core)/$(n).rb
endif

.PHONY: formula

formula:
	@for i in `ls Formula`; do \
		test -e $(core)/$$i && cp -f $(core)/$$i Formula/ || echo "未找到 $$i"; \
	done

syn: formula

patch: ## 快速拷贝patch信息
	@p=$(core_rel)/../Patches/$n ; test -d $$p && cp -rf $$p Patches/ && git add Patches/$n && git status || echo "==> $n: 无需打对应path"

cp:	## 快速更新应用版本
	@test "$n" || ( echo "请输入需要复制的应用 n=xxx" && exit 2 )
	#@test -e $(fn) || ( echo "未找到原始文件 $(fn)" && exit 3 )
	@test -e $(prev) && test $$(($$(cat $(prev)) - $$(date +%s))) -gt $$((10*3600*24)) && make us || echo
	@cp -f $(fn) Formula/ || brew cat $n > Formula/$n.rb
	@n=Formula/$n.rb ; test "$$(cat $$n)" || ( echo "本次未获取到 $n 内容，请核查应用的准确性" && rm -f $$n && exit 4 )
	@git add Formula/$(n)* && git commit -m 'add 快速同步官网 ${n}' || echo "无需更新仓库内文件"

build:	## 快速进行本地构建
	@test -e Formula/$(n).rb || ( echo "请先执行make cp" && exit 2 )
	@brew install --build-bottle fwyit/tools/$n
	@cd bottle && fs=`ls $n*.json 2>/dev/null`; \
	test "$$fs" && echo "请核对是否需要再次生成bottle" && exit 0 || echo ; \
	d=$n.done ; test ! -e $$d && brew bottle --json fwyit/tools/$n --keep-old && \
	fs=`ls $n*.json 2>/dev/null`; \
	brew bottle --merge --keep-old --write $$fs && date > $$d
b: build

check-update:	## 检查待更新的服务
	@brew outdated --formula
cu: check-update
fetch-update:	## 直接下载时待更新的服务
	@make check-update | awk '{print $$1}' | xargs -n 1 brew fetch -s --debug
fu: fetch-update
deps-update:	## 获取待升级应用的依赖服务
	@make check-update | awk '{print $$1}' | xargs -n 1 brew deps --missing -n --skip-recommended | tee /tmp/brew
du: deps-update
un:	## 快速卸载某个应用
	brew uninstall --ignore-dependencies $n || echo "卸载 $n 失败"
us:	## 快速更新core项目
	cd `brew --repo homebrew/core` && git pull origin main
	date +%s > ${prev}
up:	## 快速将bottle的内容上传到github release
	cd bottle && n=`ls $n*tahoe*.tar.gz` && mv $$n $${n/--/-} && gh release upload tahoe $n-*tahoe*.tar.gz

upa:	## 快速同步当前没有上传的应用应用
	for i in `ls bottle | grep tar.gz | grep '\--' | cut -d'-' -f1`; do echo "====> $$i"; $(MAKE) up n=$$i; done

openresty:
	@test "$$(git remote -v | grep openresty)" || git remote add openresty git@github.com:openresty/homebrew-brew.git
	git fetch --depth 1 openresty
	git checkout refs/remotes/openresty/master Formula
	grep openresty/brew  Formula/*.rb| grep depends_on | cut -d':' -f1 | sort | uniq | xargs sed -i '' 's@openresty/brew@fwyit/tools@g'

prd: patch un cp build

build-all:	# 快速批量构建某个应用及其依赖
	@caffeinate -i &; p=$$?; for n in `brew deps --missing --include-build -n $n` $n; do echo "==== 准备更新 $$n"; $(MAKE) prd n=$$n || (echo "!!! 安装依赖 $$n 失败，任意键继续" && read); done; kill $$p
ba: build-all

qd:	# 快速下载信息
	@n=https://github.com/fwyit/homebrew-tools/releases/download/tahoe ; export HOMEBREW_BOTTLE_DOMAIN=$$n HOMEBREW_ARTIFACT_DOMAIN=$$n; \
	brew install fwyit/tools/$n
