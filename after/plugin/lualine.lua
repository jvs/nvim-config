local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
  vim.notify("lualine not found!")
  return
end

local function get_time()
  local time = os.date("*t")
  return (" %02d:%02d"):format(time.hour, time.min)
end

lualine.setup({
  options = {
    theme = "vscode",
  },
  sections = {
    lualine_c = { {
      "filename",
      path = 1,
      show_modified_status = false,
    } },
    lualine_x = { "filetype" },
    lualine_y = { "location" },
    lualine_z = { get_time },
  },
})
