local has_commanderly, commanderly = pcall(require, "commanderly")
if not has_commanderly then
  vim.notify("commanderly not found!")
end

commanderly.setup()

commanderly.add_commands({
  -- Packer Commands.
  {
    title = "Install New Plugins",
    desc = "Source packer.lua and install any new plugins.",
    alias = "source ~/.config/nvim/lua/user/packer.lua | PackerInstall",
    keywords = "packer",
  },
  {
    title = "Update Plugins",
    desc = "Source packer.lua and install any new plugins.",
    alias = "source ~/.config/nvim/lua/user/packer.lua | PackerSync",
    keywords = "packer upgrade update sync",
  },
})
