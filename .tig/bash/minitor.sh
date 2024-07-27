#!/bin/bash


function monitorTitle(){
	local line=$1
	echo -e "${Blank} ${Normal}${line}${Space:$(expr $(expr length "$line") + 7 )}${Blank} ${Normal}"
}
function monitorLine(){
	local line=$1
	echo -e "${Blank} ${Normal}${line}${Space:$(expr $(expr length "$line") + 7 )}${Blank} ${Normal}"
}
function monitorWorkspace(){
	local title="Menu"
	local subtitle=""
	local reposName=""
	monitorTitle
	
}