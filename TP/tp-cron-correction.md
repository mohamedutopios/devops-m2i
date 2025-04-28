## 🟦 Partie 1 – Installation de MySQL

### 🔧 Étapes :

1. Mettre à jour les paquets :
```bash
sudo apt update
```

2. Installer MySQL Server :
```bash
sudo apt install mysql-server -y
```

3. Sécuriser l’installation :
```bash
sudo mysql_secure_installation
```

4. Vérifier que le service est actif :
```bash
sudo systemctl status mysql
```

---

## 🟩 Partie 2 – Préparation d’une base fictive

### 🔧 Étapes :

1. Se connecter à MySQL :
```bash
sudo mysql
```

2. Créer une base et une table :
```sql
CREATE DATABASE tp_backup;
USE tp_backup;
CREATE TABLE notes (id INT PRIMARY KEY AUTO_INCREMENT, contenu TEXT);
INSERT INTO notes (contenu) VALUES ('Bonjour'), ('Test'), ('Sauvegarde OK');
EXIT;
```

---

## 🟨 Partie 3 – Écriture du script de backup

### 🔧 Crée le script `backup_mysql.sh` :

```bash
#!/bin/bash

DATE=$(date +%F)
DEST="/home/$USER/mysql_backups"
FICHIER="$DEST/tp_backup_$DATE.sql"

mkdir -p "$DEST"
mysqldump tp_backup > "$FICHIER"

echo "Sauvegarde de tp_backup effectuée dans $FICHIER"
```

### 🔧 Rends-le exécutable :
```bash
chmod +x backup_mysql.sh
```

---

## 🟥 Partie 4 – Programmation via `cron`

### 🔧 Ajouter à la crontab :
```bash
crontab -e
```

Ajoute la ligne suivante (en remplaçant le chemin par le tien) :

```
0 3 1-7 1,7 5 [ "$(date +\%u)" = "5" ] && /chemin/vers/backup_mysql.sh
```

### 📌 Explication :
- `0 3 1-7 1,7 5` = tous les vendredis (jour 5) **du 1er au 7** du mois de janvier (1) et juillet (7)
- `&&` : permet d'exécuter **seulement si c’est bien un vendredi**
- `date +%u` retourne le jour de la semaine (1 = lundi, 7 = dimanche)

---

## 🧪 Partie 5 – Vérifications

1. Tester manuellement :
```bash
./backup_mysql.sh
ls ~/mysql_backups
```

2. Vérifier la tâche dans `cron` :
```bash
crontab -l
```

3. Consulter les logs de cron :
```bash
grep CRON /var/log/syslog | tail
```