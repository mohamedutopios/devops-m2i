## 🎓 **TP : Mise en place d’un mode sécurisé avec services et target**

### 🎯 **Objectif :**  
Créer une **target personnalisée** appelée `secure-mode.target` qui active automatiquement des services renforçant la sécurité du système lors d’une intervention sensible.

---

### 📋 **Contexte :**  
Lorsqu'une maintenance critique est prévue, l'administrateur doit pouvoir basculer le système en **mode sécurisé**. Ce mode doit désactiver certains accès, lancer des outils de surveillance, et afficher un message d'alerte.

Vous devez configurer ce mode avec des services dédiés regroupés dans une target.

---

### 🚀 **Services à créer :**

1️⃣ **Service : `firewall_reinforce.service`**  
➤ Active le pare-feu avec des règles strictes

---

2️⃣ **Service : `disconnect_users.service`**  
➤ Affiche un message "**Déconnexion des utilisateurs en cours...**" dans `/var/log/secure_mode.log` et force la déconnexion de tous les utilisateurs sauf root.

*(Utiliser la commande `pkill -KILL -u <username>` ou équivalent, mais sans entrer dans des scripts complexes.)*

---

3️⃣ **Service : `security_monitor.service`**  
➤ Lance l’outil `top` sur le terminal virtuel `tty6` pour surveiller les processus actifs.

---

### 4️⃣ **Créer la target `secure-mode.target` :**

- La target doit regrouper ces 3 services.
- Lorsqu'on active la target, tous les services doivent être lancés dans le bon ordre.
- La target doit dépendre de `basic.target`.

- Tester la bascule vers le mode sécurisé et vérifier les effets produits.
