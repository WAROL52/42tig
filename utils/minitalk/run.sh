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
function vrun(){
	local progname=$1
	local arg=$2
	local tmp=$3
	(valgrind $CFLAGS_VALGRIND $progname $arg) 2> $tmp
	echo -e "${Blank}$progname ${Normal}${Reverse}"
	grep "in use at exit" < $tmp | sed 's/^==[0-9]*==     in use at exit/Memoire/'
	grep "total heap usage" < $tmp | sed 's/^==[0-9]*==   total heap usage/Allocation/'
	echo -e "${Normal}"
}
function run() {
	local tmp=$OUT_PATH/tmp
	local tmpVClient=$OUT_PATH/tmpVClient
	local tmpVServer=$OUT_PATH/tmpVServer
	local tmp=$OUT_PATH/tmp
	mkdir -p $OUT_PATH
	cd $WORKSPACE_PATH
	make CFLAGS="$CFLAGS $CFLAGSW" > $tmp
	vrun ./server "" $tmpVServer 
	# vrun ./client "12345  \"BonJour rolio\"" $tmpVClient
	# (valgrind $CFLAGS_VALGRIND ./client 12345  "BonJour rolio") 2> $tmpVClient 
}
