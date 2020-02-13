set hlsearch
set nu
set encoding=utf-8
filetype indent on 
set tabstop=4
set shiftwidth=4
set autoindent
set laststatus=2
set ruler
set expandtab
set softtabstop=4
set noerrorbells
set cursorline
set nobackup 
set noswapfile
set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', {'as':'dracula'}
Plug 'wakatime/vim-wakatime',{'as':'waaktime'}

call plug#end()

colorscheme dracula
syntax on 
set showcmd
