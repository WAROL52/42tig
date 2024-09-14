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

function install_workspace() {
	echo -e "${WARN_COLOR}Attention${NO_COLOR} : Cette commande assure que le sous-module ${OBJ_COLOR}$1${NO_COLOR} est initialisé, mis à jour et synchronisé avec l'état actuel du projet."
	echo -e "Les changements locaux dans ${OBJ_COLOR}$WORKSPACE_DIR/$1${NO_COLOR} seront perdus."
	printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
	read reponse
	if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
		git submodule update --init $PWD/$WORKSPACE_DIR/$1
		git_checkout $1
	else
		echo "Annulation de la commande."
	fi
}

function install_all_workspace() {
	echo -e "${WARN_COLOR}Attention${NO_COLOR} : Cette commande assure que tous ${OBJ_COLOR}les sous-modules${NO_COLOR} sont initialisés, mis à jour et synchronisés avec l'état actuel du projet."
	echo -e "Les changements locaux dans ${OBJ_COLOR}$WORKSPACE_DIR/*${NO_COLOR} seront perdus."
	printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
	read reponse
	if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
		git submodule update --init -f
		foreach_workspace git_checkout
	else
		echo "Annulation de la commande."
	fi
}

function remove_workspace() {
	echo -e "${WARN_COLOR}Attention${NO_COLOR} : Cette commande désinitialisera le sous-module ${OBJ_COLOR}$1${NO_COLOR}."
	echo -e "Les changements locaux dans ${OBJ_COLOR}$WORKSPACE_DIR/$1${NO_COLOR} seront perdues."
	printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
	read reponse
	if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
		git submodule deinit -f $WORKSPACE_DIR/$1
	else
		echo "Annulation de la commande."
	fi
}

function remove_all_workspace() {
	echo -e "${WARN_COLOR}Attention${NO_COLOR} : Cette commande désinitialisera tous les sous-modules."
	echo -e "Les changements locaux dans ${OBJ_COLOR}$WORKSPACE_DIR/*${NO_COLOR} seront perdues."
	printf "${URL_COLOR}Voulez-vous continuer ? (oui/non): ${NO_COLOR}"
	read reponse
	if [[ "$reponse" == "oui" || "$reponse" == "o" || "$reponse" == "O" ]]; then
		git submodule deinit -f --all
	else
		echo "Annulation de la commande."
	fi
}
