" ~/.config/nvim/init.vim
let mapleader = ' '

" == General configuration ==

syntax on
set autoindent
set background=dark
set cursorline
set expandtab
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
set shiftwidth=4
set showcmd
set showmatch               
set smartcase
set smartindent
set splitbelow
set splitright 
set tabstop=4
set timeoutlen=3000
set ttimeoutlen=100
set termguicolors
set undodir=~/.config/nvim/undodir
set undofile
set wildmode=longest,list 

" == Keymaps ==

" Remap ';' to be used for commands to eliminate extra shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Pane splitting made easier
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Open fzf.vim in the current directory
nmap <leader>fz :Files<CR>

" Map profile editing and resourcing
nnoremap <leader>pr :e<space>$HOME/.config/nvim/init.vim<cr>
nnoremap <leader>rp :source<space>$HOME/.config/nvim/init.vim<cr>

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
