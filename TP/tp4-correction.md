###  Partie 1 – Exploration et recherche



1. **Rechercher un mot exact dans tous les fichiers du répertoire :**



```bash

grep -r "ERROR" grep_find_pipe_tp/

```



2. **Rechercher tous les fichiers `.log` contenant un mot-clé donné :**



```bash

grep -l "WARNING" grep_find_pipe_tp/logs/*.log

```



3. **Rechercher les fichiers qui ne contiennent pas un certain mot :**



```bash

grep -L "SUCCESS" grep_find_pipe_tp/logs/*.log

```



4. **Recherche récursive d'une expression (login|logout|failed) :**



```bash

grep -rE "login|logout|failed" grep_find_pipe_tp/

```



---



### 🔎 Partie 2 – Statistiques avec pipes



5. **Compter les occurrences du mot `error` (insensible à la casse) :**



```bash

grep -ri "error" grep_find_pipe_tp/ | wc -l

```



6. **Afficher les mots les plus fréquents dans les fichiers `.txt` :**



```bash

cat grep_find_pipe_tp/archives/*.txt | tr ' ' '\n' | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head

```



7. **Extraire une colonne CSV et compter les occurrences des rôles :**



```bash

cut -d',' -f3 grep_find_pipe_tp/data/users.csv | tail -n +2 | sort | uniq -c

```



8. **Afficher les 5 fichiers contenant le plus d’occurrences du mot `token` :**



```bash

grep -ril "token" grep_find_pipe_tp/ | xargs -I{} sh -c "grep -io 'token' {} | wc -l | xargs echo {}" | sort -k1 -nr | head -n 5

```



---



### 🧹 Partie 3 – Filtres avancés avec `find`



9. **Fichiers modifiés il y a moins de 2 jours :**



```bash

find grep_find_pipe_tp/ -type f -mtime -2

```



10. **Supprimer tous les fichiers `.tmp` :**



```bash

find grep_find_pipe_tp/ -name "*.tmp" -type f -delete

```



11. **Rechercher tous les fichiers de plus de 100 octets :**



```bash

find grep_find_pipe_tp/ -type f -size +100c

```



12. **Rechercher un mot-clé ligne par ligne dans les `.conf` :**



```bash

grep -inE "admin|password" grep_find_pipe_tp/configs/*.conf

```



---



### 💥 Partie 4 – Bonus combiné



13. **Lister les mots les plus présents dans les fichiers modifiés récemment de plus de 1 Ko :**



```bash

find grep_find_pipe_tp/ -type f -size +1k -mtime -7 -exec cat {} + | tr ' ' '\n' | tr -d '[:punct:]' | sort | uniq -c | sort -nr | head

```



14. **Trouver dans tous les fichiers `.log` les lignes contenant des adresses IP :**



```bash

grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' grep_find_pipe_tp/logs/*.log

```



15. **Rechercher un mot dans les fichiers modifiés aujourd’hui :**



```bash

find grep_find_pipe_tp/ -type f -daystart -mtime 0 -exec grep -i "admin" {} +

```
