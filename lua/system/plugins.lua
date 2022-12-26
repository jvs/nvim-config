-- Install packer.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end


-- Fail with an error if we can't require packer for some reason.
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  print 'Error loading plugins.lua: Failed to require packer.'
  return
end


-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}


-- Load plugins.
require('packer').startup(function(use)
  -- Package manager.
  use 'wbthomason/packer.nvim'

  -- Highlight, edit, and navigate code.
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  -- Additional text objects via treesitter.
  use { 
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- VSCode Theme.
  use 'Mofiqul/vscode.nvim'

  -- Status line.
  use 'nvim-lualine/lualine.nvim'

  -- Use "gc" to comment visual regions/lines.
  use 'numToStr/Comment.nvim' 

  -- Detect tabstop and shiftwidth automatically.
  use 'tpope/vim-sleuth' 

  -- Fuzzy Finder (files, lsp, etc).
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available.
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
  }

  -- Automatically save changes.
  use({
    'Pocco81/auto-save.nvim',
    config = function()
      require("auto-save").setup {
        debounce_delay = 500,
      }
    end,
  })

  -- Terminal windows.
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require("toggleterm").setup({
        direction = 'float',
        open_mapping = [[<c-\>]],
      })
    end
  }

  -- Tree explorer.
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    end,
  }



  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)


if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end


-- Automatically run :PackerCompile whenever plugins.lua is updated.
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-- Actually, for now just run the commands manually.
-- Type ":Packer" in command mode, and then press <TAB> to see the commands.
-- PackerClean
-- PackerCompile
-- PackerInstall
-- PackerLoad
-- PackerSnapshot
-- PackerSnapshotDelete
-- PackerSnapshotRollback
-- PackerStatus
-- PackerSync
-- PackerUpdate


require('Comment').setup()

