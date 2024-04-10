REPOS_LIST=$(GITHUB_URL)
REPOS_NAMES = $(shell echo "$(REPOS_LIST)"|tr ' ' '\n' | awk 'NR%2==1')

# iteration
define foreach_repos
	$(call for_each,$(REPOS_LIST),$1,2)
endef

define git_info
	@echo "Bonjour $1"
endef
define git_init
	$(eval MY_NAME=$(MY_NAME_DEFAULT))
	$(eval PUSH_TITLE=$(PUSH_TITLE_DEFAULT))
	$(eval PUSH_MESSAGE=$(PUSH_MESSAGE_DEFAULT))
	$(eval PUSH_COUNT=$(PUSH_COUNT_DEFAULT))
	$(eval GITHUB_URL=$(GITHUB_URL_DEFAULT))
	$(call save_in_tmp)
endef

define git_var
	$(eval url_$(word 1,$1)=$(word 2,$1))
endef

define git_url
	$(call giturl_foreach,$(GITHUB_URL),$1)
endef

define giturl_foreach
	$(eval list=$(strip $1))
	$(eval item=$(wordlist 1,2, $(strip $1)))
	$(eval newlist=$(strip $(wordlist 3,$(words $(strip $1)), $(strip $1))))
	$(if $(item),$(call $2,$(item)))
	$(if $(newlist), $(call giturl_foreach,$(newlist),$2))
endef

define giturl_checkout
	@cd $(REPOS_DIR)/$(word 1,$1) && git checkout $(GIT_BRANCH)
endef

define giturl_tmp_push
	@echo "$1\\" >> $(TMP_SRC)
endef

define giturl_tmp_update
	$(if $(findstring $1,$(GITHUB_URL)),,$(call giturl_tmp_push,$1))
endef

define giturl_clean
	echo "$1"
endef
