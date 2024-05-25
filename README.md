# Santatraexamen
Ceci est l'examen de San
**Tâche 1 – Test de compétences GitHub:
Nom de la tâche: Gérer les scripts et les documents GitHub

Préparation de la tâche:
-Créer un dossier nommé Gsi_exam dans la machine virtuelle.
-Initialiser un dépôt Git dans ce dossier.
Mise en œuvre de la tâche
Préparation:
Ouvrir un terminal et exécuter les commandes suivantes :

"mkdir Gsi_exam
 cd Gsi_exam
 git init"
Scénarios:
-Créer des scripts pour chaque tâche et les copier dans le répertoire Gsi_exam.
Référentiel:
-Connecter le dépôt local à un dépôt GitHub.

"git remote add origin https://github.com/votre_compte/votre_repo.git
Télécharger:
-Après chaque étape, ajouter, committer et pousser les fichiers vers GitHub :

"git add .
 git commit -m "Ajout de la tâche X"
 git push origin master"

Dépannage de la tâche
Problème : 
-Connexion refusée lors du git push.
-Fichiers non suivis.

Tâche II – Test de compétences Ansible
Nom de la tâche: Gérer les scripts Ansible

Préparation de la tâche:
-Installer et configurer SSH et Ansible.
-Mise en œuvre de la tâche
Configurer Ansible:
-Installer le serveur SSH et l'activer :

"sudo apt-get update
sudo apt-get install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh"
Configurer le fichier hosts pour inclure gsi_machine :

"[webservers]
gsi_machine ansible_host=<IP_ADDRESS>"
-Vérifier la configuration d'Ansible :

"ansible all -m ping"
-Vérifier les communications avec le serveur Web local:
-Utiliser le module ping d'Ansible :

"ansible webservers -m ping"
Créer des Playbooks Ansible pour automatiser l'installation du serveur Web:
Créer un fichier install_apache.yml :
"
---
- hosts: webservers
  tasks:
    - name: Installer Apache
      apt:
        name: apache2
        state: present"
"
- Lancer le playbook :

"ansible-playbook install_apache.yml
-Vérifier qu'Apache est installé et fonctionne :
"systemctl status apache2"
- Ajouter des options à votre Playbook Ansible pour serveurs Web Apache:
- Modifier install_apache.yml pour changer le port :
"
---
- hosts: webservers
  tasks:
    - name: Installer Apache
      apt:
        name: apache2
        state: present
    - name: Modifier le port d'écoute
      lineinfile:
        path: /etc/apache2/ports.conf
        regexp: '^Listen 80'
        line: 'Listen 8081'"
-Lancer le playbook et vérifier après :
"
ansible-playbook install_apache.yml
curl http://<192.168.1.37>:8081
Dépannage de la tâche
Problème : 
-Impossible de se connecter à gsi_machine.
-Apache ne démarre pas après modification du port.

Tâche III – Docker
Nom de la tâche: Créer des microservices

Préparation de la tâche
-Installer Docker sur la machine.
Mise en œuvre de la tâche:
-Créer une image Docker basée sur le playbook Ansible:
-Créer un fichier Dockerfile :
"
FROM debian:latest

RUN apt-get update && apt-get install -y \
    ansible \
    apache2

COPY install_apache.yml /etc/ansible/install_apache.yml
RUN ansible-playbook /etc/ansible/install_apache.yml"
-Écrire un script bash pour démarrer le conteneur :
"
#!/bin/bash
docker build -t ansible-apache .
docker run -d -p 8081:80 ansible-apache"

Problème : 
-Erreur lors de la construction de l'image Docker.
-Conteneur ne démarre pas.

Tâche IV – Bash
Nom de la tâche
Bash

Description de la tâche:
Créer un script bash qui lit tous les fichiers de configuration en cours d'exécution sur iOS dans un dossier spécifié ios_configs et qui génère un message indiquant si iOS doit être mis à niveau ou non.

Exécution des tâches
1. Préparation:
- Créer un sous-dossier dans le répertoire actuel nommé ios_configs :mkdir ios_configs
- Copier les fichiers de configuration dans le dossier ios_configs :cp /chemin/vers/running_config101 ios_configs/
 cp /chemin/vers/running_config111 ios_configs/
2. Caractéristiques du script Bash
a. Nom du script bash : check_ios.sh
b. Rendre le script exécutable:
- Créer le script check_ios.sh : nano check_ios.sh
- Ajouter le contenu suivant au script :
"
#!/bin/bash
output_file="check_ios.rep"

# Créer le fichier de sortie et ajouter la date du jour
echo "$(date)" > $output_file
echo "" >> $output_file
echo "STARTING IOS CHECK" >> $output_file

# Lire tous les fichiers de configuration dans ios_configs
for config in ios_configs/*; do
  hostname=$(grep "hostname" $config | awk '{print $2}')
  ios_version=$(grep "version" $config | awk '{print $2}')

  echo "Hostname: $hostname" >> $output_file
  echo "iOS Version: $ios_version" >> $output_file

  if [ "$ios_version" == "16.9.111" ]; then
    echo "iOS is up to date." >> $output_file
  else
    echo "iOS needs to be upgraded." >> $output_file
  fi
  echo "" >> $output_file
done"
- Rendre le script exécutable :chmod +x check_ios.sh
c. Le script bash doit lire tous les fichiers de configuration en cours d'exécution dans le sous-dossier ios_configs
Le script lit tous les fichiers de configuration dans ios_configs et vérifie le nom d'hôte et la version iOS de chaque fichier.
d. Le script bash doit vérifier le nom d'hôte du routeur et la version iOS
Si la version iOS est égale à 16.9.111, la version est considérée à jour. Sinon, la version doit être mise à niveau.
e. Après avoir créé et testé le script bash, copiez et téléchargez le script bash sur votre dépôt GitHub
Copier et télécharger le script check_ios.sh sur le dépôt GitHub :

"-git add check_ios.sh
 - git commit -m "Ajout du script check_ios.sh"
-git push origin master"
-Copier et télécharger également le fichier de sortie sur votre dépôt GitHub après avoir exécuté le script :

"
./check_ios.sh
git add check_ios.rep
git commit -m "Ajout du fichier de sortie check_ios.rep"
git push origin master"
3. Sortie du script Bash

- Dépannage de la tâche:
Problème : 
- probmeme de VM à la derniere minute
-Le script ne trouve pas les fichiers de configuration.
-Erreur de permissions lors de l'exécution du script.

Vérification des tâches
**
