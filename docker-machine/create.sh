#!/bin/bash

# to delete docker machine run delete.sh in the same console

export DOCKER_MACHINE_NAME="docker-for-jenkins"

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

echo -e $grn"\nIP address:"$rst
docker-machine ip "$DOCKER_MACHINE_NAME"
