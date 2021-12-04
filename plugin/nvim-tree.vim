let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_disable_window_picker = 1

lua << EOF
local ok, tree = pcall(require, 'nvim-tree')
if ok then
  tree.setup {
    open_on_setup = true,
    update_to_buf_dir = { enable = false }
  }
else
  print('nvim-tree plugin not found.')
end
EOF
