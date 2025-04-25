#!/bin/bash


mkdir -p grep_find_pipe_tp/{logs,archives,configs,data,tmp,old_logs}


for i in {1..3}; do
  cat <<EOF > grep_find_pipe_tp/logs/log$i.log
[INFO] Application démarrée
[WARNING] Mémoire presque pleine
[ERROR] Échec de connexion à la base $i
[DEBUG] Variable x=$((i*3))
[INFO] Utilisateur connecté
[ERROR] Erreur critique détectée
[INFO] Déconnexion utilisateur
EOF
done


for i in {1..2}; do
  for j in {1..30}; do
    echo "Ceci est une ligne $j du fichier texte $i" >> grep_find_pipe_tp/archives/doc$i.txt
  done
done


cat <<EOF > grep_find_pipe_tp/data/users.csv
id,username,role
1,alice,admin
2,bob,user
3,charlie,manager
4,david,user
5,emma,admin
EOF


cat <<EOF > grep_find_pipe_tp/configs/db.conf
host=localhost
user=admin
password=secr3t
port=5432
EOF


touch grep_find_pipe_tp/tmp/temp1.tmp grep_find_pipe_tp/tmp/temp2.tmp


touch -d "2 days ago" grep_find_pipe_tp/configs/db.conf
touch -d "1 day ago" grep_find_pipe_tp/tmp/temp1.tmp
touch -d "3 days ago" grep_find_pipe_tp/old_logs/old.log

echo "✅ Environnement 'grep_find_pipe_tp' est généré avec tous les fichiers pour le TP."
