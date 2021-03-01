local utils = require('utils')

local cmd = vim.cmd
local g = vim.g
local indent = 2

-- Map space to leader
g.mapleader = ' '

---- Plugins ----
cmd "call plug#begin('~/.vim/plugged')"

cmd "Plug 'airblade/vim-gitgutter'"
cmd "Plug 'Asheq/close-buffers.vim'"
cmd "Plug 'bling/vim-bufferline'"
cmd "Plug 'christoomey/vim-system-copy'"
cmd "Plug 'christoomey/vim-tmux-navigator'"
cmd "Plug 'editorconfig/editorconfig-vim'"
cmd "Plug 'edkolev/tmuxline.vim'"
cmd "Plug 'elzr/vim-json'"
cmd "Plug 'HerringtonDarkholme/yats.vim'"
cmd "Plug 'jiangmiao/auto-pairs'"
cmd "Plug 'jparise/vim-graphql'"
cmd "Plug 'junegunn/fzf', {'do': { -> fzf#install() }}"
cmd "Plug 'junegunn/fzf.vim'"
cmd "Plug 'mattn/emmet-vim'"
cmd "Plug 'neoclide/coc.nvim', {'branch': 'release'}"
cmd "Plug 'preservim/tagbar'"
cmd "Plug 'rafcamlet/coc-nvim-lua'"
cmd "Plug 'rust-lang/rust.vim'"
cmd "Plug 'scrooloose/nerdtree'"
cmd "Plug 'scrooloose/nerdtree-project-plugin'"
cmd "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'"
cmd "Plug 'tomasr/molokai'"
cmd "Plug 'tpope/vim-surround'"
cmd "Plug 'tpope/vim-repeat'"
cmd "Plug 'tpope/vim-commentary'"
cmd "Plug 'tpope/vim-fugitive'"
cmd "Plug 'tpope/vim-obsession'"
cmd "Plug 'vim-airline/vim-airline'"
cmd "Plug 'vim-airline/vim-airline-themes'"

-- This needs to be loaded last
cmd "Plug 'ryanoasis/vim-devicons'"

cmd 'call plug#end()'

---- Settings ----

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'colorscheme molokai'

-- Global Options
utils.opt('o', 'background', 'dark')
utils.opt('o', 'backup', false)
utils.opt('o', 'compatible', false)
utils.opt('o', 'guifont', 'FiraCode_NF')
utils.opt('o', 'hlsearch', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'lazyredraw', true)
utils.opt('o', 'mouse', 'v')
utils.opt('o', 'showcmd', true)
utils.opt('o', 'showmatch', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'timeoutlen', 2500)
utils.opt('o', 'ttimeoutlen', 100)
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'undodir', '~/.config/nvim/undodir')
utils.opt('o', 'updatetime', 100)
utils.opt('o', 'wildmode', 'longest,list')

-- Buffer Local Options
utils.opt('b', 'autoindent', true)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'swapfile', false)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'undofile', true)

-- Window Local Options
utils.opt('w', 'cursorline', true)
utils.opt('w', 'number', true)
utils.opt('w', 'wrap', false)


---- Plugin Settings ----

-- Airline --
g.airline_theme = 'molokai'
g.airline_powerline_fonts = true
g['airline#extensions#obsession#enabled'] = true
g['airline#extensions#obsession#indicator_text'] = '$'
g['airline#extensions#tagbar#enabled'] = false
g['airline#extensions#bufferline#enabled'] = false
g['airline#extensions#coc#enabled'] = true
g['airline#extensions#fzf#enabled'] = true

-- NERDTree --
g.NERDTreeIgnore = { 'node_modules', 'dist', 'build' }
g.NERDTreeDirArrowExpandable = ''
g.NERDTreeDirArrowCollapsible = ''
g.NERDTreeFileExtensionHighlightFullName = 1
g.NERDTreeExactMatchHighlightFullName = 1
g.NERDTreePatternMatchHighlightFullName = 1

---- Keymaps ----

