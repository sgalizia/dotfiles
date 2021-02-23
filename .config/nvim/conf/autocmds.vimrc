" This file contains all autocmds and autocmd groups

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

" Highlight the symbol and its references when holding the cursor
augroup coc_highlight
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
