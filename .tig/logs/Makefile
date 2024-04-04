COM_COLOR = \033[0;34m
OBJ_COLOR = \033[0;36m
OK_COLOR = \033[0;32m
ERROR_COLOR = \033[0;31m
WARN_COLOR = \033[0;33m
NO_COLOR = \033[m

textcolor =${1}${2} $(NO_COLOR)$3
textCom =$(call textcolor,$(COM_COLOR),${1},${2})
textObj =$(call textcolor,$(OBJ_COLOR),${1},${2})
textOk =$(call textcolor,$(OK_COLOR),${1},${2})
textError =$(call textcolor,$(ERROR_COLOR),${1},${2})
textWarn =$(call textcolor,$(WARN_COLOR),${1},${2})

echoCom = (echo "$(call textCom,${1})${2}")
echoObj = (echo "$(call textObj,${1})${2}")
echoOK = (echo "$(call textOk,${1})${2}")
echoError = (echo "$(call textError,${1})${2}")
echoWarn = (echo "$(call textWarn,${1})${2}")

logOK=$(call echoObj,$1,$(call textOk,$2))
logStart=$(call logOK,$1,Start)
logEnd=$(call logOK,$1,Finish)
define logTitle
	@$(call echoObj,\n|------------------------------|)
	@$(call echoObj,|$1,$2)
	@$(call echoObj,|------------------------------|)
endef

cmdshell=$(call echoWarn,[$2]:,$1) && $1 $(if $(subst 0,,$(strip $(SUCCESS_SHOW))),&&$(call echoWarn,[$2]:,$(call textOk,$(SUCCESS_MESSAGE))))

cmdshell_with_error=$(call cmdshell,$1,$2) $(if $(call isTrue,$(ERROR_SHOW)),|| $(call echoWarn,[$2]:,$(call textError,$(ERROR_MESSAGE))))

define run_shell
	$(call cmdshell_with_error,$1,1)\
	$(if $2,&&$(call cmdshell_with_error,$2,2))\
	$(if $3,&&$(call cmdshell_with_error,$3,3))\
	$(if $4,&&$(call cmdshell_with_error,$4,4))\
	$(if $5,&&$(call cmdshell_with_error,$5,5))\
	$(if $6,&&$(call cmdshell_with_error,$6,6))\
	$(if $7,&&$(call cmdshell_with_error,$7,7))\
	$(if $9,&&$(call cmdshell_with_error,$9,9))\
	$(if $(10),&&$(call cmdshell_with_error,$(10),10))\
	$(if $(11),&&$(call cmdshell_with_error,$(11),11))\
	$(if $(12),&&$(call cmdshell_with_error,$(12),12))\
	$(if $(13),&&$(call cmdshell_with_error,$(13),13))\
	$(if $(14),&&$(call cmdshell_with_error,$(14),14))\
	$(if $(15),&&$(call cmdshell_with_error,$(15),15))\
	$(if $(16),&&$(call cmdshell_with_error,$(16),16))\
	$(if $(17),&&$(call cmdshell_with_error,$(17),17))\
	$(if $(18),&&$(call cmdshell_with_error,$(18),18))\
	$(if $(19),&&$(call cmdshell_with_error,$(19),19))\
	$(if $(20),&&$(call cmdshell_with_error,$(20),20))||\
	$(call echoWarn,[cmd:finish]:,$(call textError,$(ERROR_MESSAGE)))

endef

cmdshell_safe=$(call cmdshell,$1,$2) $(if $(call isTrue,$(ERROR_SHOW)),|| ($(call echoWarn,[$2]:,$(call textError,$(ERROR_MESSAGE)))&& false))

define run_shell_safe
	$(call cmdshell_safe,$1,1)\
	$(if $2,&&$(call cmdshell_safe,$2,2))\
	$(if $3,&&$(call cmdshell_safe,$3,3))\
	$(if $4,&&$(call cmdshell_safe,$4,4))\
	$(if $5,&&$(call cmdshell_safe,$5,5))\
	$(if $6,&&$(call cmdshell_safe,$6,6))\
	$(if $7,&&$(call cmdshell_safe,$7,7))\
	$(if $9,&&$(call cmdshell_safe,$9,9))\
	$(if $(10),&&$(call cmdshell_safe,$(10),10))\
	$(if $(11),&&$(call cmdshell_safe,$(11),11))\
	$(if $(12),&&$(call cmdshell_safe,$(12),12))\
	$(if $(13),&&$(call cmdshell_safe,$(13),13))\
	$(if $(14),&&$(call cmdshell_safe,$(14),14))\
	$(if $(15),&&$(call cmdshell_safe,$(15),15))\
	$(if $(16),&&$(call cmdshell_safe,$(16),16))\
	$(if $(17),&&$(call cmdshell_safe,$(17),17))\
	$(if $(18),&&$(call cmdshell_safe,$(18),18))\
	$(if $(19),&&$(call cmdshell_safe,$(19),19))\
	$(if $(20),&&$(call cmdshell_safe,$(20),20))||\
	$(call echoWarn)

endef

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
