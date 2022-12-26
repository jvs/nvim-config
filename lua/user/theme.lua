local colorscheme = 'vscode'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    -- icons_enabled = true,
    theme = 'vscode',
    -- component_separators = '|',
    -- section_separators = '',
  },
}

-- Highlight on yank.
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
