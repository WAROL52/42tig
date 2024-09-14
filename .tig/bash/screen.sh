#!/bin/bash

source $(dirname "$(realpath "$BASH_SOURCE")")/env.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screens/menu.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screens/list.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screens/workspace.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screens/run.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screens/test.sh

char=" "
lines=$1
# Nombre de répétitions
width=$(tput cols)
# Résultat
Space=""
# Boucle pour répéter le caractère
for ((i=0; i<width; i++)); do
	Space+="$char"
done

dot="....................................."

function screenHeader() {
	echo -e "${Title}${Space}${Normal}"
	echo -e "${Title}${Bold}  42TIG${Space:7}${Normal}"
	echo -e "${Blank}${Space}${Normal}"
	echo -e "${Blank} ${Normal} $1${Space:$(expr $(expr length "$1") + 3 )}${Blank} ${Normal}"
	echo -e "${Blank}${Space}${Normal}"
	screenLine "$PWD"
}
function screenLine() {
	new_width=$((width -7))
	printf "${Blank} ${Normal}     %-${new_width}s${Blank} ${Normal}\n" "$1"
}
function screenFooter() {
	echo -e "${Blank} ${Normal}${Space:2}${Blank} ${Normal}"
	echo -e "${Blank}\033[30m${Space:12} Q: Quitter ${Normal}"
	echo "                             "
}

function screenLoop() {
	clear
	$1
	$2
	$IS_RINNING && screenLoop "$1" "$2"
	IS_RINNING=true
}

# ///////////////////////////////////////////////////////////////////////////////


# screenOf_list
# controlOf_list

function monitorMenu(){
	screenLoop "screenMenu" "menuChoise"
}

function monitorList(){
	screenLoop "screenList" "listChoise"
}

function monitorAdd(){
	screenLoop "screenAdd" "addChoise"
}

function monitorDelete(){
	screenLoop "screenDelete" "deleteChoise"
}

function monitorInstall(){
	screenLoop "screenInstall" "installChoise"
}

function monitorUninstall(){
	screenLoop "screenUninstall" "uninstallChoise"
}

function monitorPush(){
	screenLoop "screenPush" "pushChoise"
}

function monitorPull(){
	screenLoop "screenPull" "pullChoise"
}

function monitorRun(){
	screenLoop "screenRun" "runChoise"
}

function monitorTest(){
	screenLoop "screenTest" "testChoise"
}

function monitorPerf(){
	screenLoop "screenPerf" "perfChoise"
}

function monitorWorkspace(){
	screenLoop "screenOf_workspace" "controlOf_workspace"
}

function monitorRegister(){
	screenLoop "screenOf_Register" "controlOf_Register"
}

function monitorEnv(){
	screenLoop "screenOf_Env" "controlOf_Env"
}
