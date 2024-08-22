#!/bin/bash

push() {
	@$(foreach moduleName,$(REPOS_NAMES),$(call git_push_childs,$(REPOS_DIR)/$(moduleName),$1))
	$(call logTitle,git push:,$(CURRENT_DIR))
	@$(call cmd_safe, pwd, git add ., git commit -m '$1', git push $(GIT_REMOTE) $(GIT_BRANCH))
}
