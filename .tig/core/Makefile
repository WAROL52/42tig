#################################################
include $(TIG_DIR)/make.conf ####################
#################################################
include $(TIG_DIR)/sh.conf ######################
#################################################


#################################################
# color                                         #
#################################################
VAR_NO_COLOR=$(subst ",,$(NO_COLOR))
VAR_COM_COLOR=$(subst ",,$(COM_COLOR))
VAR_OBJ_COLOR=$(subst ",,$(OBJ_COLOR))
VAR_OK_COLOR=$(subst ",,$(OK_COLOR))
VAR_ERROR_COLOR=$(subst ",,$(ERROR_COLOR))
VAR_WARN_COLOR=$(subst ",,$(WARN_COLOR))


#################################################
# text                                          #
#################################################
textcolor =${1}${2} $(VAR_NO_COLOR)$3
textCom =$(call textcolor,$(VAR_COM_COLOR),${1},${2})
textObj =$(call textcolor,$(VAR_OBJ_COLOR),${1},${2})
textOk =$(call textcolor,$(VAR_OK_COLOR),${1},${2})
textError =$(call textcolor,$(VAR_ERROR_COLOR),${1},${2})
textWarn =$(call textcolor,$(VAR_WARN_COLOR),${1},${2})


#################################################
# echo                                          #
#################################################
echoCom = (echo "$(call textCom,${1})${2}")
echoObj = (echo "$(call textObj,${1})${2}")
echoOK = (echo "$(call textOk,${1})${2}")
echoError = (echo "$(call textError,${1})${2}")
echoWarn = (echo "$(call textWarn,${1})${2}")

NOLOG=
NOLOG:PHONY
	$(eval NOLOG=narto)
	$(call phony)

isTrue=$(subst 0,,$(strip $1))

cmdshell=$(if $(NOLOG),true,$(call echoWarn,[$2]:,$1)) && $1 $(if $(subst 0,,$(strip $(SUCCESS_SHOW))),&&$(call echoWarn,[$2]:,$(call textOk,$(SUCCESS_MESSAGE))))
cmdshell_with_error=$(call cmdshell,$1,$2) $(if $(call isTrue,$(ERROR_SHOW)),|| $(call echoWarn,[$2]:,$(call textError,$(ERROR_MESSAGE))))
cmdshell_safe=$(call cmdshell,$1,$2) $(if $(call isTrue,$(ERROR_SHOW)),|| ($(call echoWarn,[$2]:,$(call textError,$(ERROR_MESSAGE)))&& false))

define cmd
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
	$(call echoWarn)

endef

define cmd_safe
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

define make_watch 
	(python3 -m pip list | grep "watchdog" || python3 -m pip install watchdog --user ) > $(TIG_DIR)/buff
	
	python3 $(TIG_DIR)/bin/watch.py "$1" "$2"
endef

