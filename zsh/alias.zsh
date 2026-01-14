
alias rg="rg  --ignore-case "
alias  ..='cd ..'

alias _='sudo '
alias __='sudo su'

alias cat="bat"

alias h='history'
alias p='ps -elf'
alias dr='tldr'
alias la='ls -lah'


alias vi='vim'
alias v='vim'
alias vf='vimdiff'
alias vsc='code'

alias ls='eza' 
alias grep='grep --color'

alias -g G='| grep'
alias F='la | grep'

alias P='ps -elf| grep '

alias t='terminator'

alias duc='du -h  --max-depth=1 ./'

# git 
alias g='git'

# pacman 
alias _p='sudo pacman '
alias _ps='sudo pacman -S'
alias _pss='pacman -Ss'
alias _pqs='pacman -Qs'
alias _psyy='sudo pacman -Syy'
alias _psyyu='sudo pacman -Syyu'
alias _pr='sudo pacman -R'

# tmux 
alias tn='tmux new-session -s'
alias tl='tmux ls'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'

# docker 

alias d='docker'
alias dps='docker ps -a'

# python pip 
alias py='python'
alias pi='pip install'
alias pu='pip unstall'
alias ipy='ipython'

# golang 
alias gb='go build'
alias gr='go run'
alias cgo='go tool cgo'

