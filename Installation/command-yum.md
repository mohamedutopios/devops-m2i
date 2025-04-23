## 📦 **1. Mise à jour du système**

| Commande | Description |
|----------|-------------|
| `sudo yum update` | Met à jour **tout le système** (paquets + dépendances) |
| `sudo yum upgrade` | Met à jour tout comme `update`, mais avec remplacement de paquets obsolètes |

---

## 🔍 **2. Recherche et informations sur les paquets**

| Commande | Description |
|----------|-------------|
| `yum search nom` | Recherche de paquets par nom ou description |
| `yum info nom_du_paquet` | Affiche les détails d’un paquet (version, repo, dépendances) |
| `yum list installed` | Liste tous les paquets installés |
| `yum list available` | Liste tous les paquets disponibles dans les dépôts |

---

## 📥 **3. Installation de paquets**

| Commande | Description |
|----------|-------------|
| `sudo yum install nom_du_paquet` | Installe un paquet |
| `sudo yum install nom1 nom2` | Installe plusieurs paquets |
| `sudo yum groupinstall \"Development Tools\"` | Installe un **groupe de paquets** (ex : outils de développement) |

---

## 🧹 **4. Suppression de paquets**

| Commande | Description |
|----------|-------------|
| `sudo yum remove nom_du_paquet` | Supprime un paquet |
| `sudo yum autoremove` | Supprime les dépendances devenues inutiles |

---

## ♻️ **5. Nettoyage & cache**

| Commande | Description |
|----------|-------------|
| `sudo yum clean all` | Vide tout le cache (`metadata`, `packages`, etc.) |
| `sudo yum makecache` | Reconstruit le cache local des dépôts |
| `sudo yum repolist` | Affiche les dépôts activés |

---

## 🔐 **6. Gestion des dépôts**

| Commande | Description |
|----------|-------------|
| `sudo yum-config-manager --disable nom_du_repo` | Désactive un dépôt |
| `sudo yum-config-manager --enable nom_du_repo` | Active un dépôt |
| `sudo yum repoinfo` | Affiche les infos détaillées des dépôts |

> 💡 Il faut installer `yum-utils` pour `yum-config-manager` :
```bash
sudo yum install -y yum-utils
```

---

## 📋 **7. Historique des actions**

| Commande | Description |
|----------|-------------|
| `yum history` | Affiche l’historique des actions (installations, suppressions) |
| `yum history info N` | Affiche les détails de l’action n°N |
| `yum history undo N` | Annule l’action N (si possible) |

---

## 🧪 Exemple : tout enchaîné

```bash
sudo yum update -y
sudo yum install -y git wget curl
yum search apache
yum info httpd
sudo yum install httpd
sudo systemctl enable httpd --now
```

