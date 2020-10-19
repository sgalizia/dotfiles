" ~/.config/nvim/init.vim
let mapleader = ' '

" == General configuration ==

filetype plugin on
syntax on
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

" == Keymaps ==

" Remap ';' to be used for commands to eliminate extra shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Pane navigation made easier
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Make enter work to select coc suggestion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

" Open the NERDTree file tree
nnoremap <silent> <leader>b :NERDTreeToggle<CR>

" Open fzf.vim in the current directory
nnoremap <leader>ff :Files<CR>
nnoremap <leader>pw :Rg <c-r>=expand("<cword>")<cr><cr>

" Map profile editing and resourcing
nnoremap <leader>pr :e<space>$HOME/.config/nvim/init.vim<cr>
nnoremap <leader>rp :source<space>$HOME/.config/nvim/init.vim<cr>

" Allow tab to trigger auto-complete, refresh on backspace
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call<SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >=0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" quick fix
nnoremap <leader>qf :CocAction quickfix<cr>;

" Easier shorcut for saving buffer
nnoremap <leader>ss :w<cr>

" == Plugins ==

" managed by [vim-plug](https://github.com/junegunn/vim-plug)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-system-copy'
Plug 'elzr/vim-json'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', {'rtp': 'vim/' }
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
" This needs to be loaded last
Plug 'ryanoasis/vim-devicons'
call plug#end()

" == Extras ==
colorscheme dracula
let g:airline_theme='dracula'
let g:airline_powerline_fonts=1

" vimwiki 
let g:vimwiki_list = [{'path': '~/doc/wiki/', 'path_html': '~/doc/wiki/html/'}]

" fzf run time path
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" Check if backsapce was just pressed
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction
