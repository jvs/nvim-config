vim.wo.spell = true
vim.opt_local.winbar = nil
vim.api.nvim_win_set_cursor(0, {1, 0})

if vim.fn.getline(1) == '' then
  vim.cmd 'startinsert!'
end
