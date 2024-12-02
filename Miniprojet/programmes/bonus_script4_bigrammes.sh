#!/bin/bash

FICHIER=$1

# nb de bigrammes à afficher (par défaut, 25 si pas de second argument)
NB_BIGRAMMES=${2:-25}

# appel du script de l'ex. 1 pour nettoyer et préparer le texte
./bonus_script1_nettoyage "$FICHIER" | \
  #  crée les bigrammes en associant chaque mot avec le suivant
  paste -d' ' - - | \           # prend 2 lignes consécutives et les fusionne avec un espace entre elles
  sort |                        # trie les bigrammes
  uniq -c |                     # compte leur fréquence des bigrammes
  sort -nr |                    # trie par fréquence (ordre décroissant)
  head -n "$NB_BIGRAMMES"       # affiche les n premiers bigrammes (par défaut 25)