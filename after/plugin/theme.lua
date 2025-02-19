local has_mellifluous, mellifluous = pcall(require, "mellifluous")
if has_mellifluous then
  mellifluous.setup()
end


local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
