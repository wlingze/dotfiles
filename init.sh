
# pacman 
sudo pacman-mirrors -i -c China -m rank

sudo pacman -S archlinuxcn-keyring
sudo pacman -Syyu

sudo pacman -S typora albert ttf-monaco

# cp config file 

cp -r ./alacritty ~/.config/
cp -r ./i3        ~/.config/
cp -r ./polybar   ~/.config/

mkdir ~/.pip
cp ./pip/pip.conf   ~/.pip/

cp ./zsh/*      ~/
cp ./zsh/.zshrc ~/

cp ./vim/.vim     ~/
cp ./vim/.vimrc   ~/

cp ./tmux/.tmux.conf     ~/

cp ./git/*           ~/
cp ./git/.gitconfig  ~/

cp ./font/.Xresources ~/ 

cp ./keyboard/.Xmodmap ~/
xmodmap ~/.Xmodmap

cp ./redshift/config ~/.config/redshift.conf 
