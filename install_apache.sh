#!/bin/bash

if [ $(whoami) != "root" ]; then
	echo "le script doit etre execute avec les privileges root.  utilisez sudo."
	exit 1
fi

ansible-playbook install_apache.yml
