require('neo-tree').setup {
  close_if_last_window = true,
  sort_case_insensitive = true,
  filesystem = {
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = true,
  },
}
