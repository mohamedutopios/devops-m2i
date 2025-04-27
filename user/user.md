## **1. Création de l'utilisateur avec toutes les options**

```bash
sudo useradd -m -d /home/alice -s /bin/bash -G sudo,developers alice
```

### Vérifier la création :
```bash
id alice
getent passwd alice
ls -ld /home/alice
```

---

## **2. Définir un mot de passe et forcer le changement au premier login**

```bash
sudo passwd alice
sudo chage -d 0 alice
```

---

## **3. Modifier les informations de l'utilisateur**

### Changer le nom d’utilisateur :
```bash
sudo usermod -l alicia alice
sudo usermod -d /home/alicia -m alicia
```

### Vérifier :
```bash
id alicia
ls -ld /home/alicia
```

---

## **4. Ajouter et retirer des groupes**

### Ajouter à un groupe :
```bash
sudo gpasswd -a alicia docker
```

### Retirer d’un groupe :
```bash
sudo gpasswd -d alicia developers
```

### Liste des groupes :
```bash
groups alicia
```

---

## **5. Verrouiller et déverrouiller le compte**

```bash
sudo usermod -L alicia
sudo usermod -U alicia
```

---

## **6. Forcer l'expiration du compte à une date précise**

```bash
sudo chage -E 2025-12-31 alicia
```

### Vérifier :
```bash
sudo chage -l alicia
```

---

## **7. Changer le shell par défaut**

```bash
sudo chsh -s /bin/zsh alicia
```

### Vérifier :
```bash
getent passwd alicia
```

---

## **8. Gérer les permissions du home**

```bash
sudo chown alicia:alicia /home/alicia
sudo chmod 700 /home/alicia
```

---

## **9. Afficher les infos de login et d'activité**

```bash
whoami
who
w
last alicia
lastlog | grep alicia
```

---

## **10. Supprimer l’utilisateur (avec ou sans le home)**

### Juste l’utilisateur :
```bash
sudo userdel alicia
```

### Utilisateur + home directory :
```bash
sudo userdel -r alicia
```

