1- Quelle commande est utilisée pour amener le processus d'arrière-plan au premier plan?

bg


2 - Que signifie PID et PPID? Quel est le rôle de chacun et leur relation?

PID : ID du processus
PPID : ID processus parent.

3 - Que fais la commande w -i et que lui manque-il?

Affiche l'IP des tty connecté sur la machine.

4 - Les informations d'un processus dans le shell courant peuvent-elles être obtenues en utilisant ___ ?

ps

5 - Si je lance mon navigateur internet et que j'ouvre 3 onglets. Que va afficher la commande TOP, suite à cette opération?

Je vais avoir 3 processus (navigateur et 2 onglets en plus)

6 - En vous basant sur l'image 2 , montrez 2 façons de stopper la command intitulé : Web Content. Que doit - il se passer ensuite?

Killall 
kill -9 

7 - Quelle commande peut être exécutée par un utilisateur qui est déjà connecté au système, afin de passer à l’utilisateur root?

sudo su

8 - Quel signal est envoyé par la commande « kill -9 »?

KILL

9 - La commande « nohup » est utilisé pour ____ ?

continuer le processus après la déconnexion.

10 - Que signifie TOP?

Table of Processes

11 - Que permet de faire cette commande : top -o PID


12 - En vous basant sur l'image 3, peut on kill le PID n°6620? Que se passe t'il si on tente de kill la commande "top"?

On ne peut le tuer. Il est à l'origine du processus top. Dès qu'on stop, pour lancer la commande kill, le processus top est déjà kill. Il faudrait ouvrir un second terminal pourr 

13 - Toujours avec l'image 2 , pourquoi est-il indiqué 1 processus en cours et 194 en veille?

1 seul processus actif. Les autres sont en vielles.

14 - Toujours en vous basant sur l'image 2, Que fais cette commande : kill -9 firefox. Que se passe 'il ensuite?'

Ils tuent tous les processus avec le nom "firefox" et ses enfants comme "web content"