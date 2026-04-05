local has_commanderly, commanderly = pcall(require, "commanderly")

if has_commanderly then
  commanderly.run("enable_spell_check")
  commanderly.run("hide_winbar")
  -- commanderly.run("show_simple_statusline")
end

vim.cmd("colorscheme vscode")
vim.api.nvim_win_set_cursor(0, {1, 0})

if vim.fn.getline(1) == '' then
  vim.cmd 'startinsert!'
end
