vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      local full_path = vim.api.nvim_buf_get_name(0)

      if full_path:find("/var/") and full_path:match("%.pi%.md$") then
        vim.o.colorcolumn = ""
        vim.cmd("colorscheme tokyonight-storm")

        local has_commanderly, commanderly = pcall(require, "commanderly")

        if has_commanderly then
          commanderly.run("enable_word_wrap")
          commanderly.run("enable_spell_check")
          commanderly.run("hide_winbar")
          commanderly.run("show_simple_statusline")
        end

        if not has_commanderly and not vim.o.wrap then
          vim.o.wrap = true
        end

        -- Start at the beginning of the file in insert mode.
        vim.api.nvim_win_set_cursor(0, {1, 0})

        if vim.fn.getline(1) == '' then
          vim.cmd 'startinsert!'
        end
      end
    end)
  end,
})
