### **TP : Configuration des logs pour NGINX**

---

#### **1. Installation de NGINX**

1. Vérifiez si NGINX est installé sur votre machine avec la commande :
   ```bash
   nginx -v
   ```
2. Si NGINX n'est pas installé, installez-le en exécutant :
   ```bash
   sudo apt update
   sudo apt install nginx
   ```

---

#### **2. Vérification des logs par défaut**

1. Par défaut, NGINX enregistre ses logs dans les fichiers suivants :
   - Logs d'accès : `/var/log/nginx/access.log`
   - Logs d'erreur : `/var/log/nginx/error.log`

2. Vérifiez les derniers événements dans le fichier des logs d'accès :
   ```bash
   sudo tail -f /var/log/nginx/access.log
   ```

3. Vérifiez les derniers événements dans le fichier des logs d'erreur :
   ```bash
   sudo tail -f /var/log/nginx/error.log
   ```

---

#### **3. Personnalisation du format des logs**

1. Ouvrez le fichier de configuration principal de NGINX situé à `/etc/nginx/nginx.conf` :
   ```bash
   sudo nano /etc/nginx/nginx.conf
   ```

2. Dans la section `http {}`, personnalisez le format des logs d'accès en ajoutant la directive `log_format`. Par exemple, pour personnaliser le format, vous pouvez utiliser ce modèle :
   ```nginx
   log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                 '$status $body_bytes_sent "$http_referer" '
                 '"$http_user_agent" "$http_x_forwarded_for" '
                 'Request_Time: $request_time';
   ```

3. Modifiez ensuite la directive `access_log` pour utiliser ce format. Ajoutez ou modifiez la ligne suivante :
   ```nginx
   access_log /var/log/nginx/access.log main;
   ```

4. Sauvegardez les modifications et fermez le fichier.

---

#### **4. Redémarrer NGINX**

1. Après avoir effectué les modifications, redémarrez NGINX pour appliquer les changements :
   ```bash
   sudo systemctl restart nginx
   ```

2. Vérifiez que NGINX fonctionne correctement après le redémarrage :
   ```bash
   sudo systemctl status nginx
   ```

---

#### **5. Tester la configuration des logs**

1. Effectuez quelques requêtes HTTP vers votre serveur NGINX pour générer des logs d'accès. Vous pouvez utiliser `curl` pour cela :
   ```bash
   curl http://localhost
   ```

2. Vérifiez que les requêtes sont bien enregistrées dans le fichier des logs d'accès `/var/log/nginx/access.log` avec le format que vous avez défini :
   ```bash
   sudo tail -f /var/log/nginx/access.log
   ```

3. Vérifiez également les logs d'erreur pour vous assurer qu'aucune erreur n'est enregistrée dans `/var/log/nginx/error.log` :
   ```bash
   sudo tail -f /var/log/nginx/error.log
   ```

---

#### **6. Rotation des logs avec `logrotate`**

1. Vérifiez la configuration actuelle de `logrotate` pour NGINX. Le fichier de configuration par défaut de `logrotate` pour NGINX se trouve dans `/etc/logrotate.d/nginx`. Ouvrez-le pour le modifier si nécessaire :
   ```bash
   sudo nano /etc/logrotate.d/nginx
   ```

2. La configuration de rotation des logs pour NGINX devrait ressembler à ceci :
   ```bash
   /var/log/nginx/*.log {
       weekly          # Rotation des logs toutes les semaines
       rotate 4         # Conserver les 4 derniers fichiers de logs
       compress         # Compresser les anciens fichiers de logs
       delaycompress    # Compresser les fichiers de logs après la première rotation
       missingok        # Ne pas générer d'erreur si un fichier de log est manquant
       notifempty       # Ne pas effectuer la rotation si le fichier de log est vide
       create 640 root adm   # Créer les nouveaux fichiers de logs avec ces permissions
   }
   ```

3. Sauvegardez et fermez le fichier.

---

#### **7. Tester la rotation des logs**

1. Forcez la rotation des logs à l'aide de la commande suivante pour tester si la rotation fonctionne correctement :
   ```bash
   sudo logrotate /etc/logrotate.conf --debug
   ```

2. Vérifiez que les anciens fichiers de logs sont bien archivés (compressés) et que de nouveaux fichiers de logs sont créés dans `/var/log/nginx/`.

---

#### **8. Analyser les logs**

1. Utilisez `grep` pour rechercher des erreurs dans les logs d'erreur :
   ```bash
   sudo grep "error" /var/log/nginx/error.log
   ```

2. Utilisez `awk` pour analyser les logs d'accès. Par exemple, pour afficher le nombre de requêtes par adresse IP dans les logs d'accès, exécutez :
   ```bash
   sudo awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr
   ```

3. Utilisez d'autres outils comme `sed` ou `cut` pour extraire des informations spécifiques des logs si nécessaire.

---

**Ressources supplémentaires** :
- Documentation officielle de [NGINX](https://nginx.org/en/docs/)
- Manuel de [logrotate](https://linux.die.net/man/8/logrotate)
