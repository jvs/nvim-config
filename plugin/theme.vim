" Color scheme.
let g:vscode_style = "dark"
silent! colorscheme vscode

lua << EOF
local ok, lualine = pcall(require, 'lualine')
if ok then
  lualine.setup { options = { theme = 'vscode' } }
else
  print('lualine plugin not found.')
end
EOF

" Use the commands :Light and :Dark to change the current style.
command! Light lua require('vscode').change_style("light")
command! Dark lua require('vscode').change_style("dark")
