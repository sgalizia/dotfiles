source $HOME/.config/nvim/conf/init.vimrc
source $HOME/.config/nvim/conf/general.vimrc
source $HOME/.config/nvim/conf/plugins.vimrc
source $HOME/.config/nvim/conf/keymaps.vimrc
source $HOME/.config/nvim/conf/autocmds.vimrc

" Fix for removing [] from around icons in NERDTree
" Leave here at the end of the file
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
