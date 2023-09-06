local has_commanderly, commanderly = pcall(require, "commanderly")
if not has_commanderly then
  vim.notify("commanderly not found!")
end

commanderly.add_commands({
})
