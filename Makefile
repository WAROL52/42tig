# .SILENT:clean
CC= gcc        # compilateur
CFLAGS= -Wall -Wextra -Werror  # options de compilation pour les sources C 
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
fileSource = $(wildcard $(RUN_DIR)/$1/*.c) $(wildcard $1/*.c) $(UTILS_SOURCES)

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

define generate_obj
	@mkdir -p $(OUT_DIR)
	@cd $(OUT_DIR) && $(CC) -c $(CFLAGS) $(foreach file,$1,../$(file))
	$(call echoObj,generate_obj:,$(call textOk,OK))
endef

define compile
	@find $1/Makefile
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
	$(call echoObj,gitpush:,$1)
	@if [ -e $1/Makefile ]; then \
		(cd $1 && make gitpush m="$m" && echo "$(call textObj,gitpush:)$1 $(call textOk,OK)") || echo "$(call textObj,gitpush:)$1 $(call textError,KO)"; \
	else \
		echo "Le fichier $(call textObj,$1/Makefile)est réquise!"; \
	fi

endef

all:varinfo run

varinfo:
	$(call echoObj,CC:,$(CC))
	$(call echoObj,CFLAGS:,$(CFLAGS))
	$(call echoObj,OUT_DIR:,$(OUT_DIR))
	$(call echoObj,RUN_DIR:,$(RUN_DIR))
	$(call echoObj,LIB_NAMES:,$(LIB_NAMES))
	$(call echoObj,LIB_SOURCES:,$(LIB_SOURCES))
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
	@find libft/libftTester/Makefile || git clone git@github.com:Tripouille/libftTester.git libft/libftTester
	@cd libft/libftTester && make

test\:printf:
	@find printf/Makefile
	@find libft/libftTester/Makefile || git clone git@github.com:Tripouille/libftTester.git libft/libftTester
	@cd libft/libftTester && make

test\:get_next_line:
	@find get_next_line/Makefile
	@find libft/libftTester/Makefile || git clone git@github.com:Tripouille/libftTester.git libft/libftTester
	@cd libft/libftTester && make

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

gitpush\:%:
ifdef m
	$(call gitpushchild,$(subst gitpush:,,$@),$m)
else
	@echo "La variable $(call textObj,m)est réquise!"
endif

gitpush:fclean
ifdef m
	@$(foreach moduleName,$(LIB_NAMES), \
        $(call gitpushchild,$(moduleName),$m) \
    )
	@echo "\n------------------------------"
	$(call echoObj,gitpush:,Workspace)
	git add .
	(git commit -m "$m" && git push && echo "$(call textObj,gitpush:)Workspace $(call textOk,OK)")|| echo "$(call textObj,gitpush:)Workspace $(call textError,KO)"
else
	@echo "La variable $(call textObj,m)est réquise!"
endif

gitpull:
	git pull --recurse-submodules

submodule\:init:
	git submodule update --init --recursive

submodule\:update:
	git submodule update --recursive --remote

submodule: submodule\:init submodule\:update

.PHONY: all clean help gitpush run varinfo submodule gitpull submodule\:init submodule\:update
