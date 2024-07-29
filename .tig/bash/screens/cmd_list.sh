#!/bin/bash


function screenList() {
	screenHeader "List: register | workspace | env"
	screenLine ""
	screenLine "> register"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> workspace"
	screenLine "> env"
	screenLine $dot
	screenFooter
}

function listChoise(){
	read  -p ">> "  choix
	case "$choix" in
		"list")
		screenLoop "screenList" "menuChoise"
			;;
		2) a=3;b=5;c=$((a+b));echo "calcul= $c";WaitEnter
			;;
		3) Multiply
			;;
		4) Web
				;;
		"q"|"Q")
		IS_RINNING=false
		  ;;
		*) echo -e " ${Red} Mauvais choix ${Normal}" && sleep 0.5
	esac
}
