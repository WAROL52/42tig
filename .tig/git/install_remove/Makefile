define git_install
	git submodule update --init $(REPOS_DIR)/$1
	$(call git_url,git_var)
	$(call checkout_master,$1,$(url_$(libname)))
endef

define git_install_all
	@git submodule update --init --recursive -f
	$(call git_url,checkout_master)
endef

define git_remove
	@git submodule deinit -f $(REPOS_DIR)/$1
endef

define git_remove_all
	@git submodule deinit -f --all
endef