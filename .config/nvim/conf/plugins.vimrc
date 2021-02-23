" This file is used for plugin specific settings that need to be configured

" Airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '$'
let g:airline#extensions#tagbar#enabled = 0 
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#coc#enabled = 1 
let g:airline#extensions#fzf#enabled = 1 

function! AirlineInit()
  let g:airline_section_c = airline#section#create(['%t'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Golang 
let g:go_fmt_command = "goimports"

" FZF
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" NERDTree
let g:NERDTreeIgnore = ['node_modules', 'dist', 'build']
let g:NERDTreeNodeDelimiter = "\u00b7"
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Prevent vim-plug calls from interfering with NERDTree
let g:plug_window = 'noautocmd vertical topleft new'

" Tagbar
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_sort = 0
