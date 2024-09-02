#!/bin/bash

printline(){
	local size=$1
	printf "\033[0;36m|"
	printf "%.0s_" $(seq 1 $size)
	printf "\033[0m\n"
}

git_push(){
	local name=$1
	local text=$(printf "\033[1;36m|git push:\033[0m %19s\033[1;36m|\033[0m" "$name")
	printline 30
	printf "%s\n" "$text"
	printline 30
	cd $name
	pwd
	if [ -e ".git" ]; then
      # Vérifier s'il y a des modifications à committer
      if [ -n "$(git status --porcelain)" ]; then
        # Ajouter tous les changements
        git add .
        
        # Effectuer un commit avec un message générique
        git commit -m "Mise à jour automatique des projets"
        
        # Effectuer un push vers le dépôt distant
        git push $(GIT_REMOTE) $(GIT_BRANCH) # Remplacez 'main' par la branche appropriée si nécessaire
        
        echo "Push effectué pour $name"
      else
        echo "Aucune modification à pousser pour $name"
      fi
    else
      echo "Le répertoire $name n'est pas un dépôt Git."
    fi
	cd ..
}


git_push_auto() {

	# Parcourir chaque projet
	cd $REPOS_DIR
	while read -r name url; do
	git_push $name
	echo -e "\n"
	done < <(echo "$GITHUB_URL" | awk '{for (i=1; i<=NF; i+=2) print $i, $(i+1)}')
}
