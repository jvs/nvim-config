vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      local cwd = vim.fn.getcwd()

      if cwd:match("/kit/todo") then
        vim.o.colorcolumn = ""
        vim.cmd("colorscheme mellifluous")

      elseif cwd:match("/kit/junk") then
        vim.cmd("colorscheme melange")

      elseif cwd:match("/kit/notes") then
        vim.cmd("colorscheme nord")
      end
    end)
  end,
})
