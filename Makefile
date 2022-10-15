core = ../../homebrew/homebrew-core/Formula
.PHONY: formula

formula:
	@for i in `ls Formula`; do \
		test -e $(core)/$$i && cp -f $(core)/$$i Formula/ || echo "未找到 $$i"; \
	done

syn: formula

openresty:
	@test "$$(git remote -v | grep openresty)" || git remote add openresty git@github.com:openresty/homebrew-brew.git
	git fetch --depth 1 openresty
	git checkout refs/remotes/openresty/master Formula
	grep openresty/brew  Formula/*.rb| grep depends_on | cut -d':' -f1 | sort | uniq | xargs sed -i '' 's@openresty/brew@fwyit/tools@g'