#!/bin/bash

# Je vérifie qu'on a bien 3 arguments

if [ $# -ne 3 ]
then
	echo "Nombre d'arguments invalide: entrer une année, un mois et le nb de lieux à afficher"
	exit 1 # permet de terminer le script et de renvoyer 1, qui signale une erreur
fi

# Je déclare mes 3 variables

ANNEE=$1
MOIS=$2
NOMBRE_LIEUX=$3


# On doit maintenant vérifier que les variables entrées ont la bonne forme
# = vérifier que l'année corresponde bien à 2016, 2017 ou 2018
if ! [[ "$ANNEE" =~ ^201[678]$ ]]
then
	echo "Erreur: l'année doit être 2016, 2017 ou 2018"
	exit 1
fi

# puis vérifier que le mois a bien le format MM
if ! [[ "$MOIS" =~ ^0[1-9]|1[0-2]$ ]]
then
	echo "Erreur: entrer un mois au format MM"
	exit 1
fi

# enfin, vérifier que le 3e variable est bien un nombre quelconque strictement positif
if ! [[ "$NOMBRE_LIEUX" =~ ^[1-9]|[1-9][0-9]+$ ]]
then
	echo "Erreur: entrer un nb positif"
	exit 1
fi


CLASSEMENT=$(cat ../../ann/$ANNEE/*_$MOIS_*.ann | grep Location | cut -f 3 | sort | uniq -c | sort -nr | head -n $NOMBRE_LIEUX)
echo "$CLASSEMENT"
