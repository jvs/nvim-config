local has_zen_mode, zen_mode = pcall(require, "zen-mode")

if not has_zen_mode then
  vim.notify("zen-mode not found!")
  return
end

zen_mode.setup({
  window = {
    backdrop = 1,
    width = 95,
    options = {
      colorcolumn = "",
      cursorline = false,
      number = false,
      relativenumber = false,
      signcolumn = "no",
    },
  },
})
