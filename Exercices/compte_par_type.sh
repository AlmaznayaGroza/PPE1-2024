#!/bin/bash


# Je vérifie qu'on a bien 2 arguments

if [ $# -ne 2 ]
then
    echo "Nombre d'arguments invalide: entrer un type d'entité puis une année"
    exit 1 # permet de terminer le script et de renvoyer 1, qui signale une erreur
fi


# Une fois qu'on est sûr qu'on a bien le bon nb d'arguments, on crée les variables

ENTITE=$1
ANNEE=$2


# On doit maintenant vérifier que les variables entrées ont la bonne forme
# -> vérifier que le 1er argument corresponde bien à un mot
if ! [[ "$ENTITE" =~ ^[[:alpha:]]+$ ]]
then
	echo "Erreur: entrer un mot pour rechercher un type d'entité"
	exit 1
fi

# puis vérifier que l'année corresponde bien à 2016, 2017 ou 2018
if ! [[ "$ANNEE" =~ ^201[678]$ ]]
then
	echo "Erreur: l'année doit être 2016, 2017 ou 2018"
	exit 1
fi


# J'ai bien vérifié mes arguments, je peux maintenant compter

DECOMPTE=$(cat ../../ann/$ANNEE/*.ann | grep $ENTITE | wc -l)
echo "$DECOMPTE"
