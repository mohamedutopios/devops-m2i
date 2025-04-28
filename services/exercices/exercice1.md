### 🎓 **Exercice service**

1️⃣ **Créer un script Bash** appelé `/usr/local/bin/disk_check.sh` qui :
- Exécute une seule commande pour vérifier l’espace disque sur `/` avec `df`.
- Écrit directement le résultat de la commande dans `/var/log/disk_check.log`.
- Exemple attendu dans le log :
   ```
   Vérification du disque le 2025-04-28 :
   /dev/sda1        40G   30G   10G   75% /
   ```

2️⃣ **Créer un fichier de service systemd** `/etc/systemd/system/disk_check.service` :
- Le service doit exécuter le script **une seule fois** à chaque démarrage manuel.
- Utiliser `Type=simple`.
- Ajouter une description dans `[Unit]`.
- Le service ne doit pas redémarrer automatiquement (pas de Restart nécessaire).
