# ✅ `cp` – Copier des fichiers ou dossiers

---

## 🔹 1. Copier un fichier simple
```bash
cp fichier.txt copie.txt
```
➡️ Crée une **copie exacte** de `fichier.txt` dans `copie.txt`.

---

## 🔹 2. Copier plusieurs fichiers dans un dossier
```bash
cp fichier1.txt fichier2.txt dossier/
```

---

## 🔹 3. Copier un dossier **avec tout son contenu**
```bash
cp -r dossier1 dossier2
```
➡️ `-r` (ou `--recursive`) : copie récursivement tout le dossier.

---

## 🔹 4. Copier avec confirmation (mode interactif)
```bash
cp -i fichier.txt destination.txt
```
➡️ Demande si tu veux écraser un fichier existant.

---

## 🔹 5. Copier en **préservant les droits, timestamps, etc.**
```bash
cp -p fichier.txt backup.txt
```

---

## 🔹 6. Copier récursivement avec préservation complète
```bash
cp -a mon_projet/ mon_projet_backup/
```
➡️ `-a` = archive (équivalent à `-dR --preserve=all`)

---

## 🔹 7. Copier tout sauf certains fichiers (exclusion avec `rsync`)
```bash
rsync -av --exclude='*.log' source/ dest/
```

---

## 🔹 8. Copier un fichier avec espaces
```bash
cp "rapport final.txt" "copie rapport.txt"
```

---

## 🔹 9. Copier dans `/tmp` avec date
```bash
cp -r projet "/tmp/projet-$(date +%F)"
```

---

## 🔹 10. Copier tous les fichiers d'un type (ex: `.csv`)
```bash
cp *.csv /home/user/data/
```

---

# ✅ `mv` – Déplacer ou renommer fichiers/dossiers

---

## 🔹 11. Renommer un fichier
```bash
mv ancien.txt nouveau.txt
```

---

## 🔹 12. Renommer un dossier
```bash
mv ancien_dossier/ nouveau_dossier/
```

---

## 🔹 13. Déplacer un fichier dans un dossier
```bash
mv monscript.sh ~/bin/
```

---

## 🔹 14. Déplacer plusieurs fichiers dans un répertoire
```bash
mv *.jpg images/
```

---

## 🔹 15. Déplacement interactif
```bash
mv -i fichier.txt sauvegarde/
```
➡️ Demande confirmation si le fichier cible existe.

---

## 🔹 16. Déplacement avec forçage (pas d'erreur si fichier cible)
```bash
mv -f notes.txt backup/
```

---

## 🔹 17. Déplacer tout sauf certains fichiers (exclusion via `rsync --remove-source-files`)
```bash
rsync -av --exclude='*.bak' --remove-source-files ./ source/ dest/
```

---

## 🔹 18. Déplacement conditionnel (si destination existe pas)
```bash
[ ! -e cible.txt ] && mv source.txt cible.txt
```

---

## 🔹 19. Script de renommage en masse (ex : ajouter un préfixe)
```bash
for f in *.txt; do mv "$f" "2025_$f"; done
```

---

## 🔹 20. Déplacer avec suivi de progression (option avec `rsync`)
```bash
rsync -av --progress source/ dest/
```

