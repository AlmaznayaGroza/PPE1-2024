#!/bin/bash

# nettoyage fichier txt:
# j'extrais les lignes de texte que je veux garder, et je les sauvegarde dans un nouveau fichier
# -n: empêche sed d’afficher automatiquement chaque ligne en sortie
# -> seules les lignes explicitement demandées par un p (print) seront affichées
sed -n '61,983p' ../candide.txt > ../candide_cut.txt
