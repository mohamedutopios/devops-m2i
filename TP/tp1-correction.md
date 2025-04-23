#  TP – Utilisation du gestionnaire de paquets YUM


---

##  Étape 1 – Rechercher des paquets

1. Rechercher le paquet `nano` :
```bash
yum search nano
```

2. Rechercher tous les paquets liés à `python` :
```bash
yum search python
```

3. Afficher les détails du paquet `wget` :
```bash
yum info wget
```

---

##  Étape 2 – Installer des paquets

1. Installer `nano`, `curl` et `wget` :
```bash
sudo yum install -y nano curl wget
```

2. Tester `nano` avec un fichier :
```bash
nano test.txt
```

3. Installer `httpd` (serveur Apache) :
```bash
sudo yum install -y httpd
```

4. Démarrer Apache :
```bash
sudo systemctl enable httpd --now
```

5. Vérifier qu’il fonctionne :
```bash
curl localhost
```

---

##  Étape 3 – Mettre à jour le système

1. Mettre à jour tous les paquets :
```bash
sudo yum update -y
```

2. Mettre à jour uniquement `httpd` :
```bash
sudo yum update httpd
```

---

##  Étape 4 – Supprimer un paquet

1. Supprimer Apache :
```bash
sudo systemctl stop httpd
sudo yum remove -y httpd
```

2. Vérifier qu’il n’est plus là :
```bash
yum list installed | grep httpd
```

---

##  Étape 5 – Installer un **groupe de paquets**

1. Lister tous les groupes disponibles :
```bash
yum group list
```

2. Installer les outils de développement :
```bash
sudo yum groupinstall -y "Development Tools"
```

---

##  Étape 6 – Nettoyage système

1. Nettoyer les métadonnées et le cache :
```bash
sudo yum clean all
```

2. Supprimer les dépendances inutilisées :
```bash
sudo yum autoremove
```

---

##  Bonus – Historique

1. Afficher l’historique des actions :
```bash
yum history
```

2. Voir les détails d’une action :
```bash
yum history info 3
```



