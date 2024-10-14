# Journal de bord du projet encadré


*Cette ligne doit rester après correction*


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



# Création de mon fichier oups

*Ligne à garder de côté*

Afin de faire l'exercice 3


## Дарэмна ганьбуеш ты, дружа… (Верш Вацлава Ластоўскага, 1923 г.)

Дарэмна ганьбуеш ты, дружа,
Майму закліканьню да помсты.
Я мсьцежнік любові. А мсьцежыць
Я клічу да тых, хто спаможа
Быці ахвярнай ахвярай,
Шукаючы праўды сьвятое.
Ахвярная мсьцежа нам зродзіць
Чэсных з сабою герояў;
Нашы пачуцьця ачысьціць,
Саміх нас падніме душою
І ворага з часам навучыць
Чціць нас у змаганьні упорным…
„Зуб за зуб“ — за ўласныя крыўды
Вучылі прарокі плаціці.
Я-ж клічу плаціці у двое —
За крыўды народу, за ганьбу,
За зьдзек і няволю, за мукі,
За кроў і пакору…
Даволі пакоры ганебнай.
І лганай любові даволі.
Хто вольным быць мкнецца
Умеці разрожніць павінен
Ад праўды няпраўду і быці
У патрэбе судзьдзёю.

Юры В…
