local has_leap, leap = pcall(require, "leap")
if not has_leap then
  vim.notify("leap not found!")
  return
end

leap.add_default_mappings()
