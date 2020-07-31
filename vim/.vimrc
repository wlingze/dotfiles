" plug 
call plug#begin('~/.vim/plugged')

Plug 'wakatime/vim-wakatime',{'as':'waaktime'}
Plug 'https://github.com/aperezdc/vim-template.git', {'as':'template'}
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/vim-cursorword', {'as':'cursorword'}
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()


" configuratoin 
colorscheme dracula
syntax on 
set showcmd
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
set t_Co=256
set relativenumber
set mouse+=a 

autocmd BufNewFile exp.py 0r ~/.vim/autoload/pwn.tem

" vim script function

