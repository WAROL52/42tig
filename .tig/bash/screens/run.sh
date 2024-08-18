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

function valgrind_run(){
	local valgrind_out=$OUT_PATH/out_valgrind
	local progname=$1
	shift
	echo -e "${Blank}$progname  $@ ${Normal}${Normal}"
	local t1=$(date '+%s')
	(valgrind $CFLAGS_VALGRIND $progname "$@" ) 2> $valgrind_out
	local t2=$(date '+%s')
	timesDiff=$(($t2 - $t1))
	echo -e "${Reverse}"
	echo "Temps: $timesDiff ms "
	grep "in use at exit" < $valgrind_out | sed 's/^==[0-9]*==     in use at exit/Memoire/'
	grep "total heap usage" < $valgrind_out | sed 's/^==[0-9]*==   total heap usage/Allocation/'
	echo -e "${Normal}"
}

function make_all(){
	mkdir -p $OUT_PATH
	cd $WORKSPACE_PATH
	make CFLAGS="$CFLAGS $CFLAGSW" > $OUT_PATH/make_out
}

function make_re(){
	mkdir -p $OUT_PATH
	cd $WORKSPACE_PATH
	make re CFLAGS="$CFLAGS $CFLAGSW" > $OUT_PATH/make_out
}

function run_workspase() {
	local PROJET_NAME=$1
	clear
	echo "-------------------------"
	echo -e "${Title}PROJET_NAME${Normal}= $PROJET_NAME |PID: $$"
	echo "-------------------------"
	source $PWD/$UTILS_DIR/$PROJET_NAME/run.sh
	run
}
