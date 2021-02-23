" This file contains all my keymaps that I have set up

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

" Map sourcing profile
nnoremap <leader>sp :source<space>$HOME/.config/nvim/init.vim<cr>

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
nnoremap <silent> <leader>nh :let @/ = ""<cr>
