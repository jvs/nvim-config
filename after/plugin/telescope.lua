local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  vim.notify("telescope not found!")
  return
end

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
})

-- Enable telescope fzf native, if installed.
pcall(telescope.load_extension, "fzf")
