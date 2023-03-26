#!/bin/bash


red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
rst="$( echo -e '\033[0m' )"    # Reset Color format

echo -e $grn"\ndiscover machine..."$rst
MACHINE="$(docker-machine ls | awk 'FNR > 1 {print $1}')"

if [[ -z "$MACHINE" ]]; then
    echo -e $grn"\nNo docker machine discovered..."$rst
else
    echo -e $grn"\ndelete machine..."$rst
    docker-machine rm $MACHINE -y

    echo -e $grn"\nsetting default environment for docker..."$rst
    docker-machine env -u
fi
