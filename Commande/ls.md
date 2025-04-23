## ✅ **Base de la commande `ls`**
Affiche la liste des fichiers et dossiers dans le répertoire courant.
```bash
ls
```

---

## 🔹 1. Afficher les fichiers **cachés**
```bash
ls -a
```
➡️ Affiche **tous les fichiers**, y compris ceux qui commencent par un `.` (comme `.bashrc`, `.git`, etc.).

---

## 🔹 2. Affichage **détaillé** (long format)
```bash
ls -l
```
➡️ Affiche :
- les **droits**,
- le **propriétaire**,
- la **taille**,
- la **date** de modification,
- le **nom** du fichier.

---

## 🔹 3. Trier par **taille décroissante**
```bash
ls -lS
```
➡️ Trie du plus gros fichier au plus petit.

---

## 🔹 4. Trier par **date de modification (récente)**
```bash
ls -lt
```
➡️ Le plus récemment modifié en premier.

---

## 🔹 5. Afficher les fichiers avec **taille lisible**
```bash
ls -lh
```
➡️ Affiche `5.2K` au lieu de `5312` pour plus de lisibilité.

---

## 🔹 6. Combiner plusieurs options utiles
```bash
ls -alh
```
➡️ Affichage **complet** : cachés, détaillé, taille lisible.

---

## 🔹 7. Affichage en **colonnes par date**
```bash
ls -lhtr
```
➡️ Affiche du **plus ancien au plus récent**, avec **taille lisible**.

---

## 🔹 8. N’afficher que les **répertoires**
```bash
ls -l | grep "^d"
```
➡️ Les lignes commençant par `d` sont des **dossiers**.

---

## 🔹 9. Afficher uniquement les **fichiers** (non-dossiers)
```bash
ls -p | grep -v /
```
➡️ Supprime les entrées avec `/` à la fin (= dossiers).

---

## 🔹 10. Coloriser la sortie
```bash
ls --color=auto
```
➡️ Active la **coloration syntaxique** : fichiers, répertoires, exécutables, liens...

---

## 🔹 11. Liste **récursive**
```bash
ls -R
```
➡️ Liste tous les sous-dossiers **récursivement**.

---

## 🔹 12. Liste dans un répertoire précis
```bash
ls /etc/nginx
```
➡️ Liste le contenu d’un dossier spécifique.

---

## 🔹 13. Fichiers triés par **extension**
```bash
ls -lX
```

---

## 🔹 14. Afficher les **inode numbers**
```bash
ls -i
```
➡️ Montre les identifiants uniques des fichiers sur le disque.

---

## 🔹 15. Suivre les liens symboliques
```bash
ls -l /etc/alternatives/java
```
➡️ Affiche la **cible** d’un lien symbolique.

---

## 🔹 16. Utiliser les **alias intelligents**
Ajoute dans ton `.bashrc` ou `.zshrc` :
```bash
alias ll='ls -alFh --color=auto'
alias la='ls -A'
alias l='ls -CF'
```

---

## 🔹 17. Fichiers avec caractères spéciaux ou invisibles
```bash
ls -b
```
➡️ Affiche les caractères spéciaux sous forme échappée (`\t`, `\n`, etc.).

---

## 🔹 18. Fichiers triés par **accès** (dernière lecture)
```bash
ls -lu
```

---

## 🔹 19. Affichage d’un seul fichier par ligne
```bash
ls -1
```

---

## 🔹 20. Fichiers avec leurs types affichés
```bash
ls -F
```
➡️ Ajoute :
- `/` pour les dossiers,
- `*` pour les exécutables,
- `@` pour les liens symboliques...

---

## 💥 Bonus : affichage des fichiers triés par date de **changement** (pas juste modif)
```bash
ls -lc
```
