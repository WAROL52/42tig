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

function delete_workspace() {
	local name=$1
	local conf_file="$TIG_DIR/register/$name.conf"
	if [ -f $conf_file ]; then
		rm -rf $conf_file
	fi
	if [ -e $REPOS_DIR/$1 ]; then
		rm -rf $REPOS_DIR/$1
	fi
	git rm --cached $REPOS_DIR/$1
	sed -i '/\[submodule "Workspace/$1"\]/,+2d' .gitmodules
}

function delete_all_workspace() {
	echo "delete_all_workspace a faire..."
}