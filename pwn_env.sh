
sudo cp -r sources.list /etc/apt/sources.list
apt-get -y update

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

