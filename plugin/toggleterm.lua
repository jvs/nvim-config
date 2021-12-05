local ok, toggleterm = pcall(require, 'toggleterm')
if ok then
  toggleterm.setup {
    open_mapping = [[<c-\>]],
  }

  local Terminal  = require('toggleterm.terminal').Terminal

  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
  })

  function _lazygit_toggle()
    lazygit:toggle()
  end
else
  print('toggleterm plugin not found')
end


