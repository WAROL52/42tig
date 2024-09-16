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

function make_test() {
	# git clone https://github.com/Tripouille/gnlTester.git
	# make
	# git clone https://github.com/Tripouille/gnlTester.git
	# make
	echo "A FAIRE..."
}

function make_test_bonus() {
	# valgrind_run <nom_du_fishier> [args...]
	# make_run
	# make_re
	echo "A FAIRE..."
}
#!/bin/bash

# TESTDIR=./test
# MAINFILE=$TESTDIR/main.c
# PROGNAME=$TESTDIR/test.out
# TEXTNAME=text.txt
# LOGNAME=$TESTDIR/log.txt
# mkdir -p $TESTDIR
# echo "generating 5_000_000 char"

# python3 -c "print(\"0123\n\"*1_000_000)" > $TESTDIR/$TEXTNAME

# echo -e "
# #include \"../get_next_line.h\"
# int main(void)
# {
# 	int		fd;
# 	int		index;
# 	char	*line;

# 	fd = open(\"$TESTDIR/$TEXTNAME\",O_RDONLY);
# 	printf(\"========================%c\",10);
# 	printf(\"%cBUFFER_SIZE=%d%c\",9,BUFFER_SIZE,10);
# 	printf(\"%cfd=%d%c\",9,fd,10);
# 	printf(\"========================%c\",10);
# 	index = 1;
# 	while (1)
# 	{
# 		line = get_next_line(fd);
# 		//printf(\"[%d]:%s\",index,line);
# 		index++;
# 		if(!line)
# 			break;
# 		free(line);
# 	}
# 	return (0);
# }

# " > $MAINFILE
# Compiler() {
# 	timestamp1=$(date '+%s')
# 	echo "Times A: $timestamp1"
# 	gcc -g  ./get_next_line.c ./get_next_line_utils.c $MAINFILE -D BUFFER_SIZE=$1 -o $PROGNAME
# 	(time valgrind $PROGNAME -s --leak-check=full --show-leak-kinds=all --track-origins=yes ) 2> $LOGNAME
# 	timestamp2=$(date '+%s')
# 	echo "Times B: $timestamp2"
# 	timesDiff=$(($timestamp2 - $timestamp1))
# 	echo "Times : $timesDiff ms"
# 	grep "in use at exit:" $LOGNAME | sed 's/^==[0-9]*==   //'
# 	grep "total heap usage:" $LOGNAME | sed 's/^==[0-9]*== //'
# 	echo ""
# 	echo ""
# }
# norminette -R get_next_line.h get_next_line.c get_next_line_utils.c get_next_line_utils_bonus.c get_next_line_bonus.h get_next_line_bonus.c
# Compiler 1
# Compiler 10
# Compiler 42
# Compiler 100
# git clone https://github.com/Tripouille/gnlTester.git
# cd gnlTester
# make
# cd ..
# git clone https://github.com/kodpe/42test-gnl-station-2022.git
# cd 42test-gnl-station-2022
# make