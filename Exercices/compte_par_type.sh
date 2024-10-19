#!/bin/bash


# J'affecte les 2 arguments aux variables $1 et $2 

ENTITE=$1
ANNEE=$2

DECOMPTE=$(cat ../../ann/$ANNEE/*.ann | grep $ENTITE | wc -l)
echo "$DECOMPTE"
