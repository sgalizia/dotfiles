local utils = require('utils')

local cmd = vim.cmd
local g = vim.g
local indent = 2

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


-- Plugin Settings --

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
