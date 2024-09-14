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
	git_push $1 "rolio"
	cd ..
}

function push_all_workspace() {
	cd $REPOS_DIR
	read -p "Description: " GIT_PUSH_MSG
	while read -r name url; do
	git_push $name "$GIT_PUSH_MSG"
	echo -e "\n"
	done < <(echo "$GITHUB_URL" | awk '{for (i=1; i<=NF; i+=2) print $i, $(i+1)}')
	cd ..
	local projetname=$(basename $(pwd))
	cd ..
	git_push "$projetname" "$GIT_PUSH_MSG"
}

function pull_workspace() {
	echo "pull_workspace..."
}

function pull_all_workspace() {
	echo "pull_all_workspace..."
}
