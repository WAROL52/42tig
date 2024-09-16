#!/bin/bash

source $(dirname "$(realpath "$BASH_SOURCE")")/env.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/c_tools.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/list.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/add_delete.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/install_remove.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/push_pull.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/run_test_perf.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/model.sh
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
	local repos_list=$(ls $TIG_DIR/register)
	local func=$1
	while read -r name url; do
	source $TIG_DIR/register/$name
	$func $CONF_NAME $CONF_URL_GITHUB $CONF_URL_42
	done < <(echo "$repos_list" | awk '{for (i=1; i<=NF; i+=1) print $i}')
}

foreach_workspace_default() {
	local func=$1
	for name in "${!DEFAULT_REPOS_LIST[@]}" ; do
		$func "$name" "${DEFAULT_REPOS_LIST[$name]}"
	done
}


git_checkout() {
	local name=$1
	local path=$PWD
	if [ -f $PWD/$WORKSPACE_DIR/$name/.git ]; then
		echo -e "git checkout ${OK_COLOR}$name${NO_COLOR} $GIT_BRANCH"
		cd $PWD/$WORKSPACE_DIR/$name
		git checkout $GIT_BRANCH
	fi
	cd $path
}

import_conf(){
	local name=$1
	local conf_file="$TIG_DIR/register/$name"
	if [ -f $conf_file ]; then
		source $conf_file
	fi
}

export_conf(){
	local name=$1
	local conf_file="$TIG_DIR/register/$name"
	if [ -f $conf_file ]; then
		source $conf_file
		sed -i "s/^CONF_NAME=.*/CONF_NAME=$1/" $conf_file
		sed -i "s/^CONF_URL_GITHUB=.*/CONF_URL_GITHUB=$2/" $conf_file
		sed -i "s/^CONF_URL_42=.*/CONF_URL_42=$3/" $conf_file
	fi
}

create_conf(){
	local name=$1
	local conf_file="$TIG_DIR/register/$name"
	if [ -f $conf_file ]; then
		echo "'$conf_file' existe!"
	else
		echo "CONF_NAME=$1" >> $conf_file
		echo "CONF_URL_GITHUB=$2" >> $conf_file
		echo "CONF_URL_42=$3" >> $conf_file
	fi
}
