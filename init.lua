-- Use the commanderly commands "Install New Plugins" and "Update Plugins" to
-- install and update nvim plugins.
-- require "user.packer"

-- Temporary:
vim.opt.runtimepath:append("~/github/jvs/commanderly.nvim")

require "user.commands"
require "user.keymaps"
require "user.options"
