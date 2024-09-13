TIG_DIR=.tig

all:
	@$(call bash_function,monitorMenu)
include $(TIG_DIR)/Makefile
