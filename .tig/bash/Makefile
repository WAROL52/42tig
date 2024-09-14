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

GIT_TARGET=$(GIT_PREFIX_ALIAS)$(SEPARATOR)
gitalias=$(foreach _alias,$1,$(GIT_TARGET)$(_alias))
gitaliasWithargs=$(foreach _alias,$1,$(GIT_TARGET)$(_alias)\:$(if $2,$2,%))
gitaliasArg=$(shell echo $1 | sed 's/$(GIT_TARGET).*://g')

$(call gitalias,$(GIT_ALIAS_ADD)):
	@$(call bash_function,add_all_workspace)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_ADD)):
ifdef url
	@$(call bash_function,add_workspace,$(call gitaliasArg,$@),$(url))
else
	@echo "La variable $(call textObj,url)est réquise!"
endif
	@$(call logEnd,$@)


$(call gitalias,$(GIT_ALIAS_LIST)):
	@$(call bash_function,list_workspace)
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_DELETE)):
	@$(call bash_function,delete_all_workspace)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_DELETE)):
	@$(call bash_function,delete_workspace,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_INSTALL)):
	@$(call bash_function,install_all_workspace)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_INSTALL)):
	@$(call bash_function,install_workspace,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_REMOVE)):
	@$(call bash_function,remove_all_workspace)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_REMOVE)):
	@$(call bash_function,remove_workspace,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_PUSH)):
	@$(call bash_function,push_all_workspace)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_PUSH)):
	@$(call bash_function,push_workspace,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_PULL)):
	@$(call bash_function,pull_workspace)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(ALIAS_RUN)):
	@$(call bash_function,run_workspace,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(ALIAS_TEST)):
	@$(call bash_function,test_workspace,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(ALIAS_PERF)):
	@$(call bash_function,perf_workspace,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

GET_PATERN=./$(MAKE_CMD_DIR)/$1/**/*$2 ./$(REPOS_DIR)/$1/**/*$2 ./$(RUN_DIR)/$1/**/*$2
PATERN_C= $(call GET_PATERN,$1,.c) $(call GET_PATERN,$1,.h) $(call GET_PATERN,$1,.cpp)
PATERN_CMD= $(call GET_PATERN,$1,.sh)
PATERN_TXT= $(call GET_PATERN,$1,.txt) $(call GET_PATERN,$1,.text)
PATERN_MAKEFILE= $(call GET_PATERN,$1,Makefile)
PATERN_PY= $(call GET_PATERN,$1,.py)
PATERN_BER= $(call GET_PATERN,$1,.ber)

PATERN_ALL= $(call PATERN_BER,$1) $(call PATERN_C,$1) $(call PATERN_CMD,$1) $(call PATERN_MAKEFILE,$1) $(call PATERN_PY,$1) $(call PATERN_TXT,$1)
DEPS=
run-w\:%:clean-out
	@rm -rf out/*.a
	@$(call make_fclean_c,$(subst run-w:,,$@))
	@# @watch -n 0.2 -c -d "make run:$(subst run-w:,,$@)"
	@sleep 0.5 ; clear
	@$(call make_watch, $(call bash_function,run_w_workspace,$(subst run-w:,,$@)) ,$(call PATERN_ALL,$(subst run-w:,,$@)) $(DEPS))
	@$(call logEnd,$@)