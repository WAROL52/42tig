# .SILENT:clean
.PHONY: all clean help gitpush

CC= gcc        # compilateur
CFLAGS= -Wall -Wextra -Werror  # options de compilation pour les sources C 


TESTNAME=get_next_line
OUT_DIR=out
PROGNAME=$(OUT_DIR)/$(TESTNAME).a
LIB_DIR = $(TESTNAME)
MAIN_DIR = test/$(LIB_DIR)
FILE_SOURCE = $(wildcard $(LIB_DIR)/*.c) $(wildcard $(MAIN_DIR)/*.c)
FILE_OBJ = $(wildcard $(OUT_DIR)/*.o)	

COM_COLOR = \033[0;34m
OBJ_COLOR = \033[0;36m
OK_COLOR = \033[0;32m
ERROR_COLOR = \033[0;31m
WARN_COLOR = \033[0;33m
NO_COLOR = \033[m

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

define init
	$(eval TESTNAME=${1})
	$(eval PROGNAME=$(OUT_DIR)/$(TESTNAME).a)
	$(eval LIB_DIR = $(TESTNAME))
	$(eval MAIN_DIR := test/$(LIB_DIR))
	$(eval FILE_SOURCE := $(wildcard $(LIB_DIR)/*.c) $(wildcard $(MAIN_DIR)/*.c))
	$(eval FILE_OBJ := $(OUT_DIR)/*.o)
endef

define generate_obj
	@mkdir -p out
	@cd $(OUT_DIR) && $(CC) -c $(CFLAGS) $(foreach file,$(FILE_SOURCE),../$(file))
	$(call echoObj,generate_obj:,$(call textOk,OK))
endef

define compile
	$(call echoObj,compilation:,$(TESTNAME))
	$(call generate_obj,${1})
	@$(CC) -o $(PROGNAME) $(FILE_OBJ)
	$(call echoObj,compilation:,$(call textOk,OK))
endef

define run
	$(call init,${1})
	$(call compile)
	$(call echoWarn,./$(PROGNAME))
	@./$(PROGNAME)
	@echo 
endef

test-w\:%:
	watch -n 0.2 -c -d "make test:$(subst test-w:,,$@)"

test\:%:
	$(call run,$(subst test:,,$@))
libftTester:
	@cd libft
	@find libft/libftTester/Makefile || git clone git@github.com:Tripouille/libftTester.git libft/libftTester
	@cd libft/libftTester && make
clean :
	@rm -rf out/*.o
	@echo "delete out/*.o : OK!"

fclean :clean
	@rm -rf out/*.a
	@echo "delete out/*.a : OK!"

gitpushall:fclean
	@find libft/Makefile || cd libft/Makefile && make gitpush m="$m"
	git add .
	git commit -m "$m" 
	git push 

gitpush:fclean
	git add .
	git commit -m "$m" 
	git push 