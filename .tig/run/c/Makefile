define generate_obj
	$(call cmd_safe,mkdir -p $(OUT_DIR),cd $(OUT_DIR),$(CC) -c $(CFLAGS) $(foreach file,$1,../$(file)))
	@$(call echoObj,generate_obj:,$(call textOk,OK))
endef

define compile
	@find $(REPOS_DIR)/$1/.git
	@$(call echoObj,compilation:,$1)
	@$(call generate_obj,$(call fileSource,$1))
	@$(call cmd_safe,$(CC) $(CFLAGS) -o $(call progName,$1)   $(OUT_DIR)/*.o)
	@$(call echoObj,compilation:,$(call textOk,OK))
endef

define run
	$(call compile,$1)
	@$(call cmd_safe,./$(call progName,$1))
endef

define vrun
	$(call compile,${1})
	@$(call cmd_safe,valgrind $(CFLAGS_VALGRIND) ./$(call progName,$1))
	@echo 
endef

define lldb
	$(call compile,${1})
	@$(call cmd_safe,$(LLDB) ./$(call progName,$1))
	@echo 
endef

define gdb
	$(call compile,${1})
	@$(call cmd_safe,$(GDB) ./$(call progName,$1))
	@echo 
endef
