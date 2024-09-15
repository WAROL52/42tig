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

MODEL_LIST=$PWD/$TIG_DIR/bash/template/'[model_list]'

function model_list_workspace() {
	ls $MODEL_LIST
}

function model_delete_workspace() {
	echo "model_delete_workspace...$1"
}

function model_save_workspace() {
	echo "model_save_workspace...$1"
}

function model_update_workspace() {
	echo "model_update_workspace...$1"
}

function model_get_workspace() {
	echo "model_get_workspace...$1"
}


