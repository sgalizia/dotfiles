" ~/.config/nvim/init.vim
let mapleader = ' '

" == Plugins ==

" managed by [vim-plug](https://github.com/junegunn/vim-plug)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'Asheq/close-buffers.vim'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-bufferline'
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx', 'typescript'], 'do': 'make install'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'sonph/onehalf', {'rtp': 'vim/' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline'
" Plug 'vimpostor/vim-tpipeline'
Plug 'vimwiki/vimwiki'
" This needs to be loaded last
Plug 'ryanoasis/vim-devicons'
call plug#end()

" == General configuration ==

filetype plugin indent on
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
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

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
nnoremap <silent> <leader>gd :call CocActionAsync('jumpDefinition')<cr>
nnoremap <silent> <leader>gy :call CocActionAsync('jumpTypeDefinition')<cr>
nnoremap <silent> <leader>gi :call CocActionAsync('jumpImplementation')<cr>
nnoremap <silent> <leader>gr :call CocActionAsync('jumpReferences')<cr>
nnoremap <silent> <leader>gn :call CocActionAsync('diagnosticNext')<cr>
nnoremap <silent> <leader>gp :call CocActionAsync('diagnosticPrevious')<cr>

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
augroup coc_highlight
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Symbol renaming
nnoremap <leader>rn <Plug>(coc-rename)

" quick fix
nnoremap <leader>qf :CocAction quickfix<cr>;

" Easier shorcut for saving buffer
nnoremap <leader>ss :w<cr>

" Convert word to uppercase 
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwU<esc>

" Add empty line below cursor position
nnoremap <leader>lb mpo<esc>`p

" Add empty line above cursor position
nnoremap <leader>la mpO<esc>`p

" Buffer closing shortcuts with :Bdelete
nnoremap <leader>bdo :Bdelete other<cr>
nnoremap <leader>bdh :Bdelete hidden<cr>

" TagBar mappings
nnoremap <leader>tt :TagbarToggle<CR>

" Shortcut to clear highlighting
nnoremap <leader>nh :nohl<cr>

" == Abbreviations ==

" common typo fixes
iabbrev conts const

" == Extras ==
colorscheme dracula
let g:airline_theme='dracula'
let g:airline_powerline_fonts=1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extension#tagbar#enabled = 0 

" vimwiki 
let g:vimwiki_list = [{'path': '~/doc/wiki/', 'path_html': '~/doc/wiki/html/'}]

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

" fzf run time path
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" Check if backspace was just pressed
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:NERDTreeIgnore = ['node_modules', 'dist', 'build']

" Prevent vim-plug calls from interfering with NERDTree
let g:plug_window = 'noautocmd vertical topleft new'

" Tagbar customization
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_sort = 0

command! Scratch lua require'tools'.makeScratch()

" == Autocommands ==

" NERDTree autocmds
augroup nerd_tree
  autocmd!
  " automatically open NERDTree when vim starts
  autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
  " Prevent other buffers from replacing NERDTree in its window
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree\d\+' && bufname('%') !~ 'NERD_tree\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-w>w" | execute 'buffer'.buf | endif
  " Exit Vim if NERDTree is the only window left
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
augroup end

" Golang autocommands
augroup golang
  autocmd!
  autocmd FileType go nnoremap <buffer> <c-g>r :GoRun<cr>
augroup end

" Comment line commands per filetype
augroup comment_line
  autocmd!
  autocmd FileType typescript nnoremap <buffer> <localleader>c I//<esc>
augroup end

