#!/bin/bash

if [ $(whoami) != "root" ]; then
	echo "mettre en mode root"
	exit 1
fi

docker build -t my-apache-image:latest .
