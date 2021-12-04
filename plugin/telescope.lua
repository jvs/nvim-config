local ok, telescope = pcall(require, 'telescope')
if ok then
  telescope.setup {
    defaults = {
      file_sorter = require('telescope.sorters').get_fzy_sorter,
      sorting_strategy = 'ascending',
      layout_config = {
        prompt_position = 'top',
      },
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  }

  telescope.load_extension('fzy_native')
else
  print('telescope plugin not found.')
end
