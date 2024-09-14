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

function push_workspace() {
	cd $REPOS_DIR
	git_push $1 "$2"
	cd ..
}

_GIT_PUSH_MSG_=""

function _push_all_() {
	push_workspace $1 "$_GIT_PUSH_MSG_"
}

function push_all_workspace() {
	read -p "Description: " GIT_PUSH_MSG
	_GIT_PUSH_MSG_="$GIT_PUSH_MSG"
	foreach_workspace _push_all_
	local projetname=$(basename $(pwd))
	cd ..
	git_push "$projetname" "$GIT_PUSH_MSG"
}

function pull_workspace() {
	git pull --rebase --recurse-submodules
	foreach_workspace git_checkout
}

