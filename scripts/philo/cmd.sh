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

function make_cmd() {
	# valgrind_run <nom_du_fishier> [args...]
	# make_run
	# make_re
	echo "A FAIRE..."
	logVar
}
