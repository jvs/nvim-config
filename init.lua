-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local using_winterm = os.getenv('USING_WINTERM') ~= nil

local plugins = {
  'nvim-tree/nvim-web-devicons',

  -- Detect tabstop and shiftwidth automatically.
  'tpope/vim-sleuth',

  -- Database plugins.
  'tpope/vim-dadbod',
  -- 'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',


  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      'folke/neodev.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Status line.
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
  },

  -- Automatically save changes.
  {
    'Pocco81/auto-save.nvim',
    opts = {
      debounce_delay = 1000,
      execution_message = {
        message = "",
        dim = 0.18,
        cleaning_interval = 1250,
      },
    },
  },

  -- Terminal windows.
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = false,
    opts = {
      direction = "float",
      open_mapping = [[<c-\>]],
    },
  },

  -- Tree explorer.
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  },

  'folke/zen-mode.nvim',
  'mbbill/undotree',
  'RRethy/vim-illuminate',

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- 'rcarriga/nvim-notify',
    },
  },

  {
    'f-person/git-blame.nvim',
    opts = {
      date_format = '%r',
      display_virtual_text = 0,
    },
  },

  'romainl/vim-cool',

  'jvs/split-personality.nvim',

  {
    'jvs/commanderly.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = true,
  },

  -- Themes
  'Mofiqul/vscode.nvim',
  'EdenEast/nightfox.nvim',
  { 'rose-pine/neovim', name = 'rose-pine' },

  -- Copilot
  {
    'github/copilot.vim',
    enabled = using_winterm,
  },

  -- Clipboard (for Windows Terminal)
  {
    'ojroques/nvim-osc52',
    enabled = using_winterm,
  },
}


local lazy_opts = {
  dev = {
    path = "~/github/jvs/nvim-plugins/",
    patterns = {"jvs/"},
    fallback = true,
  },
}

require('lazy').setup(plugins, lazy_opts)

require "user.commands"
require "user.keymaps"
require "user.options"
