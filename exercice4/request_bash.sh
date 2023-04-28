#!/bin/bash

# Récupérer le nombre de noms de meme dans le fichier name_memes.txt
total=$(wc -l < name_memes.txt)

# Générer un nombre aléatoire entre 1 et le nombre de noms de meme
random_number=$(shuf -i 1-"$total" -n 1)

# Récupérer le nom de meme correspondant au nombre aléatoire
random_name=$(head -n "$random_number" name_memes.txt | tail -n 1)

# Vérifier si les deux arguments sont présents
if [ $# -ne 2 ]; then
  echo "Usage: $0 <nom du meme> <texte du haut> <texte du bas>"
  exit 1
fi

# Construire l'URL de l'API avec les trois arguments
url="http://apimeme.com/meme?meme=$random_name&top=$1&bottom=$2"

# Utiliser curl pour télécharger l'image
curl -s "$url" -o meme-$random_name.png

# Vérifier si le téléchargement a réussi
if [ $? -ne 0 ]; then
  echo "Erreur lors du téléchargement de l'image"
  exit 1
fi

# Afficher un message de confirmation
echo "Une image .png du meme est enregistrée sur la machine"
