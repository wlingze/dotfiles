arch=$1
session="pwn"
tmux new-session -d -s $session -n gdb
tmux split-window -t $session:0 -h
tmux send-keys -t $session:0.0 'cd /home/' C-m
tmux send-keys -t $session:0.0 'chmod +x '$arch C-m
tmux send-keys -t $session:0.0 'gdb '$arch C-m
tmux send-keys -t $session:0.1 'ipython3' C-m
tmux send-keys -t $session:0.1 'from pwn import *' C-m
tmux new-window -t $session:1 -n python 

tmux select-window -t $session:0
tmux attach-session -t $session
