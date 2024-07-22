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
# Liste tous les commandes disponibles.
make
make help

# Liste tous les repos disponibles.
make list

# Ajoute un nouveau repo avec un nom et une URL spécifiques.
make add # Tous les repos
make add:<nom-du-repo> url=<url-du-repo>

# Installe un repo spécifique.
make install # Tous les repos
make install:<nom-du-repo>

# Desinstaller un repo installer dans le Workspace.
make remove # Tous les repos
make remove:<nom-du-repo>

# Supprime un repo dans la liste.
make delete:<nom-du-repo>

make run:<nom-du-repo> # Excecuter
make test:<nom-du-repo> # Teste
make perf:<nom-du-repo> # Performance
```
