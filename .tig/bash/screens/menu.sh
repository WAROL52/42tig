#!/bin/bash

function screenMenu() {
	screenHeader "Menu"
	screenLine ""
	screenLine "> list"
	screenLine $dot
	screenLine "> add:<nom-du-repo> url=<url-du-repo>"
	screenLine "> delete:<nom-du-repo>"
	screenLine $dot
	screenLine "> install:<nom-du-repo>"
	screenLine "> uninstall:<nom-du-repo>"
	screenLine $dot
	screenLine "> push:<nom-du-repo>"
	screenLine "> pull:<nom-du-repo>"
	screenLine $dot
	screenLine "> run-[w]:<nom-du-repo>"
	screenLine "> test-[w]:<nom-du-repo>"
	screenLine "> perf-[w]:<nom-du-repo>"
	screenLine $dot
	screenFooter
}

function menuChoise(){
	read  -p ">> "  choix
	case "$choix" in
		"list") monitorList
			;;
		"add") monitorAdd
			;;
		"delete") monitorDelete
			;;
		"install") monitorInstall
			;;
		"uninstall") monitorUninstall
			;;
		"push") monitorPush
			;;
		"pull") monitorPull
			;;
		"run") monitorRun
			;;
		"test") monitorTest
			;;
		"perf") monitorPerf
			;;
		"q"|"Q"|"quitter"|"Quitter"|"QUITTER") echo "Bonne journée et à la prochaine ...";
		IS_RINNING=false; clear
		  ;;
		*) echo " ${Red} Mauvais choix${Normal}" && sleep 0.5
	esac
}
