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
	local txt_repos="${OBJ_COLOR}$MAKE_CMD_DIR/$repos${NO_COLOR}"
	local txt_model="${OBJ_COLOR}$TIG_DIR/bash/template/'[model_list]'/$1${NO_COLOR}"
	if [ -e "$MODEL_LIST/$1" ];then
		echo -e "le ${txt_model} sera suprime en local."
		printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
		read reponse
		if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
			rm -rf $MODEL_LIST/$1
			echo -e "${OK_COLOR}ok$NO_COLOR"
		else
			echo "Annulation de la commande."
		fi
	else
		echo -e "$txt_model introuvable!"
	fi
}

function model_save_workspace() {
	local txt_repos="${OBJ_COLOR}$MAKE_CMD_DIR/$repos${NO_COLOR}"
	local txt_model="${OBJ_COLOR}$TIG_DIR/bash/template/'[model_list]'/$1/*${NO_COLOR}"
	if [ -e "$MODEL_LIST/$1" ];then
		echo -e "${txt_model} existe deja!\nPour mettre a jour:'$>${COM_COLOR}make ${WARN_COLOR}model-set:$1${NO_COLOR}' "
	else
		if [ -z "$repos" ]; then
			list_workspace
			printf "${COM_COLOR}Choisi un repos: ${NO_COLOR}"
			read repos
		fi
		if [ -d "$PWD/$MAKE_CMD_DIR/$repos" ];then
			echo -e "le ${txt_repos} sera sauvegarde dans ${txt_model} en tant que nouveau model."
			printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
			read reponse
			if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
				cp -r  $PWD/$MAKE_CMD_DIR/$repos $MODEL_LIST/$1
				echo -e "${OK_COLOR}ok$NO_COLOR"
			else
				echo "Annulation de la commande."
			fi
		else
			echo "repos '$txt_repos' introuvable"
		fi	
	fi
}

function model_set_workspace() {
	if [ -z "$repos" ]; then
		list_workspace
		printf "${COM_COLOR}Choisi un repos: ${NO_COLOR}"
		read repos
	fi
	if [ -f "$PWD/$TIG_DIR/register/$repos" ];then
		if [ -e "$MODEL_LIST/$1" ];then
			echo -e "Les changements locaux dans ${OBJ_COLOR}$TIG_DIR/bash/template/'[model_list]'/$1/*${NO_COLOR} seront ecrase."
			printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
			read reponse
			if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
				rm -rf $MODEL_LIST/$1 
				cp -r  $PWD/$MAKE_CMD_DIR/$repos $MODEL_LIST/$1
				echo -e "${OK_COLOR}ok$NO_COLOR"
			else
				echo "Annulation de la commande."
			fi
		else
			echo "model '$1' introuvable!"
		fi	
	else
		echo "repos '$repos' introuvable"
	fi
}

function model_get_workspace() {
	if [ -z "$repos" ]; then
		list_workspace
		printf "${COM_COLOR}Choisi un repos: ${NO_COLOR}"
		read repos
	fi
	if [ -f "$PWD/$TIG_DIR/register/$repos" ];then
		if [ -e "$MODEL_LIST/$1" ];then
			echo -e "Les changements locaux dans ${OBJ_COLOR}$PWD/$MAKE_CMD_DIR/$repos/*${NO_COLOR} seront ecrase."
			printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
			read reponse
			if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
				rm -rf $PWD/$MAKE_CMD_DIR/$repos
				cp -r $MODEL_LIST/$1 $PWD/$MAKE_CMD_DIR/$repos
				echo -e "${OK_COLOR}ok$NO_COLOR"
			else
				echo "Annulation de la commande."
			fi
		else
			echo "model '$1' introuvable!"
		fi	
	else
		echo "repos '$repos' introuvable"
	fi
}


