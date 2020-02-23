#! /bin/sh
#
# code.sh
# Copyright (C) 2020 wlz <wlz@wlz-OMEN>
#
# Distributed under terms of the MIT license.
#

export DISABLE_AUTO_TITLE="true"

session="code"

tmux has-session -t $session

if [ $? = 0]
then
    tmux attach-session -t $session
    exit
fi

tmux new-session -d -s $session -n home
tmux split-window -t $session:1 -h
tmux send-keys -t $session:1.1 'la' C-m
tmux send-keys -t $session:1.2 'git status' C-m

tmux new-window -t $session:2 -n edit 
tmux split-window -t $session:2 -h -p 20
tmux send-keys -t $session:2.1 'la' C-m
tmux send-keys -t $session:2.2 'ipython3' C-m

tmux new-window -t $session:3 -n text 
tmux split-window -t $session:3 -h 
tmux send-keys -t $session:3.1 'cd /home/wlz/work/text/co_text/' C-m
tmux send-keys -t $session:3.2 'cd /home/wlz/work/text/co_text/' C-m

tmux select-window -t $session:1
tmux attach-session -t $session

