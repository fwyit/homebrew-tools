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

cp:
	@test "$n" || ( echo "请输入需要复制的应用 n=xxx" && exit 2 )
	@test -e $(fn) || ( echo "未找到原始文件 $(fn)" && exit 3 )
	@test -e $(prev) && test $$(($$(cat $(prev)) - $$(date +%s))) -gt $$((10*3600*24)) && make us || echo
	@cp -f $(fn) Formula/

build:	## 快速进行本地构建
	@test -e $(fn) || ( echo "请先执行make cp" && exit 2 )
	@brew install --build-bottle fwyit/tools/$n
	@cd bottle && fs=`ls $n*.json 2>/dev/null` ; test -z "$$fs" && brew bottle --json fwyit/tools/$n && brew bottle --merge --keep-old --write $$fs
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
	brew uninstall --ignore-dependencies $n
us:	## 快速更新core项目
	cd `brew --repo homebrew/core` && git pull origin main
	date +%s > ${prev}
up:	## 快速将bottle的内容上传到github release
	cd bottle && gh release upload tahoe ${n}*tahoe*tar.gz

openresty:
	@test "$$(git remote -v | grep openresty)" || git remote add openresty git@github.com:openresty/homebrew-brew.git
	git fetch --depth 1 openresty
	git checkout refs/remotes/openresty/master Formula
	grep openresty/brew  Formula/*.rb| grep depends_on | cut -d':' -f1 | sort | uniq | xargs sed -i '' 's@openresty/brew@fwyit/tools@g'
