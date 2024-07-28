#!/bin/bash

source $(dirname "$(realpath "$BASH_SOURCE")")/env.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screen.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screens/menu.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screens/cmd_list.sh

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