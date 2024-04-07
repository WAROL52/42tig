include $(TIG_DIR)/git/push_pull/Makefile
include $(TIG_DIR)/git/add_delete/Makefile
include $(TIG_DIR)/git/install_remove/Makefile
include $(TIG_DIR)/git/repos_branch/Makefile

GIT_TARGET=$(GIT_ALIAS)$(SEPARATOR)
gitalias=$(foreach _alias,$1,$(GIT_TARGET)$(_alias))
gitaliasWithargs=$(foreach _alias,$1,$(GIT_TARGET)$(_alias)\:$(if $2,$2,%))
gitaliasArg=$(shell echo $1 | sed 's/.*://g')

$(GIT_TARGET)init:
	$(call git_init)
	@$(call logEnd,$@)

$(GIT_TARGET)add\:%:
ifdef url
	$(eval name=$(subst $(GIT_TARGET)add:,,$@))
	$(eval giturl=$(name) $(url))
	$(call git_add,$(giturl))
	$(call save_in_tmp)
	$(call giturl_tmp_update,$(giturl))
else
	@echo "La variable $(call textObj,url)est réquise!"
endif
	@$(call logEnd,$@)

$(GIT_TARGET)add:
	$(call git_url,git_add)
	@$(call logEnd,$@)

$(GIT_TARGET)delete\:%:
	$(call git_delete,$(subst $(GIT_TARGET)delete:,,$@))
	@$(call logEnd,$@)

$(GIT_TARGET)install\:%:
	$(call git_install,$(subst $(GIT_TARGET)install:,,$@))
	@$(call logEnd,$@)

$(GIT_TARGET)install:
	$(call git_install_all)
	@$(call logEnd,$@)

$(GIT_TARGET)remove\:%:
	$(call git_remove,$(subst $(GIT_TARGET)remove:,,$@))
	@$(call logEnd,$@)

$(GIT_TARGET)remove:
	$(call git_remove_all)
	@$(call logEnd,$@)

$(call gitaliasWithargs,$(GIT_ALIAS_PUSH),auto):
	@echo "auto= $(call gitaliasWithargs,$(GIT_ALIAS_PUSH),auto)"
	@echo "rest=$(call gitaliasWithargs,$(GIT_ALIAS_PUSH))"
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
	@$(call cmd_safe,git pull --recurse-submodules)
	@$(call logEnd,$@)
