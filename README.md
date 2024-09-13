# 42TIG

## Introduction

Ce script Bash permet de gerer des projets a 42. Il est conçu pour plein de trucs (Flemme pour l'explication).

## Prérequis

- **Système d'exploitation** : [ex. Debian, Ubuntu, etc.]
- **Dépendances** : [build-essential]

## Installation

1. Assurez-vous que les dépendances sont installées :

   ```sh

   ```

## Commandes
 
```bash
##################################################
# Liste tous les commandes disponibles.
> make # Affiche le Readme
> make help # Affiche le liste de commande
#
#
# Liste tous les repos disponibles.
> make list # dans le registre et dans workspace
> make list:register # dans le registre
> make list:workspace # dans le workspace
#
#
# Ajoute un nouveau repo avec un nom et une URL
# spécifiques.
> make add # Tous les repos dans le registre
> make add:<nom-du-repo> url=<url-du-repo>
#
#
# Installe un repos spécifique dans le registre.
> make install # Tous les repos dans le registre
> make install:<nom-du-repo>
#
#
# Desinstaller un repo installer dans le Workspace.
> make remove # Tous les repos dans le Workspace
> make remove:<nom-du-repo>
#
#
# gerer l'ensemble de git (add,commit,push) sur
# un repo.
> make push # Tous les repos dans le workspace
> make push:<nom-du-repo>
#
#
# gere la commande 'git pull'
> make pull # Tous les repos dans le Workspace
> make pull:<nom-du-repo>
#
#
# Supprime un repo dans la liste.
> make delete # Tous les repos dans le Registre
> make delete:<nom-du-repo>
#
#
# Excecution, test et performance
> make run:<nom-du-repo> # Excecuter
> make test:<nom-du-repo> # Teste
> make perf:<nom-du-repo> # Performance
```
