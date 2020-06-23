module_path+=( "/home/wlz/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin

source ~/.zinit/bin/zinit.zsh


zinit ice lucid wait='1'
zinit light skywind3000/z.lua

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

source ~/alias.zsh
source ~/func.zsh

if  [ -f ~/.xmodmap ];
then 
    xmodmap  ~/.xmodmap;
fi

export WORKON_HOME=~/Envs
source ~/.local/bin/virtualenvwrapper.sh
