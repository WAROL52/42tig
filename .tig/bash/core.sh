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

	local menu1="> add:<nom-du-repo> url=<url-du-repo>"
	local menu2="> delete"
	local menu3="> install"
	local menu4="> uninstall"
	local menu5="> push"

	# echo `clear`
	while true; do
	clear
	echo -e "${Title}${Space}${Normal}"
	echo -e "${Title}${Bold}  42TIG${Space:7}${Normal}"
	echo -e "${Title}${Space}${Normal}"
	echo -e "${Blank}${Space}${Normal}"
	echo -e "${Blank} ${Normal}${Space:2}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu1}${Space:$(expr $(expr length "$menu1") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu2}${Space:$(expr $(expr length "$menu2") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu3}${Space:$(expr $(expr length "$menu3") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu4}${Space:$(expr $(expr length "$menu4") + 7 )}${Blank} ${Normal}"
	echo -e "${Blank} ${Normal}     ${menu5}${Space:$(expr $(expr length "$menu5") + 7 )}${Blank} ${Normal}"
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