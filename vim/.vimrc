set nocompatible

" plug 
call plug#begin('~/.vim/plugged')

Plug 'wakatime/vim-wakatime',{'as':'waaktime'}
Plug 'https://github.com/aperezdc/vim-template.git', {'as':'template'}
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/vim-cursorword', {'as':'cursorword'}

call plug#end()


" configuratoin 
colorscheme skeletor
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


" vim script function


" Plugin key-mappings.
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
