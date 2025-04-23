# 🔥 `rmdir` – Supprimer un **répertoire vide**

---

## 🔹 1. Supprimer un dossier vide
```bash
rmdir dossier_vide
```

---

## 🔹 2. Supprimer plusieurs dossiers vides à la suite
```bash
rmdir test1 test2 test3
```

---

## 🔹 3. Supprimer une arborescence vide
```bash
mkdir -p test/a/b/c
rmdir test/a/b/c test/a/b test/a test
```
➡️ Pas de `-p`, donc il faut supprimer **chaque niveau** manuellement.

---

## 🔹 4. Supprimer récursivement une hiérarchie vide (avec `--parents`)
```bash
rmdir --parents test/a/b/c
```
➡️ Supprime `c`, puis `b`, puis `a`, puis `test`, **tant qu’ils sont vides**.

---

## ⚠️ `rmdir` ne peut **pas supprimer** un dossier contenant des fichiers !

---

# 🔥 `rm` – Supprimer **fichiers et dossiers** (attention ⚠️)

---

## ✅ Suppression de fichiers

---

## 🔹 5. Supprimer un fichier simple
```bash
rm fichier.txt
```

---

## 🔹 6. Supprimer plusieurs fichiers
```bash
rm fichier1.txt fichier2.txt
```

---

## 🔹 7. Supprimer tous les `.log` d’un dossier
```bash
rm *.log
```

---

## 🔹 8. Supprimer un fichier avec confirmation
```bash
rm -i fichier.conf
```
➡️ Demande confirmation avant suppression.

---

## 🔹 9. Supprimer **sans erreur** si le fichier n’existe pas
```bash
rm -f fichier_inexistant.txt
```

---

## 🔹 10. Supprimer un fichier avec nom contenant des espaces
```bash
rm "rapport final.txt"
```

---

## ✅ Suppression de dossiers avec `rm -r`

---

## 🔹 11. Supprimer un dossier et son contenu
```bash
rm -r dossier
```

---

## 🔹 12. Supprimer un dossier sans message d’erreur
```bash
rm -rf dossier
```
➡️ `-f` : force, `-r` : récursif → **⚠️ Supprime tout sans poser de question !**

---

## 🔹 13. Supprimer tous les fichiers d’un répertoire sans supprimer le dossier
```bash
rm dossier/*
```

---

## 🔹 14. Supprimer tous les fichiers, y compris les fichiers cachés
```bash
rm -rf dossier/{*,.*}
```
⚠️ À utiliser avec précaution – `.` et `..` ne sont pas supprimés, mais c’est une commande **dangereuse si mal tapée**.

---

## 🔹 15. Supprimer des dossiers listés dans un fichier
```bash
cat liste_dossiers.txt | while read line; do rm -rf "$line"; done
```

---

## 🔹 16. Suppression avec `find`
Exemple : supprimer tous les `.tmp` vieux de plus de 7 jours
```bash
find . -name "*.tmp" -type f -mtime +7 -exec rm {} \;
```

---

## 🔹 17. Confirmation pour chaque fichier
```bash
rm -ri dossier
```

---

## 🔹 18. Suppression avec wildcard (joker)
```bash
rm docu{1,2,3}.txt
# supprime docu1.txt, docu2.txt, docu3.txt
```

---

## 🔹 19. Suppression sécurisée avec `shred` (sur certains systèmes)
```bash
shred -u fichier_secret.txt
```
➡️ Écrase les données avant suppression, utile pour les fichiers sensibles.

---

## 🔹 20. Supprimer tout dans un dossier temporaire
```bash
rm -rf /tmp/*
```
⚠️ À ne pas exécuter à la racine ou ailleurs sans certitude !

---

# 💡 Bonus : Astuce "corbeille" manuelle

Au lieu de supprimer :
```bash
mv fichier.txt ~/.trash/
```
Puis on peut vider la corbeille avec :
```bash
rm -rf ~/.trash/*
```

