local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if ok then
  treesitter.setup {
    ensure_installed = 'maintained',
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
else
  print('nvim-treesitter plugin not found.\n')
end
