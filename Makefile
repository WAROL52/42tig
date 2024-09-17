TIG_DIR=.core_tig

CORE=core
CORE_UPDATE=$(CORE)\:update
CORE_CLEAN=$(CORE)\:clean
CORE_FCLEAN=$(CORE)\:fclean
CORE_GET=$(CORE)\:get

all:
	@$(call bash_function,monitorMenu)

$(CORE):$(CORE_FCLEAN) $(CORE_GET)

$(CORE_GET):
	@git clone https://github.com/WAROL52/.core_tig.git

$(CORE_UPDATE):
	@cd $(TIG_DIR) ; git pull

$(CORE_CLEAN):$(CORE_UPDATE)

$(CORE_FCLEAN):
	@rm -rf $(TIG_DIR)

include $(TIG_DIR)/Makefile
