#! /bin/sh
#
# tmux.sh
# Copyright (C) 2020 wlz <wlz@wlz-OMEN>
#
# Distributed under terms of the MIT license.
#

path=$(pwd)

export DISABLE_AUTO_TITLE="true"

session="test"

tmux has-session -t $session

if [ $? = 0]
then
    tmux attach-session -t $session
    exit
fi
tmux new-session -d -s $session -n home
tmux split-window -t $session:1 -v
tmux new-window -t $session:2 -n edit #vim
tmux split-window -t $session:2 -h
tmux send-keys -t $session:2.2 'ipython3' C-m
tmux new-window -t $session:3
tmux split-window -t $session:3 -h

gdb16=16
gdb18=18
echo $path
if [ $1 -eq $gdb16  ]
then
    tmux send-keys -t $session:1.1 'echo "into gdb16 pwn it"' C-m
    tmux send-keys -t $session:3.1 'docker run -it -v '$path':/home/ gdb16 /bin/bash' C-m
    tmux send-keys -t $session:3.1 'cd home/' C-m
elif [ $1 -eq $gdb18 ]
then
    tmux send-keys -t $session:1.1 ''echo "into gdb18 pwn it" C-m
    tmux send-keys -t $session:3.1 'docker run -it -v '$path':/home/ gdb18 /bin/bash' C-m
    tmux send-keys -t $session:3.1 'cd home/' C-m
else
    echo 
    tmux send-keys -t $session:1.1 'echo "no this gdb' C-m
fi



tmux select-window -t $session:1
tmux attach-session -t $session
