include $(TIG_DIR)/test/printf/Makefile
include $(TIG_DIR)/test/libft/Makefile
include $(TIG_DIR)/test/get_next_line/Makefile

define norminette
	$(call logTitle,Norminette:,$1)
	@norminette $(REPOS_DIR)/$1 || echo "norminette: KO"
endef
define runtest
	$(if $(findstring 1,$4),$(call norminette,$1))

	$(call logTitle,Test:,$1)
	@$(call cmd_safe,\
		cd $(REPOS_DIR)/$1,\
		find $(TEST_DIRNAME)/Makefile || git clone $2 $(TEST_DIRNAME),\
		cd $(TEST_DIRNAME),\
		$3\
	)
endef

