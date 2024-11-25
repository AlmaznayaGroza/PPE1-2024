#!/bin/bash

FICHIER=$1
OUTPUT="../tableaux/tableau.html"

{
echo "<html>
	<head>
		<meta charset=\"UTF-8\">
	</head>

	<body>
		<table>
			<thead>
				<tr>
					<th>#</th>
					<th>URL</th>
					<th>Code HTTP</th>
					<th>Encodage</th>
					<th>Nombre de mots</th>
				</tr>
			</thead>
			<tbody>"

lineno=1
while read -r URL
do
	reponse=$(curl -s -L -w "%{content_type}\t%{http_code}" -o /tmp/contenupages.html $URL)
	http_code=$(echo "$reponse" | cut -f2)
	content_type=$(echo "$reponse" | cut -f1)
	encodage=$(echo "$content_type" | egrep -o "charset=\S+" | cut -d "=" -f2 | tail -n1)
	# valeur par défaut si encodage est vide (car non trouvé)
	encodage=${encodage:-"N/A"}
	nb_mots=$(lynx -dump -nolist /tmp/contenupages.html | wc -w | sed 's/^[ \t]*//;s/[ \t]*$//')
	# sed supprime les éventuels tabulations ou espaces qui traînent en début et fin de ligne
	
	#echo -e "$lineno\t$URL\t$http_code\t$encodage\t$nb_mots"
	
	echo "<tr>
		<td>$lineno</td>
		<td>$URL</td>
		<td>$http_code</td>
		<td>$encodage</td>
		<td>$nb_mots</td>
	</tr>"
	
    ((lineno++))
done < "$FICHIER"

echo "</tbody>
</table>
</body>
</html>"
} > "$OUTPUT"