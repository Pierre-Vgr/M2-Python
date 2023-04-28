#!/bin/bash

# Vérifier si les trois arguments sont présents
if [ $# -ne 3 ]; then
  echo "Usage: $0 <nom du meme> <texte du haut> <texte du bas>"
  exit 1
fi

# Construire l'URL de l'API avec les trois arguments
url="http://apimeme.com/meme?meme=$1&top=$2&bottom=$3"

# Utiliser curl pour télécharger l'image
curl -s "$url" -o meme-$1.png

# Vérifier si le téléchargement a réussi
if [ $? -ne 0 ]; then
  echo "Erreur lors du téléchargement de l'image"
  exit 1
fi

# Afficher un message de confirmation
echo "Une image .png du meme est enregistrée sur la machine"
