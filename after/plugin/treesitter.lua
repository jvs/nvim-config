local has_ts_configs, ts_configs = pcall(require, "nvim-treesitter.configs")

if not has_ts_configs then
  vim.notify("nvim-treesitter.configs not found!")
  return
end

ts_configs.setup({
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "cpp",
    "git_rebase",
    "gitcommit",
    "gitignore",
    "go",
    "java",
    "lua",
    "markdown",
    "python",
    "regex",
    "rust",
    "sql",
    "typescript",
    "vim",
    "yaml",
  },

  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<c-backspace>",
    },
  },
})
