" This file is used for general configuration settings

let mapleader = ' '

filetype plugin indent on
syntax on
colorscheme molokai
set autoindent
set background=dark
set cursorline
set expandtab
set guifont="FiraCode NF", 10
set hlsearch
set ignorecase 
set incsearch
set lazyredraw
set mouse=v 
set nobackup
set nocompatible           
set noswapfile
set number
set nowrap
set shiftwidth=2
set showcmd
set showmatch               
set smartcase
set smartindent
set splitbelow
set splitright 
set tabstop=2
set timeoutlen=2500
set ttimeoutlen=100
set termguicolors
set undodir=~/.config/nvim/undodir
set undofile
set wildmode=longest,list 

" == Functions ==

" Check if backspace was just pressed
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >=0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

