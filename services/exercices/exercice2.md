### 🎓 **Exercice 2**

### 📋 **Consignes :**

1️⃣ Installer une application permettant de lancer un serveur web simple.

2️⃣ Créer le dossier `/srv/web` et y placer une page `index.html` avec un message personnalisé.

3️⃣ Créer un service systemd appelé `web_local.service` qui :
- Démarre automatiquement le serveur web sur le port 8080 en servant les fichiers du dossier `/srv/web`.
- Permet de démarrer, arrêter et vérifier le statut du serveur.
- Active le service au démarrage du système.

4️⃣ Tester le bon fonctionnement en accédant à `http://localhost:8080` avec `curl`.
