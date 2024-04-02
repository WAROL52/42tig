define git_install
	git submodule update --init $(REPOS_DIR)/$1
	$(call git_url,git_var)
	$(call giturl_checkout,$1,$(url_$(libname)))
endef

define git_install_all
	@git submodule update --init --recursive -f
	$(call foreach_repos,giturl_checkout)
endef

define git_remove
	@git submodule deinit -f $(REPOS_DIR)/$1
endef

define git_remove_all
	@git submodule deinit -f --all
endef