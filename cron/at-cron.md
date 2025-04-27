#  **Démos `cron` et `at` – Planification de tâches Linux**

---

##  **1. `at` – Exécuter une tâche une seule fois dans le futur**

###  Cas : exécuter un script **dans 3 minutes**

####  Créer le script :

```bash
echo -e '#!/bin/bash\necho "Sauvegarde $(date)" >> backup.log' > sauvegarde.sh
chmod +x sauvegarde.sh
```

####  Planification avec `at` :

```bash
at now + 3 minutes
# (dans l'invite interactive `at>` :)
./sauvegarde.sh
<Ctrl + D>
```

➡️ Le script s’exécutera une **seule fois dans 3 minutes**.

---

###  Vérifier :
```bash
atq             # Liste des tâches planifiées
tail -f backup.log
```

---

##  **2. `cron` – Exécuter une tâche répétée (ex. toutes les heures)**

###  Cas : exécuter un script toutes les heures

####  Exemple de script :

```bash
echo -e '#!/bin/bash\necho "Script horaire lancé à $(date)" >> cron.log' > job_horaire.sh
chmod +x job_horaire.sh
```

####  Ajouter à `crontab` :
```bash
crontab -e
```

Ajoute :
```
0 * * * * /chemin/absolu/job_horaire.sh
```

➡️ Exécuté **à chaque heure pile**.

---

##  **3. Script toutes les 5 minutes avec contrôle de log**

###  Cas : vérifier une erreur régulièrement dans un log système

```bash
echo -e '#!/bin/bash\ngrep -i "error" /var/log/syslog >> erreur_detectee.log' > scan_erreurs.sh
chmod +x scan_erreurs.sh
```

#### Ajouter dans `crontab` :

```
*/5 * * * * /chemin/scan_erreurs.sh
```

➡️ Analyse régulière, journalisée.

---

##  **4. Nettoyage automatique à 2h du matin tous les dimanches**

###  Cas : suppression des fichiers temporaires `.tmp`

```bash
echo -e '#!/bin/bash\nfind /tmp -name "*.tmp" -delete' > nettoyeur_tmp.sh
chmod +x nettoyeur_tmp.sh
```

#### Crontab :
```
0 2 * * 0 /chemin/nettoyeur_tmp.sh
```

 Tâche hebdomadaire.

---

##  **5. Notification unique dans 1h avec `at` et `notify-send` (GUI)**

```bash
echo 'notify-send "Pause ! Il est temps de faire une pause ☕️"' | at now + 1 hour
```

 Notification pop-up si interface graphique.

---

##  **6. `at` avec sortie dans un fichier spécifique**

```bash
echo './job.sh > sortie.log 2>&1' | at now + 10 minutes
```

 Tu peux ensuite observer `sortie.log`.

---

##  **7. Planifier un reboot automatique (avec `at`)**

```bash
echo "sudo reboot" | at 3:30
```

 Demande les droits root (ou test avec `shutdown` ou un script fictif).

---

##  **8. Exporter, sauvegarder et restaurer une crontab**

###  Sauvegarder :
```bash
crontab -l > sauvegarde_cron.txt
```

###  Restaurer :
```bash
crontab sauvegarde_cron.txt
```

---

##  Bonus : Où vont les sorties ?

- Les sorties de `cron` et `at` vont dans **/var/mail/username** si non redirigées
- Tu peux aussi faire :
```bash
0 1 * * * /script.sh > /var/log/script.log 2>&1
```

