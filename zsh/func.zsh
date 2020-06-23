#! /bin/sh
#
# func.sh
# Copyright (C) 2020 wlz <wlz@kyria>
#
# Distributed under terms of the MIT license.
#

dexec(){
    docker exec -it $1 /bin/bash;
}


AT(){
    id=$(xinput | grep AT |  sed 's/.*id=\([0-9]*\).*/\1/g')
    prop=$(xinput --list-props $id | grep 'Device Enabled'| sed 's/.*(\([0-9]*\).*/\1/g')
    xinput --set-prop $id $prop $1;
}

C(){
    file $1;
    chechsec $1;
}
