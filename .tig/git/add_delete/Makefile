define git_add
	@(find .gitmodules || touch .gitmodules)
	$(eval _cmd=git submodule add -f $(word 2,$1) $(REPOS_DIR)/$(word 1,$1))
	@echo "$(_cmd)"
	@($(_cmd))|| echo "KO"
endef

define git_delete
	$(eval libname=$1)
	$(call git_url,git_var)
	$(eval GITHUB_URL=$(filter-out $(libname) $(url_$(libname)),$(GITHUB_URL)))
	$(call save_in_tmp)
	@find $(REPOS_DIR)/$(libname)
	git rm -f $(REPOS_DIR)/$(libname)
endef