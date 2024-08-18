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
function logVar(){
	echo "
	UTILS_DIR=$UTILS_DIR
	REPOS_DIR=$REPOS_DIR
	RUN_DIR=$RUN_DIR
	CFLAGS=$CFLAGS
	CFLAGSW=$CFLAGSW
	CFLAGS_VALGRIND=$CFLAGS_VALGRIND
	OUT_DIR=$OUT_DIR
	TIG_DIR=$TIG_DIR
	----------------
	WORKSPACE_PATH=$WORKSPACE_PATH
	RUN_PATH=$RUN_PATH
	UTILS_PATH=$UTILS_PATH
	"
}


function run() {
	local args=$(head -n 1 $UTILS_PATH/args.txt)
	make_all
	if [ $? -gt 0 ]; then
    	echo "Les chaînes sont identiques."
	else
		valgrind_run ./so_long "$args"
	fi
}
