#!/bin/bash

##############################
# VARIABLE GLOBAL
#-----------------------------
# Pour aider ...
# ----------------------------
SCRIPT_DIR=$SCRIPT_DIR
WORKSPACE_DIR=$WORKSPACE_DIR

CFLAGS=$CFLAGS
CFLAGSW=$CFLAGSW
CFLAGS_VALGRIND=$CFLAGS_VALGRIND
OUT_DIR=$OUT_DIR
TIG_DIR=$TIG_DIR
PROJET_NAME=$PROJET_NAME
# ----------------------------
WORKSPACE_PATH=$WORKSPACE_PATH

SCRIPT_PATH=$SCRIPT_PATH
OUT_PATH=$OUT_PATH
##############################

function logVar(){
	echo "
	SCRIPT_DIR=$SCRIPT_DIR
	WORKSPACE_DIR=$WORKSPACE_DIR
	
	CFLAGS=$CFLAGS
	CFLAGSW=$CFLAGSW
	CFLAGS_VALGRIND=$CFLAGS_VALGRIND
	OUT_DIR=$OUT_DIR
	TIG_DIR=$TIG_DIR
	----------------
	WORKSPACE_PATH=$WORKSPACE_PATH

	SCRIPT_PATH=$SCRIPT_PATH
	"
}

function make_run() {
	WORKSPACE_PATH=$WORKSPACE_PATH/philo
	local progname="./$WORKSPACE_PATH/philo"
	make_all
	if [ $? -gt 0 ]; then
    	echo -e "${ERROR_COLOR}make error${NO_COLOR}"
	else
		valgrind_run $progname 2 800 200 300 -3
	fi
}

function make_run_bonus() {
	# valgrind_run <nom_du_fishier> [args...]
	# make_run
	# make_re
	echo "A FAIRE..."
	logVar
}
