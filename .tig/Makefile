.PHONY: all clean help gitpush run varinfo submodule gitpull reinstall install add git\:init NOLOG
PHONY:
	@echo > $(TIG_DIR)/.log
define phony
	@echo > $(TIG_DIR)/.log
endef
ifndef TIG_DIR
TIG_DIR=.tig
endif
include $(TIG_DIR)/.env
include $(TIG_DIR)/.tmp
include $(TIG_DIR)/logs/Makefile
include $(TIG_DIR)/bash/Makefile


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

define make_run
	bash -c 'source ./$(UTILS_DIR)/$1/run.sh && run'
endef

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

help:
	@(python3 -m pip list | grep "rich" || python3 -m pip install rich --user ) > $(TIG_DIR)/buff
	@python3 -m rich.markdown README.md

MAKE_DEPS= $(if $(DEPS),$(TIG_DIR)/make,)

define make_log 
	echo "[$$(date +%F_%T)] $1" >> $(TIG_DIR)/make
endef

make:$(TIG_DIR)/make
$(TIG_DIR)/make:$(DEPS)
	$(call make_log,$(COMMANDS))
	@$(call cmd,$(COMMANDS))
	@$(call logEnd,$@)

define make_watch 
	(python3 -m pip list | grep "watchdog" || python3 -m pip install watchdog --user ) > $(TIG_DIR)/buff
	
	python3 $(TIG_DIR)/bin/watch.py "$1" "$2"
endef

TEST=NO
watch:
	$(eval TEST=$(subst ", \", $(COMMANDS)))
	@$(call make_watch,$(TEST),$(DEPS))
