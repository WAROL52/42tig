#!/bin/bash

source $(dirname "$(realpath "$BASH_SOURCE")")/functions.sh



function menuWorkspace(){
	# Caractère à répéter
	char=" "
	# Nombre de répétitions
	width=$(tput cols)
	# Résultat
	Space=""
	# Boucle pour répéter le caractère
	for ((i=0; i<width; i++)); do
		Space+="$char"
	done

	local menu0="> list:<register|workspace|env>"

	local menu1="> add:<nom-du-repo> url=<url-du-repo>"
	local menu2="> delete:<nom-du-repo>"

	local menu3="> install:<nom-du-repo>"
	local menu4="> uninstall:<nom-du-repo>"
	
	local menu5="> push:<nom-du-repo>"
	local menu6="> pull:<nom-du-repo>"

	local menu7="> run-[w]:<nom-du-repo>"
	local menu8="> test-[w]:<nom-du-repo>"
	local menu9="> perf-[w]:<nom-du-repo>"

	# echo `clear`
	while true; do
	clear
	echo -e "${Title}${Space}${Normal}"
	echo -e "${Title}${Bold}  42TIG${Space:7}${Normal}"
	echo -e "${Title}${Space}${Normal}"
	echo -e "${Blank}${Space}${Normal}"
	echo -e "${Blank} ${Normal}${Space:2}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu0}${Space:$(expr $(expr length "$menu0") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     .....................................${Space:44}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu1}${Space:$(expr $(expr length "$menu1") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu2}${Space:$(expr $(expr length "$menu2") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     .....................................${Space:44}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu3}${Space:$(expr $(expr length "$menu3") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu4}${Space:$(expr $(expr length "$menu4") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     .....................................${Space:44}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu5}${Space:$(expr $(expr length "$menu5") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu6}${Space:$(expr $(expr length "$menu6") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     .....................................${Space:44}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu7}${Space:$(expr $(expr length "$menu7") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu8}${Space:$(expr $(expr length "$menu8") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu9}${Space:$(expr $(expr length "$menu9") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     .....................................${Space:44}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}${Space:2}${Blank} ${Normal}"
	echo -e "${Blank}${Space}${Normal}"
	echo "                             "
	read  -p ">> "  choix
	case "$choix" in
		1) LisezMoi
			;;
		2) a=3;b=5;c=$((a+b));echo "calcul= $c";WaitEnter
			;;
		3) Multiply
			;;
		4) Web
				;;
		"q"|"Q") echo "Bonne journée et à la prochaine ...";
		WaitEnter
		  ;;
		*) echo " Mauvais choix" && sleep 1
	esac
	#statements
done
}