#!/bin/bash

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
}
function screenLine() {
	echo -e "${Blank} ${Normal}     $1${Space:$(expr $(expr length "$1") + 7 )}${Blank} ${Normal}"
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

