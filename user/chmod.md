## 🔧 **1. Préparation : Création des utilisateurs**
```bash
sudo useradd -m -s /bin/bash alice
sudo useradd -m -s /bin/bash bob

echo "alice:Alice123!" | sudo chpasswd
echo "bob:Bob123!" | sudo chpasswd
```

---

## 📁 **2. Connexion en tant qu’alice et création de fichiers**

```bash
sudo su - alice
mkdir ~/demo
cd ~/demo
touch secret.txt public.txt script.sh
```

---

## 🧪 **3. Vérification initiale**
```bash
ls -l
```
Tu verras probablement :
```
-rw-r--r-- 1 alice alice 0 date secret.txt
```

---

## 🔐 **4. Changer les permissions avec `chmod`**

### ▪️ Lecture seule pour tout le monde :
```bash
chmod 444 public.txt
```

### ▪️ Lecture/écriture pour le proprio uniquement :
```bash
chmod 600 secret.txt
```

### ▪️ Exécutable pour tous :
```bash
chmod 755 script.sh
```

### ▪️ Retirer l’accès aux autres :
```bash
chmod o-rwx secret.txt
```

### ▪️ Ajouter l’écriture pour le groupe :
```bash
chmod g+w script.sh
```

---

## 🧮 **5. Même permissions, version octale**

| rwx | Valeur |
|-----|--------|
| r-- | 4      |
| -w- | 2      |
| --x | 1      |

Exemples :
```bash
chmod 700 fichier1     # proprio: rwx, groupe+autres: rien
chmod 644 fichier2     # proprio: rw-, groupe: r--, autres: r--
chmod 751 script.sh    # proprio: rwx, groupe: r-x, autres: --x
```

---

## 🔁 **6. Changer les permissions d’un dossier récursivement**

```bash
chmod -R 700 ~/demo
```

---

## 👥 **7. Tester avec l’autre utilisateur**

Ouvre un second terminal :

```bash
sudo su - bob
cd /home/alice/demo
cat public.txt        # OK si chmod le permet
cat secret.txt        # Devrait échouer si 600
./script.sh           # OK si chmod 755
```

---

## 👑 **8. Bonus : cas concret avec partage**

### 🔸 Créer un groupe partagé :
```bash
sudo groupadd partage
sudo usermod -aG partage alice
sudo usermod -aG partage bob
```

### 🔸 Créer un dossier partagé :
```bash
sudo mkdir -p /srv/partage
sudo chown alice:partage /srv/partage
sudo chmod 2770 /srv/partage
```
