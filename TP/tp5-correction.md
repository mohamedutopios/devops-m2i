## TP_2_Gestion_utilisateur_Linux

### Mission1 : 


root@iss-infra-formation-11:/# groupadd administration 
root@iss-infra-formation-11:/# groupadd comptabilite 
root@iss-infra-formation-11:/# groupadd employes 
root@iss-infra-formation-11:/# groupadd paie 
root@iss-infra-formation-11:/# groupadd communication 
root@iss-infra-formation-11:/# adduser alain 
New password: 
Retype new password: 
passwd: 
password updated successfully Changing the user information for alain Enter the new value, or press ENTER for the default 	
Full Name []: alain Halluin 	
Room Number []: 1 	
Work Phone []: 0455674321 	
Home Phone []: 0633125643 	
Other []: alain.halluin@tartempion.com Is the information correct? [Y/n] y 

root@iss-infra-formation-11:/# usermod -a -G comptabilite alain 
root@iss-infra-formation-11:/# usermod -a -G employes alain 
root@iss-infra-formation-11:/# usermod -a -G administration alain 
root@iss-infra-formation-11:/# adduser albert 
New password: 
Retype new password: 
passwd: 
password updated successfully Changing the user information for albert Enter the new value, or press ENTER for the default 	
Full Name []: albert Deloin 	
Room Number []: 1 	
Work Phone []: 0455674322 	
Home Phone []: 0756431209 	
Other []: albert.deloin@tartempion.com Is the information correct? [Y/n] y 
root@iss-infra-formation-11:/# usermod -a -G employes albert 
root@iss-infra-formation-11:/# usermod -a -G communication albert 
root@iss-infra-formation-11:/# usermod -a -G administration albert 
root@iss-infra-formation-11:/# adduser farid . 
New password: 
Retype new password: 
passwd: 
password updated successfully Changing the user information for farid Enter the new value, or press ENTER for the default 	
Full Name []: Farid Atik 	
Room Number []: 1 	
Work Phone []: 0455674323 	
Home Phone []: 	
Other []: farid.atik@tartempion.com Is the information correct? [Y/n] y 
root@iss-infra-formation-11:/# usermod -a -G employes farid 
root@iss-infra-formation-11:/# usermod -a -G paie farid 
root@iss-infra-formation-11:/# usermod -a -G administration farid

### Mission2 : 
root@iss-infra-formation-11:/# cat /etc/passwd


### Mission3 : 

root@iss-infra-formation-11:/etc# cat shadow 
alain:$6$VmFd53GNb6BCVqoh$nTxjhiYz8.Fcu.bJgCkSfhQ9b7W0rb5PAgmCxNu2y4frrw1NE10/VvMvNnxHvU0Jo5JgIj2LGplJLOD23sYIx.:19081:0:99999:7::: 
albert:$6$W3sm7GMYS2PEGYRK$f0mhxS5LxqZxf/6FlcOB3H5K1WKjbrqTc9coBGhHct5qZ0Y928SrAKIBQBsruOvCoT5EEFgIyGI3HFw18XKVo/:19081:0:99999:7::: 
farid:$6$AqAp5Slzz38Be.LO$J50s/MuWZxbmGtjLCycx4HLA.xCMzQFfwTXCowMzOHh.zDjUD221ZJqDDisZM4dDd2c3xB9n9Z7Mdu62W9Zrj/:19081:0:99999:7:::



### Mission4 : 

root@iss-infra-formation-11:/# groups farid


### Mission5 : 

Le compte de cet utilisateur a été verrouillé. C'est pour cela qu'on voit "!" devant le mot de passe crypté


### Mission6 : 

Le nom d'utilisateur ne doit pas commencer par une majuscule

### Mission7 : 
root@iss-infra-formation-11:/# userdel alain

### Mission8 : 

root@iss-infra-formation-11:/etc# useradd loic 
root@iss-infra-formation-11:/etc# passwd -n 5 -x 45 -w 5 -i 7 loic passwd: password expiry information changed. 
root@iss-infra-formation-11:/etc# chage -l loic 
Last password change					: Mar 30, 2022 
Password expires					: May 14, 2022 
Password inactive					: May 21, 2022 
Account expires						: never 
Minimum number of days between password change		: 5 
Maximum number of days between password change		: 45 
Number of days of warning before password expires	: 5

### Mission9 : 

root@iss-infra-formation-11:/# gpasswd -d farid paie Removing user farid from group paie root@iss-infra-formation-11:/# usermod -a -G communication farid

### Mission10 : 

root@iss-infra-formation-11:/# passwd -l albert passwd: password expiry information changed.


### Mission11 : 
root@iss-infra-formation-11:/# groupmod -n gestion comptabilite

### Mission12 : 

#Création des fichiers et dossiers 
root@iss-infra-formation-11:/home# mkdir Administration 
root@iss-infra-formation-11:/home# mkdir Paie 
root@iss-infra-formation-11:/home# mkdir Communication 
root@iss-infra-formation-11:/home/Communication# touch communication.txt 
root@iss-infra-formation-11:/home/Communication# touch communication.ppt 
root@iss-infra-formation-11:/home/Paie# touch paie.doc 

# Affectation des groupes 
# Pour Farid 
root@iss-infra-formation-11:/home# chgrp -R gestion Administration 
root@iss-infra-formation-11:/home# chgrp -R gestion Communication/communication.txt 
root@iss-infra-formation-11:/home# chgrp -R gestion Paie/paie.doc 
# Pour Albert 
root@iss-infra-formation-11:/home# chgrp -R gestion Administration 
root@iss-infra-formation-11:/home# chgrp -R communication Communication/commmunication.ppt 
root@iss-infra-formation-11:/home# chgrp -R communication Communication/communication.ppt 
# Droits 
root@iss-infra-formation-11:/home# chmod 760 Administration 
root@iss-infra-formation-11:/home# chmod 760 Communication 
root@iss-infra-formation-11:/home# chmod 760 Paie 
root@iss-infra-formation-11:/home# chmod 760 Communication/communication.ppt 
root@iss-infra-formation-11:/home# chmod 760 Communication/communication.txt 
root@iss-infra-formation-11:/home# chmod 760 Paie/paie.doc

