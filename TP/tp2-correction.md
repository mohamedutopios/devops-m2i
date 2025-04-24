## 🟦 Partie 1 – Structure de projet


```bash

mkdir workspace

cd workspace



mkdir projet1 projet2 archives temporaire



cd projet1

mkdir -p code/scripts

mkdir documents

```



---



## 🟦 Partie 2 – Création et modification de fichiers



```bash

cd documents

touch infos.txt historique.txt



cd ../code

touch main.sh module1.sh module2.sh



echo "# Auteur : Alice | Date : $(date +%F) | TP : Manipulation shell" > main.sh



echo "2025-04-01 : Création du projet" > ../documents/historique.txt

echo "2025-04-15 : Ajout des modules" >> ../documents/historique.txt

echo "2025-04-22 : Revue finale" >> ../documents/historique.txt



cd scripts

touch temp.tmp

```



---



## 🟦 Partie 3 – Copies et déplacements



```bash

cd ~/workspace

cp -r projet1/code projet2/



mv projet1/code/scripts/temp.tmp temporaire/temp.tmp

mv temporaire/temp.tmp temporaire/temp_backup.tmp



cp -n projet1/documents/infos.txt archives/



mv projet1/documents/historique.txt projet2/documents/historique_projet1.txt

```



---



## 🟦 Partie 4 – Suppressions et nettoyage



```bash

rm projet1/code/scripts/*



rm -rf temporaire



rm -f projet2/code/main.sh



find . -type d -empty -delete

```



💡 `find . -type d -empty -delete` : supprime **uniquement** les dossiers vides.



---



## 🟦 Partie 5 – Manipulations diverses



```bash

cd projet1

echo "Log créé le : $(date)" > log.txt



echo "Deuxième ligne ajoutée" >> log.txt

echo "Troisième ligne ajoutée" >> log.txt



mv log.txt log_$(date +%Y%m%d).txt

```



---



## 🌟 Bonus (facultatif)



```bash

cd ~/workspace

mkdir .cache



echo "Ce fichier est secret." > .cache/alice.txt

```