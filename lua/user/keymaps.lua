local M = {}

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { noremap = true, silent = true })


-- Toggle comments with ctrl+/.
local comment_key = os.getenv("USING_WINTERM") and '<C-_>' or '<C-/>'

vim.keymap.set('n', comment_key,
  function() require("Comment.api").toggle.linewise.current() end,
  { desc = 'Comment or uncomment line.' })

vim.keymap.set('v', comment_key,
  '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { desc = 'Comment or uncomment lines.' })


-- Resize splits with alt+arrows.
vim.keymap.set('n', '<A-Up>', ':resize +2<CR>', {
  desc = 'Increase window height.',
})
vim.keymap.set('n', '<A-Down>', ':resize -2<CR>', {
  desc = 'Decrease window height.',
})
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', {
  desc = 'Decrease window width.',
})
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', {
  desc = 'Increase window width.',
})


-- Toggle a floating terminal with ctrl+\.
-- To toggle a specific terminal, press a number key and the ctrl+\ (e.g. 2<c-\>).
-- Configured in user/toggleterm.lua.

-- Toggle terminals 1, 2, and 3 with ctrl+[jkh].
vim.keymap.set({ 'i', 'n' }, '<C-j>', '<CMD>1ToggleTerm<CR>', { desc = 'Toggle terminal-1.' })
vim.keymap.set({ 'i', 'n' }, '<C-k>', '<CMD>2ToggleTerm<CR>', { desc = 'Toggle terminal-2.' })
vim.keymap.set({ 'i', 'n' }, '<C-h>', '<CMD>3ToggleTerm<CR>', { desc = 'Toggle terminal-3.' })

local function switch_terminals(target_terminal)
  local current_buf = vim.api.nvim_get_current_buf()
  local current_terminal = vim.api.nvim_buf_get_var(current_buf, 'toggle_number')
  vim.cmd('ToggleTerm')

  if current_terminal ~= target_terminal then
    vim.schedule_wrap(vim.cmd)(target_terminal .. 'ToggleTerm')
  end
end

-- Toggle terminals from terminal mode.
vim.keymap.set('t', '<C-j>', function() switch_terminals(1) end,
  { desc = 'Toggle terminal-1.', noremap = true })

vim.keymap.set('t', '<C-k>', function() switch_terminals(2) end,
  { desc = 'Toggle terminal-2.', noremap = true })

vim.keymap.set('t', '<C-h>', function() switch_terminals(3) end,
  { desc = 'Toggle terminal-3.', noremap = true })


-- Set undo breakpoints after typing certain characters.
vim.keymap.set('i', ',', ',<c-g>u', {})
vim.keymap.set('i', '.', '.<c-g>u', {})
vim.keymap.set('i', '(', '(<c-g>u', {})
vim.keymap.set('i', ')', ')<c-g>u', {})
vim.keymap.set('i', '<CR>', '<CR><c-g>u', {})


-- Highlight on yank. (Not exactly a keymapping, but close enough.)
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- When pasting over selected text, don't put the selected text in the register.
local function paste_over()
  -- Get the value of the yank register.
  local yanked = vim.fn.getreg('"')

  -- Execute the paste operation as normal.
  vim.api.nvim_feedkeys('p', 'n', false)

  -- Resore the value of the yank register immediately after this action
  -- is finished.
  vim.schedule_wrap(vim.fn.setreg)('', yanked)

  -- Note:
  -- There's a keymapping some people use to accomplish this:
  -- `vim.keymap.set('v', 'p', '"_dP', {})`
  -- The problem is that this key mapping does not work correctly when you're
  -- pasting over the last word on a line. It removes the space before the
  -- word. (Basically, in that case it should use "p" instead of "P".)
end

vim.keymap.set('v', 'p', paste_over, {})


-- Cut, copy, and paste using the clipboard.
vim.keymap.set('v', '<leader>x', '"*d', {
  desc = 'Cut the selected text and move it to the system clipboard.',
  noremap = true,
})

vim.keymap.set('v', '<leader>c', '"*y', {
  desc = 'Copy the selected text to the system clipboard.',
  noremap = true,
})

vim.keymap.set('n', '<leader>v', '"*p', {
  desc = 'Paste using the system clipboard.',
  noremap = true,
})


-- Stay in indent mode while changing indentation.
-- vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
-- vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })


local has_commanderly, commanderly = pcall(require, "commanderly")

if not has_commanderly then
  error("Remaining keymaps require commanderly.nvim")
end


vim.keymap.set('n', '<leader><leader>', commanderly.open, { desc = 'Open command palette' })


-- Create keymaps for commanderly commands.
local map = commanderly.map

-- Create splits with <leader>\ and <leader>-.
map("<leader>\\", "vertical_split")
map("<leader>-", "horizontal_split")

-- Cycle through buffers with shift+h and shift+l.
map("<S-h>", "split_personality_previous")
map("<S-l>", "split_personality_next")

-- Switch between buffers with <leader>e or <leader><tab>.
map("<leader>e", "split_personality_show_switcher")
map("<leader><tab>", "split_personality_show_switcher")

-- Close buffers with <leader>q.
map("<leader>q", "split_personality_close")

-- Move between splits/windows.
map("<leader>h", "window_left")
map("<leader>j", "window_down")
map("<leader>k", "window_up")
map("<leader>l", "window_right")

-- Show the tree with <leader>t.
map("<leader>t", "neotree_filesystem")
map("<leader>b", "neotree_buffers")

-- Show the undo tree with ctrl+u.
map("<leader>u", "undotree")

-- Telescope commands.
map("<leader>r", "telescope_git_files")
map("<leader>p", "telescope_find_files")
map("<leader>f", "telescope_live_grep")
map("<leader>8", "telescope_grep_string")
map("<leader>/", "telescope_current_buffer_fuzzy_find")

-- LSP commands.
-- (This function is called by after/plugin/lsp.lua.)
function M.on_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  local lmap = function(keys, command)
    commanderly.map(keys, command, opts)
  end

  lmap("[d", "previous_diagnostic")
  lmap("]d", "next_diagnostic")
end

return M
