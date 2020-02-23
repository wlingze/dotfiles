#! /bin/sh
#
# shell.sh
# Copyright (C) 2020 wlz <wlz@wlz-OMEN>
#
# Distributed under terms of the MIT license.
#

export DISABLE_AUTO_TITLE="true"

session="shell"

tmux has-session -t $session

if [ $? = 0]
then
    tmux attach-session -t $session
    exit
fi

tmux new-session -d -s $session -n shell
tmux split-window -t $session:1 -h
tmux send-keys -t $session:1.2 'top' C-m
tmux split-window -t $session:1 -v 
tmux send-keys -t $session:1.3 'ipython' C-m
tmux send-keys -t $session:1.1 'la' C-m

tmux select-window -t $session:1
tmux attach-session -t $session

