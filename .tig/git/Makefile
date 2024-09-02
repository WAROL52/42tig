include $(TIG_DIR)/git/push_pull/Makefile
include $(TIG_DIR)/git/add_delete/Makefile
include $(TIG_DIR)/git/install_remove/Makefile
include $(TIG_DIR)/git/repos_branch/Makefile

GIT_TARGET=$(GIT_PREFIX_ALIAS)$(SEPARATOR)
gitalias=$(foreach _alias,$1,$(GIT_TARGET)$(_alias))
gitaliasWithargs=$(foreach _alias,$1,$(GIT_TARGET)$(_alias)\:$(if $2,$2,%))
gitaliasArg=$(shell echo $1 | sed 's/$(GIT_TARGET).*://g')

$(call gitalias,$(GIT_ALIAS_INIT)):
	$(call git_init)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_ADD)):
ifdef url
	$(eval name=$(call gitaliasArg,$@))
	$(eval giturl=$(name) $(url))
	$(call git_add,$(giturl))
	$(call save_in_tmp)
	$(call giturl_tmp_update,$(giturl))
else
	@echo "La variable $(call textObj,url)est réquise!"
endif
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_ADD)):
	$(call git_url,git_add)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_DELETE)):
	$(call git_delete,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_INSTALL)):
	$(call git_install,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_INSTALL)):
	$(call git_install_all)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_REMOVE)):
	$(call git_remove,$(call gitaliasArg,$@))
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_REMOVE)):
	$(call git_remove_all)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_PUSH),auto):clean-out
	$(call git_push_auto)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_PUSH)):clean-out
ifdef m
	$(call git_push_childs,$(call gitaliasArg,$@),$m)
else
	@echo "La variable $(call textObj,m)est réquise!"
endif

$(call gitalias,$(GIT_ALIAS_PUSH)):clean-out
ifdef m
	$(call push,$m)
else
	@echo "La variable $(call textObj,m)est réquise!"
endif
	@$(call logEnd,$@)

$(call gitalias,$(GIT_ALIAS_PULL)):
	@$(call cmd_safe,git pull --rebase --recurse-submodules)
	$(call foreach_repos,giturl_checkout)
	@$(call logEnd,$@)

gitpush:
	@$(call bash_function,git_push_auto,rolio)