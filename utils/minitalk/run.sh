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
	local tmp=$2
	local args=$3
	echo -e "${Blank}$progname $args ${Normal}${Normal}"
	(valgrind $CFLAGS_VALGRIND $progname $args) 2> $tmp
	echo -e "${Reverse}"
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
	make re CFLAGS="$CFLAGS $CFLAGSW" > $tmp
	
	if [ $? -gt 0 ]; then
    	echo "Les chaînes sont identiques."
	else
		vrun ./server $tmpVServer "" &
		sleep 1
		read -p "[CMD]:Entrer le PID :" PID_SERVER
		vrun ./client $tmpVClient "$PID_SERVER a😁a"
	fi
}