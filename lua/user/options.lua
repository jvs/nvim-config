vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.tabstop = 4
vim.opt.timeoutlen = 2000
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.exrc = true
vim.opt.smartindent = false
vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- Newer changes:
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.inccommand = 'split'

vim.o.autoindent = true
vim.o.autowrite = true
vim.o.autowriteall = true
vim.o.colorcolumn = '80,100'
vim.o.expandtab = true
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.list = true
vim.o.listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:␣,trail:·'
vim.o.modeline = false
vim.o.modelines = 0
vim.o.mouse = 'a'
vim.o.report = 0
vim.o.scrolloff = 2
vim.o.shiftround = true
vim.o.spell = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.synmaxcol = 250
vim.o.title = true
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.undofile = true
vim.o.visualbell = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.number = true
vim.wo.relativenumber = true

-- Use the line number column for diagnostics.
-- vim.wo.signcolumn = 'number'

-- Show diagnostics to the left of the line numbers.
vim.wo.signcolumn = 'yes:1'
-- vim.wo.signcolumn = 'auto:1'

vim.o.autoread = true

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
-- This breaks the command-line window:
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
--   command = "if mode() != 'c' | checktime | endif",
--   pattern = { "*" },
-- })

-- vim.o.laststatus = 2
-- vim.o.tabstop = 4
-- vim.o.shiftwidth = 4
-- vim.o.softtabstop = 4
-- vim.opt.smartindent = true
-- vim.o.undodir = '~/.nvim/undodir'
-- wrapscan
-- vim.opt.fileencoding = "utf-8"

-- autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
-- autocmd FileType lua setlocal shiftwidth=2 tabstop=2

-- Ignore the default colorschemes:
vim.opt.wildignore:append({
  "blue.vim",
  "darkblue.vim",
  "delek.vim",
  "desert.vim",
  "elflord.vim",
  "evening.vim",
  "industry.vim",
  "habamax.vim",
  "koehler.vim",
  "lunaperche.vim",
  "morning.vim",
  "murphy.vim",
  "pablo.vim",
  "peachpuff.vim",
  "quiet.vim",
  "ron.vim",
  "shine.vim",
  "slate.vim",
  "sorbet.vim",
  "retrobox.vim",
  "torte.vim",
  "wildcharm.vim",
  "zaibatsu.vim",
  "zellner.vim",
})
