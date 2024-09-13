#!/bin/bash

source $(dirname "$(realpath "$BASH_SOURCE")")/env.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/c_tools.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/add.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/delete.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/list.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/screen.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/git.sh

function cmd_safe(){
	while true; do
		break
	done
}

function cmd(){
	while true; do
		break
	done
}

function WaitEnter() {
  echo ""
  echo -e "Veuillez taper sur la touche ${Blue}ENTREE${Normal} afin de continuer"
  read
}

foreach_workspace() {
	local func=$1
	cd $REPOS_DIR
	while read -r name url; do
	$func $name $url
	done < <(echo "$GITHUB_URL" | awk '{for (i=1; i<=NF; i+=2) print $i, $(i+1)}')
}

import_conf(){
	local name=$1
	local conf_file="$TIG_DIR/register/$name.conf"
	if [ -f $conf_file ]; then
		source $conf_file
	fi
}

export_conf(){
	local name=$1
	local conf_file="$TIG_DIR/register/$name.conf"
	if [ -f $conf_file ]; then
		source $conf_file
		sed -i "s/^CONF_NAME=.*/CONF_NAME=$1/" $conf_file
		sed -i "s/^CONF_URL_GITHUB=.*/CONF_URL_GITHUB=$2/" $conf_file
		sed -i "s/^CONF_URL_42=.*/CONF_URL_42=$3/" $conf_file
	fi
}

create_conf(){
	local name=$1
	local conf_file="$TIG_DIR/register/$name.conf"
	if [ -f $conf_file ]; then
		echo "'$conf_file' existe!"
	else
		echo "CONF_NAME=$1" >> $conf_file
		echo "CONF_URL_GITHUB=$2" >> $conf_file
		echo "CONF_URL_42=$3" >> $conf_file
	fi
}
