local has_toggleterm, toggleterm = pcall(require, "toggleterm")

if not has_toggleterm then
  vim.notify("toggleterm not found!")
  return
end

toggleterm.setup({
  direction = "float",
  open_mapping = [[<c-\>]],
})
