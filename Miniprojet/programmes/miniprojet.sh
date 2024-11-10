#!/usr/bin/env bash

if [ $# -ne 1 ]
then
	echo "Ce programme prend un argument!"
	exit 1
fi

FICHIER=$1

# on initialise un compteur
i=1

while read -r line
do
	# obtenir le code HTTP de la réponse, sans enregistrer ni afficher le contenu de l'URL, ni afficher les messages de progression
	# et n'afficher que le code de statut HTTP
    code_http=$(curl -o /dev/null -s -w "%{http_code}" "$line")

	# obtenir l'encodage de la page
    encodage=$(curl -sI "$line" | grep -i "content-type" | grep -o "charset=[^;]*" | cut -d= -f2)
    if [ -z "$encoding" ]
	then
        encodage="absent"  # marque comme absent si c'est le cas
    fi

	# compte le nb de mots dans la page
    decompte=$(curl -s "$line" | wc -w)

	# affiche le résultat avec le numéro de ligne, URL, code HTTP, encodage et nb de mots (séparés par des tabulations)
	echo -e "${i}\t${line}\t${code_http}\t${encodage}\t${decompte}"

	# on incrémente le compteur à chaque tour de boucle
	((i++))
done < "$FICHIER"
