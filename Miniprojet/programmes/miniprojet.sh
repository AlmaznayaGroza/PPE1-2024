#!/usr/bin/env bash

if [ $# -ne 1 ]
then
	echo "Ce programme prend un argument!"
	exit 1
fi

FICHIER=$1
OUTPUT="../tableaux/tableau-fr.html"

# Écrire l'entête HTML
cat <<EOF > $OUTPUT
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tableau URLs</title>
    <meta charset="UTF-8">
    <style>
      table,
      th,
      td {
        padding: 10px;
        border: 1px solid black;
        border-collapse: collapse;
      }
    </style>
</head>
<body>
    <table>
		<caption>Résultats de l'analyse des URLs</caption>
        <thead>
            <tr>
                <th>#</th>
                <th>URL</th>
                <th>Code HTTP</th>
                <th>Encodage</th>
                <th>Nombre de mots</th>
            </tr>
        </thead>
        <tbody>
EOF

lineno=1
while read -r line
do
	http_code=$(curl -s -I -L -w "%{http_code}" -o /dev/null $line)
	encodage=$(curl -s -I -L -w "%{content_type}" -o /dev/null $line | egrep -o "charset=\S+" | cut -d= -f2)
	encodage=${encodage:-"N/A"}
	nb_mots=$(lynx -dump -nolist $line | wc -w)

    # on ajoute dans OUTPUT
	cat <<EOF >> $OUTPUT
            <tr>
                <td>${lineno}</td>
                <td><a href="${line}">${line}</a></td>
                <td>${http_code}</td>
                <td>${encodage}</td>
                <td>${nb_mots}</td>
            </tr>
EOF
    ((lineno++))
done < "$FICHIER"

# on finit en ajoutant les balises de fermeture
cat <<EOF >> $OUTPUT
        </tbody>
    </table>
</body>
</html>
EOF

echo "Fichier HTML généré: $OUTPUT"