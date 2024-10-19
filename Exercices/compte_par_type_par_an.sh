#!/bin/bash

# Je vérifie qu'on a bien 1 seul argument

if [ $# -ne 1 ]
then
    echo "Nombre d'arguments invalide: entrer seulement une entité"
    exit 1 # permet de terminer le script et de renvoyer 1, qui signale une erreur
fi

# Je peux donc affecter l'argument à la variable $1 

TYPE=$1

# On doit maintenant vérifier que l'argument a la bonne forme (celle d'un mot)
if ! [[ "$TYPE" =~ [[:alpha:]]+ ]]
then
	echo "Erreur: entrer un mot pour rechercher un type d'entité"
	exit 1
fi


# J'appelle le script compte_par_type.sh avec les 2 arguments qu'il prend (et chaque année en second argument)

DECOMPTE_2016=$(./compte_par_type.sh $TYPE 2016)
echo -e "Type '$TYPE' en 2016:\n$DECOMPTE_2016"

DECOMPTE_2017=$(./compte_par_type.sh $TYPE 2017)
echo -e "Type '$TYPE' en 2017:\n$DECOMPTE_2017"

DECOMPTE_2018=$(./compte_par_type.sh $TYPE 2018)
echo -e "Type '$TYPE' en 2018:\n$DECOMPTE_2018"
