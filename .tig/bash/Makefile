define bash_env
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
	$(call bash_env,$2) bash -c 'source ./$(TIG_DIR)/bash/core.sh UTILS_DIR=$(UTILS_DIR) && $1 $2'
endef