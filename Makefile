TIG_DIR=.core_tig

all:
	@$(call bash_function,monitorMenu)
include $(TIG_DIR)/Makefile
