#!/bin/bash


# J'affecte l'argument à la variable $1 

TYPE=$1


# J'appelle le script compte_par_type.sh avec les 2 arguments qu'il prend (et chaque année en second argument)

DECOMPTE_2016=$(./compte_par_type.sh $TYPE 2016)
echo -e "Type '$TYPE' en 2016:\n$DECOMPTE_2016"

DECOMPTE_2017=$(./compte_par_type.sh $TYPE 2017)
echo -e "Type '$TYPE' en 2017:\n$DECOMPTE_2017"

DECOMPTE_2018=$(./compte_par_type.sh $TYPE 2018)
echo -e "Type '$TYPE' en 2018:\n$DECOMPTE_2018"
