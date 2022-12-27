vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { noremap = true, silent = true })

-- Modes
--   normal_mode = 'n'
--   insert_mode = 'i'
--   visual_mode = 'v'
--   visual_block_mode = 'x'
--   term_mode = 't'
--   command_mode = 'c'

-- Toggle comments with ctrl+/.
vim.keymap.set('n', '<C-/>',
  function() require("Comment.api").toggle.linewise.current() end,
  { desc = 'Comment or uncomment line.' })

vim.keymap.set('v', '<C-/>',
  '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { desc = 'Comment or uncomment lines.' })


-- Create splits with <leader>\ and <leader>-.
vim.keymap.set('n', '<leader>\\', ':vsp<CR>', {
  desc = 'Vertical Split (side-by-side)'
})

vim.keymap.set('n', '<leader>-', ':sp<CR>', {
  desc = 'Horizontal Split (above and below)'
})

-- Navigate splits with <leader>[hjkl].
vim.keymap.set('n', '<leader>h', '<C-W><C-H>', { desc = 'Move to Left Split' })
vim.keymap.set('n', '<leader>j', '<C-W><C-J>', { desc = 'Move to Lower Split' })
vim.keymap.set('n', '<leader>k', '<C-W><C-K>', { desc = 'Move to Upper Split' })
vim.keymap.set('n', '<leader>l', '<C-W><C-L>', { desc = 'Move to Right Split' })

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

-- Cycle through buffers with H and L.
vim.keymap.set('n', '<S-l>', ':bnext<CR>', {
  desc = 'Go to the next buffer.',
})
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', {
  desc = 'Go to the previous buffer.',
})


-- Set undo breakpoints after typing certain characters.
vim.keymap.set('i', ',', ',<c-g>u', {})
vim.keymap.set('i', '.', '.<c-g>u', {})
vim.keymap.set('i', '(', '(<c-g>u', {})
vim.keymap.set('i', ')', ')<c-g>u', {})
vim.keymap.set('i', '<CR>', '<CR><c-g>u', {})

-- Move selected text up and down with alt+[jk].
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', {
  desc = 'Move selected text down one line.',
})
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', {
  desc = 'Move selected text up one line.',
})

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

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
