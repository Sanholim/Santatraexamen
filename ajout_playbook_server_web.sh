#!/bin/bash

if [ $(whoami) != "root" ]; then
	echo "le script est uniquement execute avec les privileges root. Utilisez sudo."
	exit 1
fi
ansible-playbook ajout_playbook_server_web.sh
