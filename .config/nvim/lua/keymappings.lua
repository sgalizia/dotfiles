local utils = require('utils')

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
utils.map('i', '<tab>', "pumvisible() ? '<c-n>' : <SID>check_back_space() ? '<tab>' : coc#refresh()", { expr = true, silent = true })
utils.map('i', '<s-tab>', "pumvisible() ? '<c-p>' : '<c-h>'")
vim.api.nvim_exec(
[[

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

]]
, true)


CheckBackSpace = function ()
  local col = vim.fn.col('.') - 1
  return not col or vim.fn.getline('.')[col - 1] ~= 's'
end
