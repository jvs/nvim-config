local has_telescope, telescope = pcall(require, "telescope")
local has_noice, _ = pcall(require, "noice")

if has_telescope and has_noice then
  telescope.load_extension("noice")
end
