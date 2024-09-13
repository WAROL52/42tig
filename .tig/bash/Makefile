define bash_env
	GIT_BRANCH='$(GIT_BRANCH)'\
	GIT_REMOTE='$(GIT_REMOTE)'\
	GITHUB_URL='$(GITHUB_URL)'\
	UTILS_DIR=$(UTILS_DIR)\
	REPOS_DIR=$(REPOS_DIR)\
	RUN_DIR=$(RUN_DIR)\
	CFLAGS='$(CFLAGS)'\
	CFLAGSW='$(CFLAGSW)'\
	CFLAGS_VALGRIND='$(CFLAGS_VALGRIND)'\
	OUT_DIR=$(OUT_DIR)\
	PROJET_NAME='$1'\
	WORKSPACE_PATH='$$PWD/$(REPOS_DIR)/$1'\
	RUN_PATH='$$PWD/$(RUN_DIR)/$1'\
	UTILS_PATH='$$PWD/$(UTILS_DIR)/$1'\
	OUT_PATH='$$PWD/$(OUT_DIR)/$1'\
	TIG_DIR=$(TIG_DIR)
endef

define bash_function
	$(call bash_env,$2) bash -c 'source ./$(TIG_DIR)/bash/core.sh UTILS_DIR=$(UTILS_DIR) && $1 $2 $3 $4 $5 $6 $7 $8 $9'
endef

workspace_add:
	@$(call bash_function,add_all_workspace)
	@$(call logEnd,$@)

workspace_add\:%:
ifdef url
	@$(call bash_function,add_workspace,$(subst workspace_add:,,$@),$(url))
else
	@echo "La variable $(call textObj,url)est réquise!"
endif
	@$(call logEnd,$@)


workspace_list:
	@$(call bash_function,list_workspace)
	@$(call logEnd,$@)

workspace_delete:
	@$(call bash_function,delete_all_workspace)
	@$(call logEnd,$@)

workspace_delete\:%:
	@$(call bash_function,delete_workspace,$(subst workspace_delete:,,$@))
	@$(call logEnd,$@)
