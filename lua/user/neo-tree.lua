require('neo-tree').setup {
  close_if_last_window = true,
  sort_case_insensitive = true,
  filesystem = {
    filtered_items = {
      always_show = {
        '.gitignore',
      },
    },
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = true,
  },
  window = {
    position = 'float',
    mappings = {
      ['<space>'] = false,
      ["<esc>"] = "close_window",
      ['c'] = {
        function(state)
          -- TODO: Find out the right way to get the relative path.
          local rootpath = state.path;
          local fullpath = state.tree:get_node():get_id()
          local is_relative = (fullpath:find(rootpath, 1, true) == 1)
          local relpath
          if is_relative then
            relpath = fullpath:sub(rootpath:len() + 2)
          else
            relpath = fullpath
          end
          vim.fn.setreg('+', relpath)
          print('Copied "' .. relpath .. '" to the clipboard.')
        end,
        -- TODO: Figure out how to specify the help text.
        -- desc = 'copy relative path',
      },
      ['C'] = {
        function(state)
          local fullpath = state.tree:get_node():get_id()
          vim.fn.setreg('+', fullpath)
          print('Copied "' .. fullpath .. '" to the clipboard.')
        end,
        -- TODO: Figure out how to specify the help text.
        -- desc = 'copy full path',
      },
      ["K"] = "close_node",
      -- ["J"] = "expand_all_nodes", -- This seems to be buggy at the moment.
    },
  },
}
