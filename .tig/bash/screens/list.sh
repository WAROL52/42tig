#!/bin/bash


function screenList() {
	screenHeader "List: register | workspace | env"
	screenLine ""
	screenLine "> register"
	screenLine "> workspace"
	screenLine "> env"
	screenLine $dot
	screenFooter
}

function listChoise(){
	read  -p ">> "  choix
	case "$choix" in
		"register") monitorRegister
			;;
		"workspace") monitorWorkspace
			;;
		"env") monitorEnv
			;;
		"q"|"Q")
		IS_RINNING=false
		  ;;
		*) echo -e " ${Red} Mauvais choix ${Normal}" && sleep 0.5
	esac
}
