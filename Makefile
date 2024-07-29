TIG_DIR=.tig

all:
	@bash -c 'source ./$(TIG_DIR)/bash/core.sh && monitorMenu'
include $(TIG_DIR)/Makefile
