#!/bin/bash

git_push_auto() {

# Parcourir chaque projet
while read -r name url; do
  project_dir="$REPOS_DIR/$name"
  
  if [ -d "$project_dir" ]; then
    cd "$project_dir" || continue
    pwd
	if [ -d ".git" ]; then
    continue
    # Ajouter tous les changements
    git add .
    
    # Effectuer un commit avec un message générique
    git commit -m "Mise à jour automatique des projets"
    
    # Effectuer un push vers le dépôt distant
    git push origin main # Remplacez 'main' par la branche appropriée si nécessaire
    
    echo "Push effectué pour $name"
  else
    echo "Le répertoire $name n'existe pas dans $REPOS_DIR"
  fi
done < <(echo "$GITHUB_URL" | awk '{for (i=1; i<=NF; i+=2) print $i, $(i+1)}')
}
