define generate_obj
	$(call cmd_safe,mkdir -p $(OUT_DIR),cd $(OUT_DIR),$(CC) -c $(CFLAGS) $(foreach file,$1,../$(file)))
	@$(call echoObj,generate_obj:,$(call textOk,OK))
endef

define compile
	@find $(REPOS_DIR)/$1/.git | echo "find $(REPOS_DIR)/$1/.git OK"
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
	@$(call cmd_safe,time valgrind $(CFLAGS_VALGRIND) ./$(call progName,$1))
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

define make_clean_c
	@$(call cmd_safe,cd $(REPOS_DIR)/$1,find Makefile,make clean)
endef

define make_fclean_c
	@$(call cmd_safe,cd $(REPOS_DIR)/$1,find Makefile,make fclean)
endef

define make_all_c
	@$(call cmd_safe,cd $(REPOS_DIR)/$1,find Makefile,make all)
endef

define make_run_c
	@$(call make_run_$1,$1)
endef

define make_run_printf
	@$(call echoObj,make all :,$1)
	$(call make_all_c,$(subst r:,,$1))
	@$(call echoObj,compilation:,$1)
	@$(call cmd_safe,\
	$(CC) $(CFLAGS) $(RUN_DIR)/$1/*.c -L$(REPOS_DIR)/$1 -lftprintf -o $(call progName,$1),\
	./$(call progName,$1)\
	)
endef

define make_run_libft
	@$(call echoObj,make all :,$1)
	$(call make_all_c,$(subst r:,,$1))
	@$(call echoObj,compilation:,$1)
	@$(call cmd_safe,\
	$(CC) $(CFLAGS) $(RUN_DIR)/$1/*.c -L$(REPOS_DIR)/$1 -lft -o $(call progName,$1),\
	./$(call progName,$1)\
	)
endef

define make_run_get_next_line
	@$(call run,get_next_line)
endef