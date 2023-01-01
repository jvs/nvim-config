local has_zen_mode, zen_mode = pcall(require, "zen-mode")

if not has_zen_mode then
  return
end

-- local tz_colorcolumn

zen_mode.setup {
  window = {
    backdrop = 1,
    width = 95,
    options = {
      cursorline = false,
      number = false,
      relativenumber = false,
      colorcolumn = "",
    },
  },

  -- on_open = function(win)
   -- tz_colorcolumn = vim.o
  -- end,

  -- on_close = function(win)
  -- end,
}
