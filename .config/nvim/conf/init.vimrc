" This file is used to setup plugins and any other initial setup that
" needs to be performed.

" managed by [vim-plug](https://github.com/junegunn/vim-plug)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'Asheq/close-buffers.vim'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-bufferline'
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
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
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'sonph/onehalf', {'rtp': 'vim/' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" This needs to be loaded last
Plug 'ryanoasis/vim-devicons'
call plug#end()
