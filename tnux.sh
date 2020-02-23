export DISABLE_AUTO_TITLE="true"
tmux new-session -s tests -n editor 

tmux split-windows -h -p 20  -t aa

tmux attach -t tests
