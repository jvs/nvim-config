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
    run = "source ~/.config/nvim/lua/user/packer.lua | PackerInstall",
    keywords = "packer install",
  },
  {
    title = "Remove Plugins",
    desc = "Source packer.lua and remove any deleted plugins.",
    run = "source ~/.config/nvim/lua/user/packer.lua | PackerClean",
    keywords = "packer clean",
  },
  {
    title = "Update Plugins",
    desc = "Source packer.lua and install any new plugins.",
    run = "source ~/.config/nvim/lua/user/packer.lua | PackerSync",
    keywords = "packer sync upgrade update",
  },
})
