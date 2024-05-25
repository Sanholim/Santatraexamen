#!/bin/bash

check_git_connection() {
	if ! command -v git >/dev/null; then
		echo "Git n'est pas installe. installez Git avant de continuer."
		exit 1
	fi
	
	git remote -v | grep origin >/dev/null
	if [ $? -ne 0 ]; then
		echo "Pas de connexion au depot GitHub.  configurez le depot."
		exit 1
	fi
	
	echo "Connexion Git etablie avec succes."
}

main() {
	check_git_connection
}

main
