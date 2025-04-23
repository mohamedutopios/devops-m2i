## ✅ **Base de la commande `mkdir`**
Créer un ou plusieurs répertoires.

```bash
mkdir nom_dossier
```

---

## 🔹 1. Créer un dossier simple
```bash
mkdir projet
```

---

## 🔹 2. Créer plusieurs dossiers à la fois
```bash
mkdir backend frontend database
```

---

## 🔹 3. Créer un **arbre complet** (arborescence imbriquée)
```bash
mkdir -p projet/src/components
```
➡️ Le `-p` permet de créer les répertoires parents **même s’ils n’existent pas**.

---

## 🔹 4. Nom de dossier avec des espaces
```bash
mkdir "Dossier Test"
# ou
mkdir Dossier\ Test
```

---

## 🔹 5. Créer un dossier avec le nom du jour automatiquement
```bash
mkdir "$(date +%Y-%m-%d)"
```
➡️ Ex : `mkdir 2025-04-23`

---

## 🔹 6. Créer un dossier avec un nom spécial (ex : `!`, `@`, etc.)
```bash
mkdir "rapport-final!"
```

---

## 🔹 7. Créer un dossier avec les droits personnalisés
```bash
mkdir -m 700 secret
```
➡️ Accès réservé au propriétaire uniquement.

---

## 🔹 8. Créer des dossiers avec boucle `for`
```bash
for i in {1..5}; do mkdir "chapitre$i"; done
```
➡️ Crée `chapitre1`, `chapitre2`, ..., `chapitre5`.

---

## 🔹 9. Vérifier l'existence avant de créer
```bash
[ ! -d logs ] && mkdir logs
```
➡️ Ne crée `logs` que s’il n’existe pas déjà.

---

## 🔹 10. Créer des dossiers dans d’autres chemins
```bash
mkdir /tmp/projet_demo
```

---

## 🔹 11. Créer un dossier vide temporaire (et le supprimer après test)
```bash
mkdir /tmp/testmkdir
# ... faire un test ...
rm -r /tmp/testmkdir
```

---

## 🔹 12. Erreur courante : dossier déjà existant sans `-p`
```bash
mkdir projet
# mkdir: impossible de créer le répertoire « projet »: Le fichier existe
```

---

## 🔹 13. Créer une structure pour un projet web
```bash
mkdir -p mysite/{css,js,images,html}
```
➡️ Crée :  
```
mysite/
├── css/
├── js/
├── images/
└── html/
```

---

## 🔹 14. Créer plusieurs dossiers avec noms d’un fichier
```bash
cat noms.txt | while read line; do mkdir "$line"; done
```
➡️ Chaque ligne devient un dossier (utile pour des scripts d’auto-setup de projets).

---

## 🔹 15. Créer une arborescence avec nom dynamique
```bash
mkdir -p "backup/$(date +%Y-%m-%d)/config"
```

---

## 🔹 16. Créer des dossiers pour des utilisateurs
```bash
for user in alice bob charlie; do mkdir "/home/$user"; done
```

---

## 🔹 17. Créer des sous-dossiers dans un script shell
```bash
#!/bin/bash
mkdir -p ~/projets/demo/{api,frontend,database}
```

---

## 🔹 18. Créer un dossier caché (commençant par un point)
```bash
mkdir .moncache
```

---

## 🔹 19. Créer et accéder immédiatement
```bash
mkdir dossier && cd dossier
```

---

## 🔹 20. Créer un dossier temporaire unique avec `mktemp`
```bash
mktemp -d /tmp/projetXXXXXX
```
➡️ Crée un dossier temporaire unique (idéal pour des tests ou des scripts CI/CD).

---

## 💡 Astuce Bonus : fonction `mkcd`
Ajoute dans ton `.bashrc` ou `.zshrc` :
```bash
mkcd() {
  mkdir -p "$1" && cd "$1"
}
```
➡️ Utilise `mkcd monapp` pour créer et entrer dans le dossier.

