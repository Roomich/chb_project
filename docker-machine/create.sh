#!/bin/bash

# to delete docker machine run delete.sh in the same console

export DOCKER_MACHINE_NAME="docker-for-jenkins"
export SYNC_FOLDER="jenkins"
export MACHINE_USER="ubuntu"
export ROOT_DIR="/home/roman/git/chb_project"

red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
rst="$( echo -e '\033[0m' )"    # Reset Color format

echo -e $grn"\nCreating docker-machine..."$rst
docker-machine create \
    --driver amazonec2 \
	--amazonec2-region us-east-1 \
	--amazonec2-ami ami-0557a15b87f6559cf \
	--amazonec2-instance-type t2.small \
	--amazonec2-open-port 80 \
	--amazonec2-open-port 8080 \
"$DOCKER_MACHINE_NAME"
echo -e $grn"\nDone!!"$rst

echo -e $grn"\nSetting up environment..."$rst
docker-machine env "$DOCKER_MACHINE_NAME"
eval $(docker-machine env "$DOCKER_MACHINE_NAME")
echo -e $grn"\nDone!!"$rst

echo -e $grn"\nCreating sync folder..."$rst
cd "$ROOT_DIR"
docker-machine ssh "$DOCKER_MACHINE_NAME" mkdir "$SYNC_FOLDER"
docker-machine scp -r ./"$SYNC_FOLDER/" "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/"
cd "$HOME"

echo -e $grn"\nCopying sshkey for github..."$rst
docker-machine scp .ssh/jenkins-git "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/.ssh/jenkins-git"
docker-machine ssh "$DOCKER_MACHINE_NAME" "chmod 400 /home/"$MACHINE_USER"/.ssh/jenkins-git"

echo -e $grn"\nCopying PAT for github..."$rst
docker-machine ssh "$DOCKER_MACHINE_NAME" mkdir .github
docker-machine scp ./github/github_pat "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/.github/github_pat"

echo -e $grn"\nCopying aws cred..."$rst
[ -d ./aws_cred ] || mkdir ./aws_cred
aws configure get aws_access_key_id > ./aws_cred/aws_access_key_id
aws configure get aws_secret_access_key > ./aws_cred/aws_secret_access_key
docker-machine scp -r ./aws_cred/ "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/.aws_cred/"

echo -e $grn"\nIP address:"$rst
docker-machine ip "$DOCKER_MACHINE_NAME"