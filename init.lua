-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
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
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

  -- Detect tabstop and shiftwidth automatically.
  'tpope/vim-sleuth',

  -- LSP Configuration
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = { source = 'if_many', spacing = 2 },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local servers = {
        pyright = {},
      }

      require('mason-tool-installer').setup { ensure_installed = vim.tbl_keys(servers) }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
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
    event = 'VimEnter',
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
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
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


  -- broken at the moment;
  -- 'RRethy/vim-illuminate',

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
    opts = {
      commands = {
        "comment", "lualine", "neo-tree", "noice", "snacks",
        -- "toggleterm", 
        -- "zen-mode",
        -- "snacks-scratch", "snacks-picker",
      },
    },
  },

  -- Themes
  'EdenEast/nightfox.nvim',
  'Mofiqul/vscode.nvim',
  'folke/tokyonight.nvim',
  'neanias/everforest-nvim',
  'savq/melange-nvim',
  'shaunsingh/nord.nvim',
  'ramojus/mellifluous.nvim',

  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'rose-pine/neovim', name = 'rose-pine' },

  -- 'projekt0n/github-nvim-theme',
  -- {
  --   'neanias/everforest-nvim',
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   -- config = function()
  --   --   require('everforest').setup({
  --   --     -- Your config here
  --   --   })
  --   -- end,
  -- },

  -- Copilot
    'github/copilot.vim',

  -- Find and replace.
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      });
    end
  },

  -- Telescope Undo
  -- {
  --   "debugloop/telescope-undo.nvim",
  --   dependencies = { -- note how they're inverted to above example
  --     {
  --       "nvim-telescope/telescope.nvim",
  --       dependencies = { "nvim-lua/plenary.nvim" },
  --     },
  --   },
  --   keys = {
  --     { -- lazy style key map
  --       "<leader>u",
  --       "<cmd>Telescope undo<cr>",
  --       desc = "undo history",
  --     },
  --   },
  --   opts = {
  --     -- don't use `defaults = { }` here, do this in the main telescope spec
  --     extensions = {
  --       undo = {
  --         -- telescope-undo.nvim config, see below
  --       },
  --       -- no other extensions here, they can have their own spec too
  --     },
  --   },
  --   config = function(_, opts)
  --     -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
  --     -- configs for us. We won't use data, as everything is in it's own namespace (telescope
  --     -- defaults, as well as each extension).
  --     require("telescope").setup(opts)
  --     require("telescope").load_extension("undo")
  --   end,
  -- },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      rename = { enabled = true },
      scratch = { enabled = true },
      notifier = { enabled = true },

      indent = {
        enabled = false,
        -- TODO: Figure out why this doesn't seem to be working.
        only_scope = true,
        only_current = true,
      },

      toggle = { enabled = false },

      animate = { enabled = false },
      bufdelete = { enabled = false },
      dashboard = { enabled = false },
      debug = { enabled = false },
      dim = { enabled = false },
      explorer = { enabled = false },
      git = { enabled = false },
      gitbrowse = { enabled = false },
      image = { enabled = false },
      lazygit = { enabled = false },
      profiler = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = false },
      win = { enabled = false },
      words = { enabled = false },
      zen = { enabled = false },
    },
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

require "user.keymaps"
require "user.options"
