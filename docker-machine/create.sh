#!/bin/bash

echo -e $grn"\nCreating docker-machine..."$rst

docker-machine create \
    --driver amazonec2 \
	--amazonec2-region us-east-1 \
	--amazonec2-ami ami-0557a15b87f6559cf \
	--amazonec2-instance-type t2.small \
	--amazonec2-open-port 80 \
	--amazonec2-open-port 8080 \
docker-for-jenkins