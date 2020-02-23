#! /bin/sh
#
# in.sh
# Copyright (C) 2020 wlz <wlz@wlz-OMEN>
#
# Distributed under terms of the MIT license.
#
pwn="pwn"
code="code"

signal="$1"

echo $signal


# pwn space 
if [ "$signal" = "$pwn" ]
then 
    echo 'pwn space'
    sh ~/.in-space/pwnin.sh $2 $3
fi

# code space 
if [ "$signal"x = "code"x ]
then
    echo 'code space'
    sh ~/.in-space/code.sh $2 $3
fi 
