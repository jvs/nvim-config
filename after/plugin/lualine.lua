local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
  vim.notify("lualine not found!")
  return
end

local has_noice, noice = pcall(require, "noice")
local lualine_x = {}

if has_noice then
  lualine_x = { {
      noice.api.status.mode.get,
      cond = noice.api.status.mode.has,
      color = { fg = "#ff9e64" },
  } }
end

lualine.setup({
  options = {
    theme = "auto",
  },
  sections = {
    lualine_c = { {
      "filename",
      path = 1,
      show_modified_status = false,
    } },
    lualine_x = lualine_x,
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
})
