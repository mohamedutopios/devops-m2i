#  Démonstration APT – Gestion des paquets sous Ubuntu

---

## 🔄 1. Mise à jour du système

```bash
# Met à jour la liste des paquets disponibles
sudo apt update

# Met à jour tous les paquets installés
sudo apt upgrade -y

# Mise à jour complète avec gestion des dépendances
sudo apt full-upgrade -y
```

---

## 🔍 2. Recherche de paquets

```bash
# Rechercher tous les paquets liés à nano
apt search nano

# Rechercher les paquets contenant le mot python
apt-cache search python

# Afficher les infos sur le paquet curl
apt show curl
```

---

## 📦 3. Installation de paquets

```bash
# Installer plusieurs paquets à la fois
sudo apt install -y nano curl wget

# Installer Apache (serveur web)
sudo apt install -y apache2
```

---

## 🔎 4. Vérification des services

```bash
# Vérifier que Apache est bien en cours d'exécution
sudo systemctl status apache2

# Tester que le serveur fonctionne
curl http://localhost
```

---

## 🧼 5. Suppression de paquets

```bash
# Supprimer Apache (conserve les fichiers de conf)
sudo apt remove -y apache2

# Supprimer complètement avec configuration
sudo apt purge -y apache2
```

---

## 🧹 6. Nettoyage

```bash
# Supprimer les dépendances inutiles
sudo apt autoremove -y

# Nettoyer le cache des paquets téléchargés
sudo apt clean
```

---

## 📋 7. Informations utiles

```bash
# Lister tous les paquets installés
dpkg -l

# Voir tous les fichiers installés par le paquet curl
dpkg -L curl

# Trouver le chemin d’un binaire
which curl
```


