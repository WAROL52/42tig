define generate_obj
	@mkdir -p $(OUT_DIR)
	cd $(OUT_DIR) && $(CC) -c $(CFLAGS) $(foreach file,$1,../$(file))
	@$(call echoObj,generate_obj:,$(call textOk,OK))
endef

define compile
	@find $(REPOS_DIR)/$1/Makefile
	@$(call echoObj,compilation:,$1)
	@$(call generate_obj,$(call fileSource,$1))
	$(CC) $(CFLAGS) -o $(call progName,$1)   $(OUT_DIR)/*.o
	@$(call echoObj,compilation:,$(call textOk,OK))
endef

define run
	$(call compile,${1})
	@$(call echoWarn,./$(call progName,$1))
	@./$(call progName,$1)
	@echo 
endef

define vrun
	$(call compile,${1})
	@$(call cmd_safe,valgrind --leak-check=full ./$(call progName,$1))
	@echo 
endef
