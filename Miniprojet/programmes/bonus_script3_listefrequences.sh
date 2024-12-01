#!/bin/bash

# fichier texte à traiter
FICHIER=$1

# nb de mots les plus fréquents à afficher (par défaut 25)
NB_MOTS=${2:-25}

# {2:-25}: 2 fait référence au seconnd argument passé au script (ici, le nb de mots à afficher)
# :- est utilisé pour indiquer que si la variable 2 n'est pas définie ou est vide, on utilise une valeur par défaut
# 25: valeur par défaut


./bonus_script2_tokenisation.sh "$FICHIER" | sort | uniq -c | sort -nr | head -n "$NB_MOTS"