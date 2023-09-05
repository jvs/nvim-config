-- Use the commanderly commands "Install New Plugins" and "Update Plugins" to
-- install and update nvim plugins.
-- require "user.packer"

-- Temporary:
vim.opt.runtimepath:append("~/github/jvs/nvim-plugins/commanderly.nvim")
vim.opt.runtimepath:append("~/github/jvs/nvim-plugins/split-personality.nvim")
vim.opt.runtimepath:append("~/github/jvs/nvim-plugins/symbolism.nvim")
require('commanderly').setup()
require('split-personality').setup()
require('symbolism').setup()

require "user.commands"
require "user.keymaps"
require "user.options"
