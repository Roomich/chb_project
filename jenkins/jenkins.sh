#!/bin/env bash

eval $(docker-machine env docker-for-jenkins)

if [[ $1 == 'up' ]]; then
    source ./sync_folder.sh
    docker-compose up -d
fi

if [[ $1 == 'down' ]]; then
    docker-compose down
fi