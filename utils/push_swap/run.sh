#!/bin/bash

##############################
# VARIABLE GLOBAL
#-----------------------------
# Pour aider ...
# ----------------------------
readonly UTILS_DIR=$UTILS_DIR
readonly REPOS_DIR=$REPOS_DIR
readonly RUN_DIR=$RUN_DIR
readonly CFLAGS=$CFLAGS
readonly CFLAGSW=$CFLAGSW
readonly CFLAGS_VALGRIND=$CFLAGS_VALGRIND
readonly OUT_DIR=$OUT_DIR
readonly TIG_DIR=$TIG_DIR
readonly PROJET_NAME=$PROJET_NAME
# ----------------------------
readonly WORKSPACE_PATH=$WORKSPACE_PATH
readonly RUN_PATH=$RUN_PATH
readonly UTILS_PATH=$UTILS_PATH
readonly OUT_PATH=$OUT_PATH
##############################
function vrun(){
	local progname=$1
	local tmp=$2
	local t1=$(date '+%s')
	echo -e "${Blank}$progname  '$3' '$4' '$5' '$6' '$7' '$8' '$9' ${Normal}${Normal}"
	(valgrind $CFLAGS_VALGRIND $progname "$3" $4 $5 $6 $7 $8 $9 ) 2> $tmp
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
		vrun ./push_swap $tmpVClient '11 38 41 10 65 96 7 70 32 45 69 9 40 26 30 95 56 47 22 51 66 68 88 37 77 28 75 48 29 25 49 17 15 99 36 63 90 31 76 78 71 20 73 82 13 42 35 21 60 64 52 23 34 72 83 81 86 12 93 14 8 46 100 62 6 79 92 3 53 58 2 97 5 61 39 84 98 57 74 55 43 19 18 1 54 85 87 67 91 50 44 16 89 4 80 59 24 27 33 94 '
		# vrun ./push_swap $tmpVClient '3 6 5' 2 4  +10
 		# vrun ./push_swap $tmpVClient 5 1 3 6 2 4
	fi
}
