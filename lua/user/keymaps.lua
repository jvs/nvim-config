vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { noremap = true, silent = true })


-- Toggle comments with ctrl+/.
vim.keymap.set('n', '<C-/>',
  function() require("Comment.api").toggle.linewise.current() end,
  { desc = 'Comment or uncomment line.' })

vim.keymap.set('v', '<C-/>',
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


-- Show the tree with <leader>t.
vim.keymap.set('n', '<leader>t', ':Neotree float reveal toggle<CR>', {
  desc = 'Toggle [T]ree',
})

vim.keymap.set('n', '<leader>gb', ':Neotree float buffers toggle<CR>', {
  desc = 'View current buffers as tree',
})

vim.keymap.set('n', '<leader>gs', ':Neotree float git_status toggle<CR>', {
  desc = 'View [G]it [S]tatus as tree',
})

-- Show the undo tree with ctrl+u.
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {
  desc = 'View [U]ndo tree.',
})


-- Toggle a floating terminal with ctrl+\.
-- To toggle a specific terminal, press a number key and the ctrl+\ (e.g. 2<c-\>).
-- Configured in user/toggleterm.lua.

-- Toggle terminals 1, 2, and 3 with ctrl+[jkh].
vim.keymap.set({ 'i', 'n' }, '<C-j>', '<CMD>1ToggleTerm<CR>', { desc = 'Toggle terminal-1.' })
vim.keymap.set({ 'i', 'n' }, '<C-k>', '<CMD>2ToggleTerm<CR>', { desc = 'Toggle terminal-2.' })
vim.keymap.set({ 'i', 'n' }, '<C-h>', '<CMD>3ToggleTerm<CR>', { desc = 'Toggle terminal-3.' })

function _switch_terminals(target_terminal)
  local current_buf = vim.api.nvim_get_current_buf()
  local current_terminal = vim.api.nvim_buf_get_var(current_buf, 'toggle_number')
  vim.cmd('ToggleTerm')

  if current_terminal ~= target_terminal then
    -- TODO: Figure out how to jump between terminals without leaving insert-mode
    -- in the destination terminal. For now, adding a delay seems to work.
    vim.defer_fn(function()
      vim.cmd(target_terminal .. 'ToggleTerm')
    end, 50)
  end
end

-- Toggle terminals from terminal mode.
vim.keymap.set('t', '<C-j>', '<CMD>lua _switch_terminals(1)<CR>',
  { desc = 'Toggle terminal-1.', noremap = true })

vim.keymap.set('t', '<C-k>', '<CMD>lua _switch_terminals(2)<CR>',
  { desc = 'Toggle terminal-2.', noremap = true })

vim.keymap.set('t', '<C-h>', '<CMD>lua _switch_terminals(3)<CR>',
  { desc = 'Toggle terminal-3.', noremap = true })


-- Set undo breakpoints after typing certain characters.
vim.keymap.set('i', ',', ',<c-g>u', {})
vim.keymap.set('i', '.', '.<c-g>u', {})
vim.keymap.set('i', '(', '(<c-g>u', {})
vim.keymap.set('i', ')', ')<c-g>u', {})
vim.keymap.set('i', '<CR>', '<CR><c-g>u', {})


-- Move selected text up and down with alt+[jk].
-- vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', {
--   desc = 'Move selected text down one line.',
-- })
-- vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', {
--   desc = 'Move selected text up one line.',
-- })


-- When pasting over selected text, don't put the selected text in the register.
vim.keymap.set('v', 'p', '"_dP', {})


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
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })


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
map("<S-l>", "next_buffer")
map("<S-h>", "previous_buffer")

-- Move between splits/windows.
map("<leader>h", "window_left")
map("<leader>j", "window_down")
map("<leader>k", "window_up")
map("<leader>l", "window_right")
