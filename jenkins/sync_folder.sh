#! /bin/env bash

export DOCKER_MACHINE_NAME="docker-for-jenkins"
export SYNC_FOLDER="jenkins"
export MACHINE_USER="ubuntu"
export ROOT_DIR="/home/roman/git/chb_project"

red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
rst="$( echo -e '\033[0m' )"    # Reset Color format

echo -e $grn"\nSynchronizing folder..."$rst
cd "$ROOT_DIR"
docker-machine scp -r ./"$SYNC_FOLDER/" "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/"
cd "$HOME"