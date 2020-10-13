" ~/.config/nvim/init.vim
let mapleader = ' '
let maplocalleader = ' '

" == General configuration ==

syntax on                   
set nocompatible            
set background=dark        
set showmatch               
set ignorecase 
set mouse=v 
set hlsearch
set wildmode=longest,list 
set tabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd
set cursorline
set lazyredraw
set incsearch
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set t_Co=256
set splitbelow
set splitright 

" == Keymaps ==

" Remap ';' to be used for commands to eliminate extra shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Open fzf.vim in the current project
nmap <leader>f :Files<CR>

" Allow tab to trigger auto-complete, refresh on backspace
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" == Plugins ==

" managed by [vim-plug](https://github.com/junegunn/vim-plug)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-system-copy'
Plug 'elzr/vim-json'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', {'rtp': 'vim/' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
call plug#end()

" == Extras ==
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" vimwiki 
let g:vimwiki_list = [{'path': '~/doc/wiki/', 'path_html': '~/doc/wiki/html/'}]

" Check if backsapce was just pressed
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction
