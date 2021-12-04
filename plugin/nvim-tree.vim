let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_disable_window_picker = 1

lua << EOF
require('nvim-tree').setup {
    open_on_setup = true,
    update_to_buf_dir = { enable = false }
}
EOF
