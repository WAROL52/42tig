#!/bin/bash

printline(){
	local size=$1
	printf "\033[0;36m|"
	printf "%.0s_" $(seq 1 $size)
	printf "\033[0m\n"
}
log_info()
{
	echo -e "\033[0;33m$1\033[m $2"
}

git_push(){
	local name=$1
	local GIT_PUSH_MSG=$2
	local text=$(printf "\033[1;36m|git push:\033[0m %19s\033[1;36m|\033[0m" "$name")
	printline 30
	printf "%s\n" "$text"
	printline 30
	cd $name
	if [ -e ".git" ]; then
      # Vérifier s'il y a des modifications à committer
      if [ -n "$(git status --porcelain)" ]; then
	  log_info "[1]:" "pwd"
		pwd
        # Ajouter tous les changements
		log_info "[2]:" "git add ."
        git add .
        
        # Effectuer un commit avec un message générique
		log_info "[3]:" "git commit -m \"\033[32m$GIT_PUSH_MSG\033[0m\""
        git commit -m "$GIT_PUSH_MSG"
        
        # Effectuer un push vers le dépôt distant
		log_info "[4]:" "git push $GIT_REMOTE $GIT_BRANCH"
        git push $GIT_REMOTE $GIT_BRANCH # Remplacez 'main' par la branche appropriée si nécessaire
        
        echo "Push effectué pour $name"
      else
        # echo "Aucune modification pour $name"
		log_info "Alert:" "Aucune modification pour $name"
      fi
    else
      echo -e "\033[0;36mWorkspace/$name\033[0m non installé!"
    fi
	cd ..
}


git_push_auto() {

	# Parcourir chaque projet
	cd $REPOS_DIR
	read -p "Description: " GIT_PUSH_MSG
	while read -r name url; do
	git_push $name "$GIT_PUSH_MSG"
	echo -e "\n"
	done < <(echo "$GITHUB_URL" | awk '{for (i=1; i<=NF; i+=2) print $i, $(i+1)}')
	cd ..
	local projetname=$(basename $(pwd))
	cd..
	pwd
	echo "$projetname"
	git_push "./$projetname" "$GIT_PUSH_MSG"
}
