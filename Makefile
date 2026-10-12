core_rel ?= ../../homebrew/homebrew-core/Formula
core_loc ?= $(HOME)/code/pub/homebrew-core/Formula

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
	@cp -f $(fn) Formula/

build:
	@test -e $(fn) || ( echo "请先执行make cp" && exit 2 )
	@brew install --build-bottle fwyit/tools/$n
	@cd bottle && fs=`ls $n*.json` && test -z "$$fs" && brew bottle --json fwyit/tools/$n && brew bottle --merge --keep-old --write $$fs

check-update:
	@brew outdated --formula
cu: check-update

openresty:
	@test "$$(git remote -v | grep openresty)" || git remote add openresty git@github.com:openresty/homebrew-brew.git
	git fetch --depth 1 openresty
	git checkout refs/remotes/openresty/master Formula
	grep openresty/brew  Formula/*.rb| grep depends_on | cut -d':' -f1 | sort | uniq | xargs sed -i '' 's@openresty/brew@fwyit/tools@g'