#!/bin/bash

source $(dirname "$(realpath "$BASH_SOURCE")")/env.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/c_tools.sh
source $(dirname "$(realpath "$BASH_SOURCE")")/workspace/add.sh
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
