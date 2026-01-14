" plug 
"

" configuratoin 
" colorscheme dracula
syntax on 
set scrolloff=5
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
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
set wrap
set wildmenu
set nobackup 
set noswapfile
set t_Co=256
set relativenumber
set mouse+=a 
exec "nohlsearch"


" vim key 



let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" colemak

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     e
" < h   i >
"     n
"     v
noremap <silent> e k
noremap <silent> h h
noremap <silent> n j
noremap <silent> i l


" U/E keys for 5 times u/e (faster navigation)
noremap <silent> E 5k
noremap <silent> N 5j

" N key: go to the start of the line
noremap <silent> H 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

noremap j e
noremap J E
noremap k n
noremap K N
noremap u i
noremap U I
noremap l u
noremap L U


noremap - Nzz
noremap = nzz

" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap te :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tme :+tabmove<CR>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>e <C-w>k
noremap <LEADER>n <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>i <C-w>l

let mapleader = "\<tab>"  " map leader to Space


" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap se :set splitbelow<CR>:split<CR>
noremap si :set splitright<CR>:vsplit<CR>

map S :w<CR>
map Q :q<CR>

map s <nop>
map R :source $MYVIMRC<CR>



" vim script function
" 
