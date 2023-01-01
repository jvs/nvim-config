local colorscheme = 'vscode'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end


local function get_time()
  local time = os.date("*t")
  return ("%02d:%02d"):format(time.hour, time.min)
end


require('lualine').setup {
  options = {
    theme = 'vscode',
  },
  sections = {
    lualine_c = {{
      "filename",
      path = 1,
      show_modified_status = false,
    }},
    lualine_x = {'filetype'},
    lualine_z = {'location', get_time},
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
