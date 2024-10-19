#!/bin/bash

ANNEE=$1
MOIS=$2
NOMBRE_LIEUX=$3

CLASSEMENT=$(cat ../../ann/$ANNEE/*_$MOIS_*.ann | grep Location | cut -f 3 | sort | uniq -c | sort -nr | head -n $NOMBRE_LIEUX)
echo "$CLASSEMENT"
