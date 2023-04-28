#!/bin/bash

# Récupérer le contenu HTML de la page http://apimeme.com
html=$(curl -s http://apimeme.com)

# Extraire tous les noms de meme de la page HTML avec grep
names=$(echo "$html" | grep -oP '<option value="\K[^"]+(?=")')

# Écrire les noms de meme dans un fichier name_memes.txt
echo "$names" > name_memes.txt

# Afficher un message de confirmation
echo "Les noms de meme ont été écrits dans le fichier name_memes.txt"
