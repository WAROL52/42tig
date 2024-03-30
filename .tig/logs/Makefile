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

logOK=$(call echoObj,$1,$(call textOk,$2))
logStart=$(call logOK,$1,Start)
logEnd=$(call logOK,$1,Finish)

varinfo:
	$(call echoObj,MY_NAME:,$(MY_NAME))
	$(call echoObj,CC:,$(CC))
	$(call echoObj,TMP_SRC:,$(TMP_SRC))
	$(call echoObj,LOG_SRC:,$(LOG_SRC))
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