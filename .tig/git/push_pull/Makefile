define push_to_github
	$(call runCmds,cd $1,git add ., git commit -m '$2', git push $(GIT_REMOTE) $(GIT_BRANCH))
endef
# $(call runCmd,1,git add .)
# $(call runCmd,2,git commit -m '$1')
# $(call runCmd,3,git push $(GIT_REMOTE) $(GIT_BRANCH))

# @git add .
# @echo 'git commit -m "$1" && git push'
# @(git commit -m "$1" && git push && echo "$(call textObj,git push:)$(CURRENT_DIR) $(call textOk,OK)")|| echo "$(call textObj,git push:)$(CURRENT_DIR) $(call textError,KO)"

define git_push_childs
	@echo "\n------------------------------"
	$(call echoObj,git push:,$1)
	@if [ -e $1/Makefile ]; then \
		(cd $1 && make push m="$2" && echo "$(call textObj,git push:)$1 $(call textOk,OK)") || echo "$(call textObj,git push:)$1 $(call textError,KO)"; \
	else \
		echo "Le fichier $(call textObj,$1/Makefile)est réquise!"; \
	fi

endef

define git_push
	@$(foreach moduleName,$(REPOS_NAMES),$(call git_push_childs,$(REPOS_DIR)/$(moduleName),$1))
	@echo "\n------------------------------"
	$(call echoObj,git push:,$(CURRENT_DIR))
	$(call push_to_github,,$1)
endef

define git_push_auto
	$(eval PUSH_COUNT=$(call math,$(PUSH_COUNT),+,1))
	$(call save_in_tmp)
	$(call git_push,<$(CURRENT_DIR)>[$(PUSH_TITLE)]($(PUSH_COUNT)): $(PUSH_MESSAGE))
endef

define git_pull
endef