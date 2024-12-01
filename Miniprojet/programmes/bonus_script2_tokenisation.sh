#!/bin/bash

# vérifie que le fichier est passé en argument
if [ -z "$1" ]; then
  echo "Erreur: aucun fichier spécifié"
  exit 1
fi

# fichier texte à traiter
FICHIER=$1

# traite le fichier et affiche le résultat sur la sortie standard
# convertit tout en minuscules (lettres accentuées incluses) | remplace les ' par des espaces |
# recherche les mots (tirets inclus) | supprime les doublons de retour à la ligne
cat "$FICHIER" | awk '{ print tolower($0) }' | sed -E "s/([^[:space:][:punct:]]+)'/\1 /g" | grep -oE "[[:alnum:]-]+" | tr -s '\n'