local M = {}

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { noremap = true, silent = true })


-- Set undo breakpoints after typing certain characters.
vim.keymap.set('i', ',', ',<c-g>u', {})
vim.keymap.set('i', '.', '.<c-g>u', {})
vim.keymap.set('i', '(', '(<c-g>u', {})
vim.keymap.set('i', ')', ')<c-g>u', {})
vim.keymap.set('i', '<CR>', '<CR><c-g>u', {})


-- Highlight on yank. (Not exactly a keymapping, but close enough.)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = vim.highlight.on_yank,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})


local has_commanderly, commanderly = pcall(require, "commanderly")

if not has_commanderly then
  error("Remaining keymaps require commanderly.nvim")
end


vim.keymap.set('n', '<leader><leader>', commanderly.open, {desc = 'Open command palette'})
vim.keymap.set('v', '<leader><leader>', commanderly.open, {desc = 'Open command palette'})


-- Create keymaps for commanderly commands.
local map = commanderly.map


-- Cut, copy, and paste using the clipboard.
map("<leader>x", "cut_to_clipboard")
map("<leader>c", "copy_to_clipboard")
map("<leader>v", "paste_from_clipboard")
map("<leader>v", "paste_from_clipboard_over_selection")
map("p", "paste_over_selection")

-- Create splits with <leader>\ and <leader>-.
map("<leader>\\", "vertical_split")
map("<leader>-", "horizontal_split")

-- Cycle through buffers with shift+h and shift+l.
map("<S-h>", "split_personality_previous")
map("<S-l>", "split_personality_next")

-- Switch between buffers with <leader>e.
map("<leader>e", "split_personality_show_switcher")
-- map("<leader><tab>", "split_personality_show_switcher")

-- Close buffers with <leader>w.
map("<leader>w", "split_personality_close")

-- Close splits/windows with <leader>q.
map("<leader>q", "close_window")

-- Move between splits/windows.
map("<leader>h", "window_left")
map("<leader>j", "window_down")
map("<leader>k", "window_up")
map("<leader>l", "window_right")

-- Resize splits with alt+arrows.
map("<A-Up>", "increase_window_height")
map("<A-Down>", "decrease_window_height")
map("<A-Left>", "decrease_window_width")
map("<A-Right>", "increase_window_width")

-- Show the tree with <leader>t.
map("<leader>t", "neotree_filesystem")
map("<leader>b", "neotree_buffers")

-- Show the undo tree with ctrl+u.
-- map("<leader>u", "undotree")

-- Telescope commands.
map("<leader>o", "telescope_git_files")
map("<leader>p", "telescope_find_files")
map("<leader>f", "telescope_live_grep")
map("<leader>8", "telescope_grep_string")
map("<leader>/", "telescope_current_buffer_fuzzy_find")
map("<leader>r", "telescope_resume")

-- Toggle terminals 1, 2, 3, and 4 with ctrl+[jkhl].
map("<C-j>", "toggle_terminal_1", { mode = { "i", "n", "t" } })
map("<C-h>", "toggle_terminal_2", { mode = { "i", "n", "t" } })
map("<C-k>", "toggle_terminal_3", { mode = { "i", "n", "t" } })
map("<C-l>", "toggle_terminal_4", { mode = { "i", "n", "t" } })

-- Toggle comments with ctrl+/.
map("<C-_>", "toggle_comment_current_line")
map("<C-/>", "toggle_comment_current_line")
map("<C-_>", "toggle_comment_selected_lines")
map("<C-/>", "toggle_comment_selected_lines")

-- LSP commands.
-- (This function is called by after/plugin/lsp.lua.)
function M.on_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  local lmap = function(keys, command)
    commanderly.map(keys, command, opts)
  end

  -- lmap("gr", "lsp_rename_symbol")
  -- lmap("gd", "telescope_lsp_definitions")
  -- lmap("gf", "telescope_lsp_references")
  -- lmap("gt", "telescope_lsp_type_definitions")

  lmap("[d", "previous_diagnostic")
  lmap("]d", "next_diagnostic")
end

return M
