# ✅ `touch` – Créer des fichiers (et modifier leurs dates)

---

## 🔹 1. Créer un fichier vide
```bash
touch fichier.txt
```

---

## 🔹 2. Créer plusieurs fichiers d’un coup
```bash
touch fichier1.txt fichier2.txt fichier3.txt
```

---

## 🔹 3. Ne **pas modifier la date** si le fichier existe
```bash
touch -c fichier.txt
```

---

## 🔹 4. Changer la date de modification (mtime)
```bash
touch -m fichier.txt
```

---

## 🔹 5. Changer la date d’accès (atime)
```bash
touch -a fichier.txt
```

---

## 🔹 6. Spécifier une date personnalisée
```bash
touch -t 202504231200 fichier.txt
```
➡️ Modifie le fichier comme s’il avait été modifié le 23 avril 2025 à 12h00.

---

## 🔹 7. Utiliser la date d’un autre fichier
```bash
touch -r modele.txt fichier.txt
```
➡️ Copie les dates d’un fichier existant.

---

## 🔹 8. Créer un fichier dans un chemin avec `/`
```bash
touch dossier/fichier.log
```
➡️ Erreur si le dossier n’existe pas !

---

## 🔹 9. Créer un fichier caché
```bash
touch .config_temp
```

---

## 🔹 10. Créer un fichier avec le nom de la date du jour
```bash
touch "rapport_$(date +%F).txt"
```

---

# ✅ `echo` – Afficher ou écrire du texte

---

## 🔹 11. Afficher un message simple
```bash
echo "Hello World"
```

---

## 🔹 12. Afficher la valeur d’une variable
```bash
nom="Alice"
echo "Bonjour $nom"
```

---

## 🔹 13. Écrire dans un fichier (écrase le contenu)
```bash
echo "Ceci est une ligne." > fichier.txt
```

---

## 🔹 14. Ajouter à un fichier (sans écraser)
```bash
echo "Nouvelle ligne" >> fichier.txt
```

---

## 🔹 15. Ajouter plusieurs lignes (avec `echo` et `>>`)
```bash
echo "Ligne 1" >> fichier.txt
echo "Ligne 2" >> fichier.txt
```

---

## 🔹 16. Échapper des caractères spéciaux
```bash
echo "Il a dit : \"Bonjour\""
```

---

## 🔹 17. Afficher une variable entre apostrophes
```bash
echo 'Utilisateur : $USER'
```
➡️ Ne sera **pas interprété** (`$USER` affiché tel quel)

---

## 🔹 18. Ajouter des tabulations et sauts de ligne
```bash
echo -e "Nom:\tAlice\nAge:\t30"
```
➡️ `-e` permet d’interpréter `\t`, `\n`, etc.

---

## 🔹 19. Créer un fichier de config simple
```bash
echo "DB_HOST=localhost" >> .env
echo "DB_PORT=5432" >> .env
```

---

## 🔹 20. Écrire tout un bloc multi-ligne (heredoc)
```bash
cat <<EOF > config.txt
# Configuration
host=127.0.0.1
port=8080
EOF
```

---

# 🎯 Exemples combinés `touch` + `echo`

---

## 📄 Créer un fichier et écrire dedans
```bash
touch log.txt
echo "Début du log : $(date)" > log.txt
```

---

## 🔁 Générer 10 fichiers avec contenu
```bash
for i in {1..10}; do
  touch "file$i.txt"
  echo "Fichier numéro $i" > "file$i.txt"
done
```

