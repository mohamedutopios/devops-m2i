### 💡 **Rappel de base**
`cd` signifie "change directory" (changer de répertoire).

---

## 🔹 1. Aller dans un répertoire simple
```bash
cd Documents
```
➡️ Change vers le dossier `Documents` situé dans le répertoire courant.

---

## 🔹 2. Aller dans un répertoire avec chemin absolu
```bash
cd /etc/nginx
```
➡️ Va directement dans `/etc/nginx`, quel que soit l'endroit où l'on se trouve.

---

## 🔹 3. Aller dans le répertoire parent
```bash
cd ..
```
➡️ Remonte d'un niveau (répertoire parent).

---

## 🔹 4. Aller deux niveaux plus haut
```bash
cd ../..
```
➡️ Remonte de deux niveaux.

---

## 🔹 5. Aller dans le répertoire personnel
```bash
cd ~
# ou simplement
cd
```
➡️ Va dans le home de l’utilisateur (ex. `/home/mohamed` ou `/Users/mohamed`).

---

## 🔹 6. Aller dans le dernier dossier visité
```bash
cd -
```
➡️ Revient au répertoire **précédent**. Très utile pour alterner entre deux dossiers.

---

## 🔹 7. Aller dans un dossier avec un espace dans le nom
```bash
cd "Mon Dossier"
# ou
cd Mon\ Dossier
```
➡️ Nécessite des guillemets ou un `\` pour échapper l’espace.

---

## 🔹 8. Utiliser une variable d’environnement
```bash
cd $HOME/projects
```
➡️ Utilise la variable d’environnement `HOME` pour aller dans `~/projects`.

---

## 🔹 9. Utiliser l’autocomplétion avec la touche TAB
```bash
cd Doc[TAB]
```
➡️ Autocomplète vers `Documents` (si c’est unique).

---

## 🔹 10. Chemins relatifs complexes
Supposons que vous êtes dans :
```
/home/user/projets/app/frontend
```
Et que vous voulez aller à :
```
/home/user/projets/utils/scripts
```
```bash
cd ../../utils/scripts
```

---

## 🔹 11. Astuce avec `pushd` et `popd` (pile de navigation)
```bash
pushd /etc
# fait un cd vers /etc et garde l'ancien dans une pile
popd
# revient à l’ancien répertoire
```

---

## 🔹 12. Cas d’erreur : dossier inexistant
```bash
cd dossier-inexistant
# bash: cd: dossier-inexistant: Aucun fichier ou dossier de ce type
```

---

## 🔹 13. Aller dans un répertoire avec des caractères spéciaux
```bash
cd 'nom[1]'
# ou
cd nom\[1\]
```

---

## 🔹 14. Créer et aller dans un dossier
```bash
mkdir -p /tmp/demo/test
cd /tmp/demo/test
```

---

## 🔹 15. Créer une fonction `cdl` : `cd` puis `ls`
Ajoute ça à ton `.bashrc` ou `.zshrc` :
```bash
cdl() {
  cd "$1" && ls -alh
}
```
➡️ Tape `cdl Documents` pour y aller et lister directement.

---

## 🔹 16. Astuce Zsh : historique de navigation
Zsh garde en mémoire les derniers dossiers :
```bash
cd -[tab]
```
➡️ Liste tous les dossiers précédemment visités.

