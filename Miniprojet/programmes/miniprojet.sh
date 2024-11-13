#!/usr/bin/env bash

if [ $# -ne 1 ]
then
	echo "Ce programme prend un argument!"
	exit 1
fi

FICHIER=$1

lineno=1
while read -r line
do
	http_code=$(curl -s -I -L -w "%{http_code}" -o /dev/null $line)

	encodage=$(curl -s -I -L -w "%{content_type}" -o /dev/null $line | egrep -o "charset=\S+" | cut -d= -f2)
	encodage=${encodage:-"N/A"}

	nb_mots=$(lynx -dump -nolist $line | wc -w)

	echo -e "${lineno}\t${line}\t${http_code}\t${encodage}"
	((lineno++))
done < $FICHIER
