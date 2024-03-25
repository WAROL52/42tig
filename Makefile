# .SILENT:clean
.PHONY: all clean help gitpush run varinfo submodule gitpull reinstall install add
include .env
include .default.env
include .gituman/.env
include .gituman/.default.env
include .gituman/Makefile

CC= gcc        # compilateur
CFLAGS= -Wall -Wextra -Werror  # options de compilation pour les sources C 
LIB_DIR=lib
OUT_DIR=out
RUN_DIR=run
UTILS_DIR=utils
RUN_SOURCES=$(wildcard $(RUN_DIR)/*.c)

GIT_MODULES=$(shell cat .gitmodules)
LIB_NAMES=$(shell awk '/\[submodule .*?\]/{getline; print $$3}' ".gitmodules")

TEST_SOURCES=$(foreach name,$(LIB_NAMES),$(wildcard $(RUN_DIR)/$(name)/*.c))
TEST_SOURCES_WITHOUT_MAIN=$(filter-out %/main.c,$(TEST_SOURCES))
LIB_SOURCES=$(foreach name,$(LIB_NAMES),$(wildcard $(name)/*.c))
UTILS_SOURCES=$(wildcard $(UTILS_DIR)/*.c)

COM_COLOR = \033[0;34m
OBJ_COLOR = \033[0;36m
OK_COLOR = \033[0;32m
ERROR_COLOR = \033[0;31m
WARN_COLOR = \033[0;33m
NO_COLOR = \033[m

progName=$(OUT_DIR)/$1.a
fileSource = $(wildcard $(RUN_DIR)/$1/*.c) $(wildcard $(LIB_DIR)/$1/*.c) $(UTILS_SOURCES)

textcolor =${1}${2} $(NO_COLOR)
textCom =$(call textcolor,$(COM_COLOR),${1})
textObj =$(call textcolor,$(OBJ_COLOR),${1})
textOk =$(call textcolor,$(OK_COLOR),${1})
textError =$(call textcolor,$(ERROR_COLOR),${1})
textWarn =$(call textcolor,$(WARN_COLOR),${1})

echoCom = @echo "$(call textCom,${1})${2}"
echoObj = @echo "$(call textObj,${1})${2}"
echoOK = @echo "$(call textOk,${1})${2}" 
echoError = @echo "$(call textError,${1})${2}" 
echoWarn = @echo "$(call textWarn,${1})${2}"

math=$(shell awk "BEGIN {print $1 $2 $3}")

define generate_obj
	@mkdir -p $(OUT_DIR)
	@cd $(OUT_DIR) && $(CC) -c $(CFLAGS) $(foreach file,$1,../$(file))
	$(call echoObj,generate_obj:,$(call textOk,OK))
endef

define compile
	@find $(LIB_DIR)/$1/Makefile
	$(call echoObj,compilation:,$1)
	$(call generate_obj,$(call fileSource,$1))
	@$(CC) -o $(call progName,$1) $(OUT_DIR)/*.o
	$(call echoObj,compilation:,$(call textOk,OK))
endef

define run
	$(call compile,${1})
	$(call echoWarn,./$(call progName,$1))
	@./$(call progName,$1)
	@echo 
endef

define gitpushchild
	@echo "\n------------------------------"
	$(call echoObj,git push:,$1)
	@if [ -e $1/Makefile ]; then \
		(cd $1 && make push m="$2" && echo "$(call textObj,git push:)$1 $(call textOk,OK)") || echo "$(call textObj,git push:)$1 $(call textError,KO)"; \
	else \
		echo "Le fichier $(call textObj,$1/Makefile)est réquise!"; \
	fi

endef

define initEnv
	@echo "MY_NAME=$(MY_NAME)"> .env
	@echo "PUSH_TITLE=$(PUSH_TITLE)" >> .env
	@echo "PUSH_MESSAGE=$(PUSH_MESSAGE)" >> .env
	@echo "PUSH_COUNT=$(PUSH_COUNT)" >> .env
	@echo "GITHUB_URL=\\" >> .env
	$(call git_url,update_env)
endef

define update_env
	@echo "$1\\" >> .env
endef

define update_url
	$(if $(findstring $1,$(GITHUB_URL)),,$(call update_env,$1))
endef

define checkout_master
	@cd $(LIB_DIR)/$(word 1,$1) && git checkout master
endef

define git_add
	@(find .gitmodules || touch .gitmodules)
	(git submodule add -f $(word 2,$1) $(LIB_DIR)/$(word 1,$1))|| echo "KO"
endef

define git_map
	$(eval list=$(strip $1))
	$(eval item=$(wordlist 1,2, $(strip $1)))
	$(eval newlist=$(wordlist 3,$(words $(strip $1)), $(strip $1)))
	$(if $(item),$(call $2,$(item)))
	$(if $(newlist),$(call git_map,$(newlist),$2))
endef

define git_url
	$(call git_map,$(GITHUB_URL),$1)
endef

define git_var
	$(eval url_$(word 1,$1)=$(word 2,$1))
endef

define push
	@$(foreach moduleName,$(LIB_NAMES), \
        $(call gitpushchild,$(moduleName),$1) \
    )
	@echo "\n------------------------------"
	$(call echoObj,git push:,Workspace)
	git add .
	@echo 'git commit -m "$1" && git push'
	@(git commit -m "$1" && git push && echo "$(call textObj,git push:)Workspace $(call textOk,OK)")|| echo "$(call textObj,git push:)Workspace $(call textError,KO)"
endef

all:varinfo

varinfo:
	$(call echoObj,MY_NAME:,$(MY_NAME))
	$(call echoObj,CC:,$(CC))
	$(call echoObj,CFLAGS:,$(CFLAGS))
	$(call echoObj,OUT_DIR:,$(OUT_DIR))
	$(call echoObj,RUN_DIR:,$(RUN_DIR))
	$(call echoObj,LIB_NAMES:,$(LIB_NAMES))
	$(call echoObj,LIB_SOURCES:,$(LIB_SOURCES))
	$(call echoObj,GITHUB_URL:,$(GITHUB_URL))
	$(call echoObj,URL_LIBFT:,$(URL_LIBFT))
	$(call echoObj,URL_PRINTF:,$(URL_PRINTF))
	$(call echoObj,URL_GET_NEXT_LINE:,$(URL_GET_NEXT_LINE))
	$(call echoObj,GIT_MODULES:,$(GIT_MODULES))
	$(call echoObj,RUN_SOURCES:,$(RUN_SOURCES))
	$(call echoObj,TEST_SOURCES:,$(TEST_SOURCES))
	$(call echoObj,TEST_SOURCES_WITHOUT_MAIN:,$(TEST_SOURCES_WITHOUT_MAIN))
	@echo

run-w\:%:fclean
	@rm -rf out/*.a
	watch -n 0.2 -c -d "make run:$(subst run-w:,,$@)"

run\:%:
	$(call run,$(subst run:,,$@))

run:
	@rm -rf out/*.a
	$(call generate_obj,$(RUN_SOURCES) $(LIB_SOURCES) $(TEST_SOURCES_WITHOUT_MAIN) $(UTILS_SOURCES))
	@$(CC) -o $(OUT_DIR)/main.a $(OUT_DIR)/*.o
	$(call echoObj,compilation:,$(call textOk,OK))
	$(call echoWarn,./$(call progName,main))
	@$(OUT_DIR)/main.a
	@echo

test\:libft:
	@find libft/Makefile
	@norminette $(wildcard libft/*.c) || echo "norminette: KO"
	@find libft/libftTester/Makefile || git clone git@github.com:Tripouille/libftTester.git libft/libftTester
	@cd libft/libftTester && make

test\:printf:
	@find printf/Makefile
	@norminette $(wildcard printf/*.c) || echo "norminette: KO"
	@find printf/ft_printf_tester/Makefile || git clone https://github.com/paulo-santana/ft_printf_tester.git printf/ft_printf_tester
	@cd printf/ft_printf_tester && sh test m

test\:get_next_line:
	@find get_next_line/Makefile
	@norminette $(wildcard get_next_line/*.c) || echo "norminette: KO"
	@find get_next_line/gnlTester/Makefile || git clone https://github.com/Tripouille/gnlTester.git get_next_line/gnlTester
	@cd get_next_line/gnlTester && make

test:
	@(find libft/Makefile && make test\:libft)||echo KO
	@(find printf/Makefile && make test\:printf)||echo KO
	@(find get_next_line/Makefile && make test\:get_next_line)||echo KO

clean :
	@rm -rf out/*.o
	@echo "delete out/*.o : OK!"

fclean :clean
	@rm -rf out/*.a
	@echo "delete out/*.a : OK!"

push\:%:
ifdef m
	$(call gitpushchild,$(subst push:,,$@),$m)
else
	@echo "La variable $(call textObj,m)est réquise!"
endif
push\:auto:
	$(eval PUSH_COUNT=$(call math,$(PUSH_COUNT),+,1))
	$(call initEnv)
	$(call push,[$(PUSH_TITLE)]($(PUSH_COUNT)): $(PUSH_MESSAGE))

push:fclean
ifdef m
	$(call push,$m)
else
	@echo "La variable $(call textObj,m)est réquise!"
endif

pull:
	git pull --recurse-submodules

install:
	git submodule update --init --recursive -f
	$(call git_url,checkout_master)

install\:%:
	git submodule update --init $(LIB_DIR)/$(subst install:,,$@)
	$(call git_url,git_var)
	$(call checkout_master,$(subst install:,,$@),$(url_$(libname)))

remove:
	git submodule deinit -f --all

remove\:%:
	git submodule deinit -f $(LIB_DIR)/$(subst remove:,,$@)

add : 
	echo "$(GITHUB_URL)"
	$(call git_url,git_add)

add\:%:
ifdef url
	$(eval giturl=$(subst add:,,$@) $(url))
	$(call git_add,$(giturl))
	$(call initEnv)
	$(call update_url,$(giturl))
	
else
	@echo "La variable $(call textObj,url)est réquise!"
endif

delete\:%:
	$(eval libname=$(subst delete:,,$@))
	$(call git_url,git_var)
	$(eval GITHUB_URL=$(filter-out $(libname) $(url_$(libname)),$(GITHUB_URL)))
	$(call initEnv)
	@find $(LIB_DIR)/$(libname)
	git rm -f $(LIB_DIR)/$(libname)

init:
	$(eval MY_NAME=$(MY_NAME_DEFAULT))
	$(eval PUSH_TITLE=$(PUSH_TITLE_DEFAULT))
	$(eval PUSH_MESSAGE=$(PUSH_MESSAGE_DEFAULT))
	$(eval PUSH_COUNT=$(PUSH_COUNT_DEFAULT))
	$(eval GITHUB_URL=$(GITHUB_URL_DEFAULT))
	$(call initEnv)
