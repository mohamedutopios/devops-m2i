##  Démonstration 1 : Ajout et partitionnement d’un nouveau disque virtuel

### 1. Ajout du disque sur VirtualBox :

- Éteins ta VM Ubuntu.
- Sur VirtualBox :
  - Sélectionne ta VM → Configuration → Stockage.
  - Ajoute un nouveau disque virtuel (ex : 10 Go).

### 2. Démarre la VM et vérifie la détection du disque :

```bash
sudo fdisk -l
lsblk
```

Tu devrais voir ton nouveau disque (`/dev/sdb` probablement).

---

### 3. Partitionnement manuel avec `fdisk` :

```bash
sudo fdisk /dev/sdb
```

- `n` → créer une partition
- Sélectionne `p` pour partition primaire
- Partition numéro : par défaut
- Secteur de début/fin : par défaut
- Tape `w` pour sauvegarder

Vérifie :

```bash
lsblk
```

---

##  Démonstration 2 : Formatage et montage du disque (ext4)

Formate la partition créée (`/dev/sdb1`) en ext4 :

```bash
sudo mkfs.ext4 /dev/sdb1
```

Monte temporairement pour tester :

```bash
sudo mkdir /mnt/demo
sudo mount /dev/sdb1 /mnt/demo
df -hT
```

Monte définitivement au démarrage en modifiant `/etc/fstab` :

```bash
UUID=$(sudo blkid -s UUID -o value /dev/sdb1)
echo "UUID=$UUID /mnt/demo ext4 defaults 0 2" | sudo tee -a /etc/fstab
```

Teste ton montage :

```bash
sudo umount /mnt/demo
sudo mount -a
df -hT
```

---

##  Démonstration 3 : Gestion des volumes logiques (LVM)

**Étapes :**

### 1. Installe les outils LVM :

```bash
sudo apt update
sudo apt install lvm2 -y
```

### 2. Préparation du disque pour LVM :

```bash
sudo pvcreate /dev/sdb1
sudo vgcreate vg_demo /dev/sdb1
sudo lvcreate -n lv_data -L 5G vg_demo
```

- `vg_demo` est un groupe de volume.
- `lv_data` est un volume logique de 5 Go.

Vérifie avec :

```bash
sudo vgs
sudo lvs
```

### 3. Formate et monte le volume logique :

```bash
sudo mkfs.ext4 /dev/vg_demo/lv_data
sudo mkdir /mnt/lvmdata
sudo mount /dev/vg_demo/lv_data /mnt/lvmdata
df -hT
```

Ajouter dans `/etc/fstab` pour montage automatique :

```bash
UUID=$(sudo blkid -s UUID -o value /dev/vg_demo/lv_data)
echo "UUID=$UUID /mnt/lvmdata ext4 defaults 0 2" | sudo tee -a /etc/fstab
```

Teste :

```bash
sudo umount /mnt/lvmdata
sudo mount -a
df -hT
```

---

##  Démonstration 4 : Extension dynamique d’un volume logique LVM

Imagine que l'espace manque dans ton volume logique. Voici comment l'étendre dynamiquement :

### 1. Vérifie la taille actuelle :

```bash
sudo lvs
```

### 2. Étendre le volume logique :

```bash
sudo lvextend -L +2G /dev/vg_demo/lv_data
```

### 3. Redimensionner le système de fichiers (online possible avec ext4) :

```bash
sudo resize2fs /dev/vg_demo/lv_data
df -hT
```

##  Démonstration 6 : Gestion et surveillance de l’espace disque

Commandes pratiques pour surveiller l'espace :

```bash
df -h          # Espace disponible
du -sh /*      # Taille des répertoires à la racine
sudo ncdu /    # Analyse interactive (installer via apt install ncdu)
```

Installe et utilise `ncdu` (outil interactif puissant) :

```bash
sudo apt install ncdu -y
sudo ncdu /
```

---

##  Démonstration 7 : Contrôle SMART des disques (pour la santé des disques)

Même sur une VM, tu peux installer et simuler avec `smartmontools` :

```bash
sudo apt install smartmontools -y
sudo smartctl -a /dev/sda
```



###  Synthèse des commandes utilisées fréquemment :

| Commande               | Description                                |
|------------------------|--------------------------------------------|
| `fdisk`, `parted`      | Créer/modifier des partitions              |
| `mkfs`                 | Formater des partitions                    |
| `mount`, `umount`      | Monter/démonter des systèmes de fichiers   |
| `blkid`                | Afficher UUID et autres infos              |
| `pvcreate`, `vgcreate`, `lvcreate` | Créer volumes physiques, groupes et logiques LVM |
| `lvextend`, `resize2fs`| Étendre dynamiquement les volumes logiques |
| `swapon`, `mkswap`     | Gérer l'espace swap                        |
| `df`, `du`, `ncdu`     | Contrôler l'espace disque                  |
| `smartctl`             | Vérifier l'état des disques physiques      |

