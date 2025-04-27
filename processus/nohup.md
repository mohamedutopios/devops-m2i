## 🔹 1. 🎯 Exécuter un script en arrière-plan qui **écrit en boucle**

### ⚙️ Ce qu’il faut :
Un simple script Bash

```bash
cat <<'EOF' > write-loop.sh
#!/bin/bash
while true; do
  echo "Ligne: $(date)" >> boucle.log
  sleep 2
done
EOF

chmod +x write-loop.sh
```

### 💬 Lancer avec `nohup` :
```bash
nohup ./write-loop.sh > out.log 2>&1 &
```

- `nohup` : ignore le signal SIGHUP (déconnexion, fermeture)
- `> out.log 2>&1` : redirige **stdout et stderr** vers `out.log`
- `&` : lance en **arrière-plan**

### 🧪 À tester :
- Déconnecte de ton terminal SSH
- Reconnecte et vérifie :
```bash
tail -f boucle.log
ps aux | grep write-loop
```

- Pour l’arrêter :
```bash
kill $(pgrep -f write-loop)
```

---

## 🔹 2. 🎯 Lancer une commande de téléchargement qui continue sans session active

### ⚙️ Exemple avec `wget`

```bash
nohup wget https://speed.hetzner.de/100MB.bin -O test_file.bin > download.log 2>&1 &
```

➡️ Le téléchargement **continue même si le terminal se ferme**.

### 🧪 À tester :
- Déconnecte de SSH ou ferme le terminal
- Reconnecte :
```bash
ls -lh test_file.bin
tail -f download.log
```

---

## 🔹 3. 🎯 Scanner un réseau avec `nmap` en tâche persistante

### ⚙️ Utilisation :

```bash
nohup nmap -sP 192.168.1.0/24 > scan.log 2>&1 &
```

➡️ Le scan réseau peut durer plusieurs minutes — il **continue même si la session SSH est interrompue**.

---

## 🔹 4. 🎯 Script de traitement long de logs

### ⚙️ Exécuter :

```bash
nohup bash -c 'for i in {1..1000}; do echo "Traitement $i" >> traitement.log; sleep 1; done' > nohup_traitement.log 2>&1 &
```

### 🧪 Ce que tu peux faire :
- Ferme ton terminal
- Reviens plus tard, observe le fichier `traitement.log`
- Tu verras que le traitement continue

---

## 🧠 Comment suivre un processus lancé avec `nohup` ?

### ✅ Fichiers :
- Par défaut, `nohup` écrit dans `nohup.out` si aucune redirection n’est donnée.

```bash
tail -f nohup.out
```

### ✅ Identifier le processus :
```bash
ps aux | grep nohup
pgrep -af write-loop
```

### ✅ Tuer le processus :
```bash
kill $(pgrep -f write-loop.sh)
```

