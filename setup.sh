#! /bin/sh
#
# setup.sh
# Copyright (C) 2020 wlz <wlz@wlz-OMEN>
#
# Distributed under terms of the MIT license.#

# apt 
sudo cp -r sources.list /etc/apt/sources.list
apt-get -y update
rm -rf /var/lib/apt/list/*

apt install -y \
    libc6:i386\
    libc6-dbg:i386\
    libc6-dbg\
    ipython3\
    vim\
    net-tools\
    python3\
    python3-pip\
    tmux\
    docker\
    gdb\
    git\
    tree\
    zsh



# python3
cp -r .pip ~/
python3 -m pip install -U pip 
python3 -m pip install repgadget\
    z3-solver\
    unicorn\
    pwntools\
    angr

# pwngdb
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# wine
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ cosmic main'

# zsh
chsh -s /bin/zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
cp lvchen.zsh-theme ~/.oh-my-zsh/themes/
cp .zshrc ~/
cp incr.zsh ~/.oh-my-zsh/plugins/

# vim 
sudo cp -r .vimrc ~/
cp -r .vim ~/

# docker 
sudo cp daemon.json /etc/docker/ 
docker pull lingze/gdb:18
docker pull lingze/gdb:16

# in space 
cp ./.inspace/ ~/
sudo cp ~/.inspace/in.sh /bin/in
sudo cp ~/.inspace/shell.sh /etc/profile.d/ 

# nemo 
sudo apt install nemo 
sudo apt remove nautilus
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search