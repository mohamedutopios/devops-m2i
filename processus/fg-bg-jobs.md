## 🔹 1. 🎯 Lancer un serveur de développement web (Python) en arrière-plan (`&`)

### ⚙️ Ce qu’il faut :
Un répertoire avec un fichier HTML (ex. `index.html`)

```bash
mkdir site_demo
echo "<h1>Bienvenue</h1>" > site_demo/index.html
```

### 💬 Démo :
```bash
cd site_demo
python3 -m http.server 8080 &
```

➡️ Navigue sur `http://localhost:8080`

### 🧪 Tu peux :
- faire `jobs`, `fg`, `bg`
- le tuer avec `kill %1`
- tester que le serveur reste dispo

---

## 🔹 2. 🎯 Surveiller un log système avec `tail -f &`

### ⚙️ Ce qu’il faut :
Un fichier de log actif (`/var/log/syslog` ou `/var/log/auth.log`)

```bash
tail -f /var/log/syslog &
```

➡️ Garde le terminal libre tout en suivant le log.

### 🧪 Tu peux :
- taper autre chose pendant que le `tail` tourne
- tester `jobs`, `fg`, `bg`, `kill %1`
- générer une ligne dans le log (`sudo systemctl restart ssh`)

---

## 🔹 3. 🎯 Lancer un processus suspendable interactif (`top`, `htop`)

### ⚙️ Ce qu’il faut :
Juste le terminal, et `htop` installé (`sudo apt install htop`)

```bash
htop
# puis Ctrl+Z
bg
# continue à tourner
jobs
fg
```

➡️ Tu contrôles l’état en direct

---

## 🔹 4. 🎯 Lancer un script qui écrit dans un fichier (`nohup`)

### ⚙️ Ce qu’il faut :
Un petit script

```bash
echo -e '#!/bin/bash\nwhile true; do echo "$(date)" >> date.log; sleep 1; done' > logdate.sh
chmod +x logdate.sh
```

### 💬 Démo :
```bash
nohup ./logdate.sh > output.log 2>&1 &
```

➡️ Le script écrit dans `date.log` chaque seconde, même si tu quittes le terminal.

### 🧪 Tu peux :
- voir les fichiers (`tail -f date.log`)
- tester `ps aux | grep logdate`
- tuer avec `kill $(pgrep -f logdate)`

---

## 🔹 5. 🎯 Compiler un projet (ou simuler) avec `sleep` et `Ctrl+Z`

### ⚙️ Ce qu’il faut :
Un projet, ou simulateur via `sleep`

```bash
sleep 120
```
→ `Ctrl+Z`  
→ `bg` ou `fg`

➡️ Simule un build, permet de montrer la gestion de job.

---

## 🔹 6. 🎯 Lancer `gedit` ou `firefox` en arrière-plan (vrai GUI)

### ⚙️ Ce qu’il faut :
Gedit installé et une interface graphique active

```bash
gedit &
```

➡️ Le terminal reste disponible.

### 🧪 Tu peux :
- le relancer en `fg %1`
- le fermer manuellement
- observer que le shell ne bloque pas
