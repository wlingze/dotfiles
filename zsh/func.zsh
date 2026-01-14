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

makeg() {
    # Check if at least one argument has been provided
    if [ $# -eq 0 ]; then
        echo "Usage: makeg <make target>"
        return 1
    fi

    # Run the qemu command and redirect the output to a file
    make $1 --dry-run \
     | grep -wE 'gcc|g\+\+|clang|clang\+\+|cc|c\+\+' \
     | grep -w '\-c' \
     | jq -nR --arg current_path "$(pwd)" '[inputs|{directory:$current_path, command:., file: match(" [^ ]+$").string[1:]}]' \
     > compile_commands.json
}

function twork() {
    # Fix yazi encoding issues
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    # Define session name as current folder name
    SESSION_NAME=$(basename "$PWD")

    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
        echo "Session $SESSION_NAME found. Attaching..."
        tmux -CC attach -t "$SESSION_NAME"
    else
        echo "Creating new session $SESSION_NAME with 3 tabs..."

        # -----------------------------------------------
        # Tab 1: Monitor
        # -----------------------------------------------
        tmux new-session -d -s "$SESSION_NAME" -n "Monitor"

        # Upper panel: htop
        tmux send-keys -t "$SESSION_NAME:Monitor" "htop" C-m

        # Lower panel: shell (vertical split)
        tmux split-window -v -t "$SESSION_NAME:Monitor" 


        # -----------------------------------------------
        # Tab 2: Workstation
        # -----------------------------------------------
        tmux new-window -t "$SESSION_NAME" -n "Workstation"

        # Upper panel: claude
        tmux send-keys -t "$SESSION_NAME:Workstation" "claude" C-m

        # Lower panel: yazi
        tmux split-window -v -t "$SESSION_NAME:Workstation"
        tmux send-keys -t "$SESSION_NAME:Workstation" "yazi" C-m


        # -----------------------------------------------
        # Tab 3: Playground
        # -----------------------------------------------
        tmux new-window -t "$SESSION_NAME" -n "Playground"


        # -----------------------------------------------
        # Start
        # -----------------------------------------------
        # Select first tab
        tmux select-window -t "$SESSION_NAME:Monitor"

        # Attach in -CC mode
        tmux -CC attach -t "$SESSION_NAME"
    fi
}

function itmux() {
    HOST=$1
    if [ -z "$HOST" ]; then
        echo "Usage: itmux <host>"
        return 1
    fi

    # Copy this file to server
    echo "Syncing func.zsh to $HOST..."
    scp ~/Documents/dotfiles/zsh/func.zsh "$HOST:~/Documents/dotfiles/zsh/func.zsh"

    if [ $? -ne 0 ]; then
        echo "Failed to sync func.zsh to $HOST"
        return 1
    fi

    echo "Connecting to $HOST..."
    # Execute twork in ssh session
    ssh -t "$HOST" "twork"
}
