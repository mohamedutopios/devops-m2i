#!/bin/bash

mkdir -p lecture_tp
cd lecture_tp || exit 1


cat <<EOF > short.txt
Bonjour
Voici un petit fichier
Avec exactement
Cinq lignes
Merci
EOF

for i in $(seq 1 30); do
  echo "Ligne $i : Ceci est une ligne de texte moyenne" >> medium.txt
done


for i in $(seq 1 250); do
  echo "Ligne $i : Ceci est une ligne de texte longue pour test" >> long.txt
done

for i in $(seq 1 120); do
  case $((i % 4)) in
    0) echo "[INFO] Initialisation du service $i" >> journal.log ;;
    1) echo "[ERROR] Échec de connexion à la base $i" >> journal.log ;;
    2) echo "[DEBUG] Variable x$i = $(($i * 2))" >> journal.log ;;
    3) echo "[WARNING] Utilisation mémoire élevée à 90% ($i)" >> journal.log ;;
  esac
done

echo "✅ Dossier 'lecture_tp' est prêt avec les fichiers : short.txt, medium.txt, long.txt, journal.log"
