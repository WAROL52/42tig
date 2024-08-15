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
		vrun ./push_swap $tmpVClient '58 33 22 98 25 92 28 15 66 8 87 23 74 10 27 35 77 31 5 6 82 60 32 68 4 29 7 54 76 45 14 11 26 17 63 56 95 20 99 19 34 51 70 16 85 79 40 37 18 52 1 41 49 91 100 83 72 97 43 53 50 64 13 3 62 96 2 73 93 69 80 12 67 55 88 48 38 36 9 81 39 59 90 61 89 94 46 42 65 44 57 71 86 78 30 75 24 84 21 47 '
		# vrun ./push_swap $tmpVClient '3 6 5' 2 4  +10
 		# vrun ./push_swap $tmpVClient 5 1 3 6 2 4
	fi
}
