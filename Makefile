core = ../../homebrew/homebrew-core/Formula
cask = ../../homebrew/homebrew-cask/Casks

.PHONY: formula

all: syn

formula:
	@for i in `ls Formula`; do \
		test -e $(core)/$$i && cp -f $(core)/$$i Formula/ || echo "未找到 $$i"; \
	done

cask:
	@for i in `ls Casks`; do \
		test -e $(cask)/$$i && cp -f $(cask)/$$i Casks/ || echo "未找到Cask $$i"; \
	done

syn: formula cask