core = ../../homebrew/homebrew-core/Formula
cask_path = ../../homebrew/homebrew-cask/Casks/
.PHONY: formula

formula:
	@for i in `ls Formula`; do \
		test -e $(core)/$$i && cp -f $(core)/$$i Formula/ || echo "未找到 Formula: $$i"; \
	done

cask:
	@for i in `ls Casks`; do \
		test -e $(cask_path)/$$i && cp -f $(cask_path)/$$i Casks || echo "未找到 Cask: $$i"; \
	done

syn: formula cask