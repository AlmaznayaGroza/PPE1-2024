# Journal de bord du projet encadré


## Git & manipulation de fichiers (5/10)

J'ai donc créé ce nouveau journal de bord pour les besoins de l'exercice, puis supprimé mon journal existant après en avoir fait une copie dans un autre dossier.

Je suis en train de modifier ce nouveau journal afin de tester la synchronisation depuis ma machine vers mon dépôt Git.

Je vais maintenant lancer la commande "git status" dans mon terminal, afin de vérifier que Git détecte bien les modifications effectuées en local.
Je pourrai ensuite lancer, successivement, les commandes suivantes:
    - "git add", pour ajouter au suivi les modifications effectuées (staging)
    - "git commit -m “Update #1”", pour valider lesdites modifications, en les accompagnant éventuellement d'une étiquette indicative
    - "git push", pour "pousser" les modifications vers mon dépôt en ligne


## Pipelines exercices

Je n'ai pas eu trop de problèmes pour faire ces exercices.
La difficulté principale, pour moi, était de bien visualiser en amont l'ordre dans lequel devaient se succéder les différentes opérations (filtrage du motif, coupage des colonnes inutiles, classement, suppression des doublons et comptage), pour obtenir le résultat désiré.
J'ai testé à tâtons ce que pouvaient donner dans le terminal des enchaînements progressifs de pipes, avant de parvenir à un résultat satisfaisant.

Voici les commandes avec lesquelles j'ai pu me familiariser en particulier:
    - `cut -f <position_du_champ_à_conserver>`: pour extraire de chaque ligne d'un fichier des champs spécifiques; l'option `-d`permet de préciser un éventuel délimiteur de champs - par défaut, c'est la tabulation (comme dans notre cas)
    - `sort`: permet de trier les lignes d'un texte; `-r`pour trier par ordre décroissant
    - `uniq [options]`: permet de dédoublonner les lignes d'un fichier (supprime les lignes qui se répètent); `-c` -> compte les doublons
    - `tail -n<x>`: affiche les x derniers éléments


## Git exercices (13/10): correction d’erreurs

Honnêtement, j'ai trouvé cet exercice trop difficile quand on débute avec Git, d'autant plus que les consignes étaient parfois ambiguës, à mon avis. Nnotamment le début de l'ex. 3.a ("Lorsque vous aurez fini votre travail (**poussé votre dernier commit**),... "), qui m'a fait bugguer, et que j'ai finalement interprété comme une incitation à pousser nos commits portant sur oups.md.
Cela m'a provoqué un problème de conflit majeur de versions quand j'ai voulu défaire ces commits, que j'ai eu énormément de mal à résoudre. En toute transparence, après être restée au moins 4h bloquée sur cet exercice 3, j'ai fini en désespoir de cause sur ChatGPT, qui m'a suggéré une solution pour "forcer" le push de mes modifications en local à l'ex. 3.b.

Je ne sais pas si c'est prévu, mais je pense que la thématique de résolution des conflits de version mériterait d'être réabordée au prochain cours (et notamment, la différence entre git reset et git revert, qui n'est pas complètement claire en ce qui me concerne).


## Séance 4

### Observations post-exercices



### Code ex.4 commenté ligne par ligne

A première vue, en regardant le nom de la 1ère variable, la ligne "while read -r LINE" et la toute dernière ligne du script, on imagine que ce script lit ligne par ligne un fichier pris en argument et contenant une URL par ligne, puis tente de détecter et décompter les URLs qui ont le bon format (en http(s)://), et les autres.

Analysons ligne par ligne:

```bash
#!/usr/bin/bash # c'est le shebang, nécessaire pour indiquer que le code doit être interprété par bash, ainsi que le chemin où trouver bash

#Vérification du nb d'arguments passés au script
if [ $# -ne 1 ] # si le nb d'arguments n'est pas 1
then
	echo "ce programme demande un argument " # afficher un msg indiquant que le programme nécessite un argument
		exit # sortie du programme
fi

# Création de 3 variables:
# variable FICHIER_URLS, à laquelle on affecte le 1e (et unique) argument passé au script (vu son nom: fichier contenant des URLS)
FICHIER_URLS=$1
# et 2 compteurs
OK=0 # compteur URLs valides
NOK=0 # compteur URLS non valdies

# Boucle: tant qu'il y a des lignes à lire dans le fichier, les lit une à une
while read -r LINE # LINE = variable locale à la boucle, à laquelle est affecté à chaque tour de boucle le contenu de chaque ligne
# l'option -r permet d'empêcher la commande read d'interpréter les backlslashes contenus dans les lignes comme des caractères d'échappement
do
	echo "la ligne: $LINE" # affiche "la ligne: <contenu de la ligne>" à chaque tour de boucle
	if [[ $LINE =∼ ^https?:// ]] # si la ligne *commence* par http:// ou https:// ('s' optionnel)
	then
		echo "ressemble à une URL valide" # afficher qu'on a ce qui ressemble à une URL valide
		OK=$(expr $OK + 1) # et incrémente le compteur des URLs valides (OK)
	else # sinon...
		echo "ne ressemble pas à une URL valide" # ...afficher que la ligne ne ressemble pas à une URL valide
		NOK=$(expr $NOK + 1) # et incrémente le compteur des URLs non-valides (NOK)
	fi
# fin de boucle
done < $FICHIER_URLS
# "< $FICHIERS_URLS" signifie que les lignes sont lues depuis le fichier FICHIER_URLS passé en argument au script

# Après avoir parcouru toutes les lignes du fichier, le script affiche un msg final avec le total des URLs valides et non-valides détectées
echo "$OK URLs et $NOK lignes douteuses"
```
