ifndef TIG_DIR
TIG_DIR=.tig
endif
include $(TIG_DIR)/.env
include $(TIG_DIR)/.tmp
include $(TIG_DIR)/git/Makefile
include $(TIG_DIR)/test/Makefile
include $(TIG_DIR)/run/Makefile
include $(TIG_DIR)/logs/Makefile

.PHONY: all clean help gitpush run varinfo submodule gitpull reinstall install add git\:init

RUN_SOURCES=$(wildcard $(RUN_DIR)/*.c)

GIT_MODULES=$(shell cat .gitmodules)
LIB_NAMES=$(shell awk '/\[submodule .*?\]/{getline; print $$3}' ".gitmodules")

TEST_SOURCES=$(foreach name,$(LIB_NAMES),$(wildcard $(RUN_DIR)/$(name)/*.c))
TEST_SOURCES_WITHOUT_MAIN=$(filter-out %/main.c,$(TEST_SOURCES))
LIB_SOURCES=$(foreach name,$(LIB_NAMES),$(wildcard $(name)/*.c))
UTILS_SOURCES=$(wildcard $(UTILS_DIR)/*.c)
CURRENT_DIR:=$(shell echo $${PWD##*/})
progName=$(OUT_DIR)/$1.out

allfileSource = $(if $(findstring get_next_line,$1),$(foreach file,$(GET_NEXT_LINE_SOURCE),$(REPOS_DIR)/$1/$(file)),\
				$(if $(findstring get_next_line_bonus,$1),$(GET_NEXT_LINE_BONUS_SOURCE),\
				$(wildcard $(REPOS_DIR)/$1/*/*.c) $(wildcard $(REPOS_DIR)/$1/*/*/*.c) $(wildcard $(REPOS_DIR)/$1/*.c)))
fileSource = $(call allfileSource,$1) $(wildcard $(RUN_DIR)/$1/*.c) $(UTILS_SOURCES)

math=$(shell awk "BEGIN {print $1 $2 $3}")

define save_in_tmp
	@echo "MY_NAME=$(MY_NAME)"> $(TMP_SRC)
	@echo "PUSH_TITLE=$(PUSH_TITLE)" >> $(TMP_SRC)
	@echo "PUSH_MESSAGE=$(PUSH_MESSAGE)" >> $(TMP_SRC)
	@echo "PUSH_COUNT=$(PUSH_COUNT)" >> $(TMP_SRC)
	@echo "GITHUB_URL=\\" >> $(TMP_SRC)
	$(call git_url, giturl_tmp_push)
endef

define for_each 
	$(if $3,$(eval _step=$3),$(eval _step=1))
	$(eval list=$(strip $1))
	$(eval item=$(wordlist 1,$(_step), $(strip $1)))
	$(eval newlist=$(strip $(wordlist $(call math,$(_step),+,1),$(words $(strip $1)), $(strip $1))))
	$(if $(item),$(call $2,$(item)))
	$(if $(newlist), $(call for_each,$(newlist),$2,$(_step)))
endef

isTrue=$(subst 0,,$(strip $1))

run\:%:
	$(call make_run_c,$(subst run:,,$@))
	@$(call logEnd,$@)

run-w\:%:clean-out
	@rm -rf out/*.a
	watch -n 0.2 -c -d "make run:$(subst run-w:,,$@)"
	@$(call logEnd,$@)

crun\:%:
	$(call run,$(subst run:,,$@))
	@$(call logEnd,$@)

vrun\:%:
	$(call vrun,$(subst vrun:,,$@))
	@$(call logEnd,$@)

lldb\:%:
	$(call lldb,$(subst lldb:,,$@))
	@$(call logEnd,$@)

gdb\:%:
	$(call gdb,$(subst gdb:,,$@))
	@$(call logEnd,$@)

run:
	@rm -rf out/*.a
	$(call generate_obj,$(RUN_SOURCES) $(LIB_SOURCES) $(TEST_SOURCES_WITHOUT_MAIN) $(UTILS_SOURCES))
	@$(CC) -o $(OUT_DIR)/main.a $(OUT_DIR)/*.o
	$(call echoObj,compilation:,$(call textOk,OK))
	$(call echoWarn,./$(call progName,main))
	@$(OUT_DIR)/main.a
	@echo
	@$(call logEnd,$@)

clean-out : clean-test clean-file

clean-file :
	@$(call cmd,\
	rm -rf $(REPOS_DIR)/get_next_line/*.o,\
	rm -rf $(REPOS_DIR)/get_next_line/*.a,\
	rm -rf $(REPOS_DIR)/printf/*.o,\
	rm -rf $(REPOS_DIR)/printf/*.a,\
	rm -rf $(REPOS_DIR)/libft/*.o,\
	rm -rf $(REPOS_DIR)/libft/*.a,\
	rm -rf out/*)
	@$(call logEnd,$@)

clean-test :
	@$(call cmd,\
	rm -rf $(REPOS_DIR)/get_next_line/$(TEST_DIRNAME),\
	rm -rf $(REPOS_DIR)/printf/$(TEST_DIRNAME),\
	rm -rf $(REPOS_DIR)/libft/$(TEST_DIRNAME))
	@$(call logEnd,$@)

call\:%:
	$(eval _callname=$(subst call:,,$@))
	$(call $(_callname),$1,$2,$3)
	@$(call logEnd,$@)

clean\:%:
	$(call make_clean_c,$(subst clean:,,$@))
	@$(call logEnd,$@)

fclean\:%:
	$(call make_fclean_c,$(subst fclean:,,$@))
	@$(call logEnd,$@)
