#!/usr/bin/bash


# Je compte pour 2016

lieux2016=$(cat ../../ann/2016/*.ann | grep Location | wc -l)
echo "Lieux en 2016:"
echo "$lieux2016"


# Puis pour 2017

lieux2017=$(cat ../../ann/2017/*.ann | grep Location | wc -l)
echo -e "Lieux en 2017:\n$lieux2017"


# Et enfin pour 2018

lieux2018=$(cat ../../ann/2018/*.ann | grep Location | wc -l)
echo -e "Lieux en 2018:\n$lieux2018"


