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
	#echo -e "${Blank}$progname  '$3' '$4' '$5' '$6' '$7' '$8' '$9' ${Normal}${Normal}"
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
function make_run() {
	local tmp=$OUT_PATH/tmp
	local tmpVClient=$OUT_PATH/tmpVClient
	local args=$(head -n 1 $UTILS_PATH/args.txt)
	mkdir -p $OUT_PATH
	cd $WORKSPACE_PATH

	make CFLAGS="$CFLAGS $CFLAGSW" > $tmp
	if [ $? -gt 0 ]; then
    	echo "Les chaînes sont identiques."
	else
		vrun ./push_swap $tmpVClient "$args"
		# vrun ./push_swap $tmpVClient "$args"
		# vrun ./push_swap $tmpVClient '3 6 5' 2 4  +10
 		# vrun ./push_swap $tmpVClient 5 1 3 6 2 4
	fi
}

function make_run_bonus() {
	# valgrind_run <nom_du_fishier> [args...]
	# make_run
	# make_re
	echo "A FAIRE..."
	logVar
}
