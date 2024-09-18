REPO_CORE_URL = https://github.com/WAROL52/.core_tig.git
TIG_DIR=.core_tig
INCLUDED_MAKEFILE_CORE = $(TIG_DIR)/Makefile
CORE=core
CORE_PULL=$(CORE)\:pull
CORE_CLEAN=$(CORE)\:clean
CORE_PUSH=$(CORE)\:push


ifeq ("$(wildcard $(INCLUDED_MAKEFILE_CORE))", "")
$(shell git clone $(REPO_CORE_URL))
endif


all:
	@$(call bash_function,monitorMenu)


$(CORE):
	@cd $(TIG_DIR) ; git status

$(CORE_GET):

$(CORE_PULL):
	@cd $(TIG_DIR) ; git pull

$(CORE_PUSH):
	@$(call bash_function,push_workspace,$(TIG_DIR))
	@$(call logEnd,$@)

$(CORE_CLEAN):
	@rm -rf $(TIG_DIR)

include $(INCLUDED_MAKEFILE_CORE)
