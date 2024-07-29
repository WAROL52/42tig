#!/bin/bash


function screenOf_workspace() {
	screenHeader "List/workspace"
	screenLine ""
	screenLine "Workspace list..."
	screenLine $dot
	screenFooter
}

function controlOf_workspace(){
	read  -p ">> "  choix
	case "$choix" in
		"register") monitorWorkspace
			;;
		"workspace") monitorRegister
			;;
		"env") monitorEnv
			;;
		"q"|"Q")
		IS_RINNING=false
		  ;;
		*) echo -e " ${Red} Mauvais choix ${Normal}" && sleep 0.5
	esac
}
