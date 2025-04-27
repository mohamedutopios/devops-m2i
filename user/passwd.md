### **1. Création complète de l’utilisateur avec mot de passe immédiat**
```bash
sudo useradd -m -s /bin/bash alice
echo "alice:SuperPassword2025!" | sudo chpasswd
```

### Vérifie que le mot de passe a bien été appliqué :
```bash
sudo su - alice
```

---

### **2. Verrouiller et déverrouiller le mot de passe**
```bash
# Verrouille le mot de passe (bloque les connexions avec mot de passe)
sudo passwd -l alice

# Déverrouille le mot de passe
sudo passwd -u alice
```

---

### **3. Forcer le changement de mot de passe au prochain login**
```bash
sudo chage -d 0 alice
```

---

### **4. Définir une politique de mot de passe stricte**
```bash
# Mot de passe valide 30 jours
sudo chage -M 30 alice

# Prévenir l'utilisateur 7 jours avant l'expiration
sudo chage -W 7 alice

# Interdire de changer le mot de passe pendant les 2 premiers jours
sudo chage -m 2 alice

# Durée d'inactivité avant désactivation complète : 5 jours
sudo chage -I 5 alice
```

### Vérifier la politique :
```bash
sudo chage -l alice
```

---

### **5. Expirer un compte utilisateur à une date précise**
```bash
sudo chage -E 2025-12-31 alice
```

---

### **6. Vérifier les logs liés au mot de passe et à l’authentification**
```bash
# Dernière connexion de tous les users
lastlog

# Échecs d’authentification (si faillog activé)
sudo faillog -u alice

# Logs SSH
sudo journalctl -u sshd | grep alice
```

---

### **7. Supprimer le mot de passe d’un utilisateur (authentification désactivée)**
```bash
sudo passwd -d alice
```

### (Cela rend le compte inutilisable via login standard)

---

### **8. Réinitialiser proprement le mot de passe avec un délai d’expiration**
```bash
sudo passwd alice
sudo chage -M 90 alice
```