define push_to_github
	$(call run_shell_safe, cd $1,pwd,git add ., git commit -m '$2', git push $(GIT_REMOTE) $(GIT_BRANCH))
endef

define git_push_childs
	$(call logTitle,git push:,$1)
	@$(if $(wildcard $1/.git),$(call push_to_github,$1,$2), echo "$(call textObj,$1)non installé!")

endef

define git_push
	@$(foreach moduleName,$(REPOS_NAMES),$(call git_push_childs,$(REPOS_DIR)/$(moduleName),$1))
	$(call logTitle,git push:,$(CURRENT_DIR))
	@$(call run_shell_safe, pwd, git add ., git commit -m '$1', git push $(GIT_REMOTE) $(GIT_BRANCH))
endef

define git_push_auto
	$(eval PUSH_COUNT=$(call math,$(PUSH_COUNT),+,1))
	$(call save_in_tmp)
	$(call git_push,<$(CURRENT_DIR)>[$(PUSH_TITLE)]($(PUSH_COUNT)): $(PUSH_MESSAGE))
endef

define git_pull
endef