-- Remap ';' to be used for commands to eliminate extra shift press
utils.map('n', ';', ':')
utils.map('n', ':', ';')
utils.map('v', ';', ':')
utils.map('v', ':', ';')

-- Pane navigation made easier
utils.map('n', '<leader>j', '<c-W><c-J>')
utils.map('n', '<leader>k', '<c-W><c-K>')
utils.map('n', '<leader>l', '<c-W><c-L>')
utils.map('n', '<leader>h', '<c-W><c-H>')

-- Faster buffer saving
utils.map('n', '<Leader>ss', ':w<cr>')

-- Shortcut for reloading init.lua
utils.map('n', '<Leader>sp', ':luafile ~/.config/nvim/init.lua<cr>', { silent = true })

-- Make enter work to select coc suggestion
utils.map('i', '<cr>', "pumvisible() ? '<c-y>' : '<c-g>u<cr>'", { expr = true })


-- Open the NERDTree file tree
utils.map('n', '<leader>b', ':NERDTreeToggle<cr>', { silent = true })

-- Open FZF in the current directory
utils.map('n', '<leader>ff', ':Files<cr>')
utils.map('n', '<leader>pw', ':Rg <c-r>=expand("<cword>")<cr><cr>')

-- Allow tab to trigger auto-complete, refresh on backspace
utils.map('i', '<tab>', "pumvisible() ? '<c-n>' : CheckBackSpace() ? '<tab>' : coc#refresh()", { expr = true, silent = true })
utils.map('i', '<s-tab>', "pumvisible() ? '<c-p>' : '<c-h>'")
vim.api.nvim_exec(
[[
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
]]
, false)

-- GoTo code navigation
utils.map('n', '<leader>gd', ":call CocActionAsync('jumpDefinition')<cr>", { silent = true })
utils.map('n', '<leader>gy', ":call CocActionAsync('jumpTypeDefinition')<cr>", { silent = true })
utils.map('n', '<leader>gi', ":call CocActionAsync('jumpImplementation')<cr>", { silent = true })
utils.map('n', '<leader>gr', ":call CocActionAsync('jumpReferences')<cr>", { silent = true })
utils.map('n', '<leader>gn', ":call CocActionAsync('diagnosticNext')<cr>", { silent = true })
utils.map('n', '<leader>gp', ":call CocActionAsync('diagnosticPrevious')<cr>", { silent = true })

-- Use K to show documentation in the preview window
utils.map('n', 'K', ':call ShowDocumentation()<cr>', { silent = true })
vim.api.nvim_exec(
[[
function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >=0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
]]
, false)

-- Symbol renaming
utils.map('n', '<leader>rn', '<Plug>(coc-rename)')

-- Quick Fix
utils.map('n', '<leader>qf', ':CocAction quickfix<cr>')

-- Add space above or below current line
utils.map('n', '<leader>lb', 'mpo<esc>`p')
utils.map('n', '<leader>la', 'mpO<esc>`p')

-- Buffer closing shortcuts using :Bdelete
utils.map('n', '<leader>bdo', ':Bdelete other<cr>')
utils.map('n', '<leader>bdh', ':Bdelete hidden<cr>')

-- TagBar
utils.map('n', '<leader>tt', ':TagbarToggle<cr>')

-- Clear highlighting
utils.map('n', '<leader>nh', ':let @/ = ""<cr>', { silent = true })

---- Autogroups ----
local definitions = {}
definitions['nerd_tree'] = {
  -- automatically open NERDTree when vim starts
  "VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif",
  -- Prevent other buffers from replacing NERDTree in its window
  [[BufEnter * if bufname('#') =~ 'NERD_tree\d\+' && bufname('%') !~ 'NERD_tree\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute 'normal! \<c-w>w' | execute 'buffer'.buf | endif]],
  -- Exit Vim if NERDTree is the only window left
  [[BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
}
definitions['coc_highlight'] = {
  [[CursorHold * silent call CocActionAsync('highlight')]]
}
utils.nvim_create_augroups(definitions)
