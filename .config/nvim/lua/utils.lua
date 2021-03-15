local utils = {}
local api = vim.api
local fn = vim.fn
local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

_G.tab_complete = function()
  if fn.pumvisible() == 1 then
    return utils.t "<c-n>"
  elseif utils.check_back_space() then
    return utils.t "<tab>"
  else
    return fn['coc#refresh()']
  end
end

_G.s_tab_complete = function()
  if fn.pumvisible() == 1 then
    return utils.t "<c-p>"
  else
    return utils.t "<c-h>"
  end
end

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

function utils.t(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

function utils.check_back_space()
  local col = fn.col('.') - 1
  if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

return utils

