" Color scheme.
let g:vscode_style = "dark"
colorscheme vscode

lua require('lualine').setup { options = { theme = 'vscode' } }

" Use the commands :Light and :Dark to change the current style.
command! Light lua require('vscode').change_style("light")
command! Dark lua require('vscode').change_style("dark")
