28/9

J'ai fait l'exercice 1. Mais j'avais commencé l'exercice en cours, et n'avais pas vu la dernière page de consignes, indiquant qu'il fallait obtenir l'historique complet des commandes effectuées...
Ayant effectué par la suite d'autres commandes, en rapport avec d'autres cours, et ayant fermé et rouvert le terminal plusieurs fois, je n'ai malheureusement pu récupérer que les commandes effectuées aujourd'hui, lorsque j'ai repris l'exercice pour le terminer.

Je me souvenais déjà de quelques commandes Bash élémentaires, apprises l'an dernier, mais j'ai découvert quelques options intéressantes en cherchant à faire l'exercice:
• on peut créer une arborescence de dossiers en 1 seule commande grâce à l'option -p de mkdir; on peut même (je l'ai découvert en faisant des recherches après l'exercice), créer en 1 seule commande un dossier parent et plusieurs sous-dossiers enfants, en les séparant par une virgule et en encadrant le tout entre des accolades: mkdir -p parent/{enfant1,enfant2,enfant3}
• pour copier un dossier et son contenu, il faut ajouter l'option -R à cp; on peut même copier tout le contenu d'un dossier sans copier le dossier lui-même grâce à l'option -RT
• j'ai aussi découvert, après coup, qu'on pouvait déplacer des fichiers portant des extensions différentes avec 1 seule commande grâce aux accolades (et aux virgules comme séparateurs): mv *.{jpg,png,gif} ./Dossier/
• on peut également "forcer" mv à afficher les fichiers déplacés en utilisant l'option -v, et aussi utiliser l'option -i pour demander une confirmation avant d’écraser un fichier déjà existant dans la destination (et ainsi éviter un écrasement intempestif)
• pour zipper un dossier, zip doit être accompagné de l'option -r

Enfin, j'avais oublié que mv pouvait servir à renommer des fichiers ou des dossiers (c'est assez contre-intruitif pour moi, vu le nom de la commande).