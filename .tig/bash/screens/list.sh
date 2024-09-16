#!/bin/bash

width=$(tput cols)
function screenList() {
	local rended=$(list_workspace)
	screenHeader "List Workspace"
	screenLine ""
	while IFS= read -r line; do
		# screenLine "$line..."
		new_width=$((width -7+39))
		printf "${Blank} ${Normal}     %-${new_width}s${Blank} ${Normal}\n" "$line"
	done <<< "$rended"
	screenLine $dot
	screenFooter
}

function listChoise(){
	read  -p ">> "  choix
	case "$choix" in
		"q"|"Q"|"quitter"|"Quitter"|"QUITTER")
		IS_RINNING=false
		  ;;
		*) echo -e " ${Red} Mauvais choix ${Normal}" && sleep 0.5
	esac
}
