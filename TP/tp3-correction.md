## 🔹 Partie 1 – Lecture simple



---



### 1. **Afficher tout le contenu de `short.txt`**

```bash

cat short.txt

```

➡️ Affiche tout d’un coup. Idéal pour fichiers très courts.



---



### 2. **Afficher `medium.txt` page par page**

```bash

more medium.txt

# ou

less medium.txt

```

➡️ `more` défile ligne par ligne ou page par page (`espace` pour avancer).  

➡️ `less` permet aussi de **revenir en arrière** (`b`) et de **rechercher** (`/`).



---



### 3. **Afficher les 10 premières lignes**

```bash

head medium.txt

# ou

head -n 10 medium.txt

```



---



### 4. **Afficher les 15 dernières lignes**

```bash

tail -n 15 medium.txt

```



---



### 5. **Afficher uniquement la 5e ligne**

```bash

sed -n '5p' medium.txt

# ou

head -n 5 medium.txt | tail -n 1

```



---



### 6. **Parcourir `long.txt` avec recherche possible**

```bash

less long.txt

```

➡️ Tu peux chercher un mot avec `/motif`, ex : `/erreur`, puis `n` pour suivant, `N` pour précédent.



---



## 🔹 Partie 2 – Analyse de journal



---



### 7. **Ouvrir `journal.log` et naviguer**

```bash

less journal.log

```



**Actions dans `less`** :

- `G` → aller à la fin  

- `20k` ou `↑` répété → remonter de 20 lignes  

- `/\[ERROR\]` → chercher les erreurs (regex échappée)  



---



### 8. **Afficher les 50 dernières lignes**

```bash

tail -n 50 journal.log

```



---



### 9. **Rechercher dynamiquement `[DEBUG]`**

```bash

less journal.log

# puis dans l’interface :

/\[DEBUG\]

```



---



## 🔹 Partie 3 – Fichiers compressés



---



### 10. **Lire un fichier `.gz` sans décompression**

```bash

zless long.txt.gz

# ou

zcat long.txt.gz | less

```



---



### 11. **Rechercher dans un fichier `.gz`**

```bash

zgrep "erreur" long.txt.gz

# ou

zcat long.txt.gz | grep "erreur"

```



---



## 🧠 Partie 4 – Réflexion



---



### 12. **Différence entre `cat`/`head`/`tail` et `less`/`more`**



- `cat`, `head`, `tail` → **affichent directement** à l’écran (pas pratique pour gros fichiers)

- `less`, `more` → **affichent par page** avec navigation possible



---



### 13. **Afficher 1000 lignes avec `cat`**



```bash

cat long.txt

```

➡️ Affiche tout **sans pause** → difficilement lisible.  

Préférer `less long.txt`.



---



### 14. **Afficher la ligne la plus longue**

```bash

awk '{ if (length > max) { max = length; line = $0 } } END { print line }' long.txt

```

➡️ Affiche la **ligne ayant la plus grande longueur**.



https://mohamed-formation.s3.eu-west-3.amazonaws.com/script_tp2.sh