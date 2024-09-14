#!/bin/bash

##############################
# VARIABLE GLOBAL
#-----------------------------
# Pour aider ...
# ----------------------------
UTILS_DIR=$UTILS_DIR
REPOS_DIR=$REPOS_DIR
RUN_DIR=$RUN_DIR
CFLAGS=$CFLAGS
CFLAGSW=$CFLAGSW
CFLAGS_VALGRIND=$CFLAGS_VALGRIND
OUT_DIR=$OUT_DIR
TIG_DIR=$TIG_DIR
PROJET_NAME=$PROJET_NAME
# ----------------------------
WORKSPACE_PATH=$WORKSPACE_PATH
RUN_PATH=$RUN_PATH
UTILS_PATH=$UTILS_PATH
OUT_PATH=$OUT_PATH
##############################

function add_workspace() {
	cd $TIG_DIR
	cd ..
	mkdir -p $MAKE_CMD_DIR
	create_conf $1 $2 $3
	git submodule add -f $2 $REPOS_DIR/$1
	cp -r "$TIG_DIR/bash/template/[exemple]" "$TIG_DIR/bash/template/$1"
	mv "$TIG_DIR/bash/template/$1" $MAKE_CMD_DIR
}

function add_all_workspace() {
	echo "Mandea stara..."
}

function delete_workspace() {
	local name=$1
	local conf_file="$TIG_DIR/register/$name.conf"
	if [ -f $conf_file ]; then
		rm -rf $conf_file
	fi
	# git submodule deinit -f -- Workspace/$1
	sed -i "/^\[submodule \"Workspace\/$1\"\]/,+2d" .gitmodules
	rm -rf $REPOS_DIR/$1 $MAKE_CMD_DIR/$1 $PWD/.git/modules/$REPOS_DIR/$1
}

function delete_all_workspace() {
	echo "delete_all_workspace a faire..."
}
