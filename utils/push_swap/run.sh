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
function vrun(){
	local progname=$1
	local tmp=$2
	local t1=$(date '+%s')
	echo -e "${Blank}$progname "$3" "$4" "$5" "$6" "$7" "$8" "$9" ${Normal}${Normal}"
	(valgrind $CFLAGS_VALGRIND $progname $3 $4 $5 $6 $7 $8 $9 ) 2> $tmp
	local t2=$(date '+%s')
	timesDiff=$(($t2 - $t1))
	echo -e "${Reverse}"
	echo "Temps: $timesDiff ms "
	grep "in use at exit" < $tmp | sed 's/^==[0-9]*==     in use at exit/Memoire/'
	grep "total heap usage" < $tmp | sed 's/^==[0-9]*==   total heap usage/Allocation/'
	echo -e "${Normal}"
}
function infinityRun() {
	local PID_SERVER=$1
	local tmpVClient=$OUT_PATH/tmpVClient
	read -p "[CMD]:Message : " MESSAGE_FOR_SERVER
	vrun ./client $tmpVClient $PID_SERVER  "$MESSAGE_FOR_SERVER"
	infinityRun $PID_SERVER
}
function run() {
	local tmp=$OUT_PATH/tmp
	local tmpVClient=$OUT_PATH/tmpVClient
	mkdir -p $OUT_PATH
	cd $WORKSPACE_PATH

	make re CFLAGS="$CFLAGS $CFLAGSW" > $tmp
	if [ $? -gt 0 ]; then
    	echo "Les chaînes sont identiques."
	else
		vrun ./push_swap $tmpVClient 5 2 4 1 3 6
		vrun ./push_swap $tmpVClient "3 6 5" 2 4 1
 		vrun ./push_swap $tmpVClient 5 1 3 6 2 4
	fi
}
