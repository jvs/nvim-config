" Remap leader key.
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Make Y yank to the end of the line.
nnoremap Y y$

" Create splits with leader-slash and leader-dash.
nnoremap <leader>\ :vsp<CR>
nnoremap <leader>- :sp<CR>

" Navigate splits with leader-[hjkl].
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Comment lines with ctrl+/ (in normal mode and visual mode).
nmap <C-_> gcc
vmap <C-_> gc

" Toggle tree-explorer with leader-t.
nnoremap <leader>t :NvimTreeToggle<CR>

" Toggle the undo tree with leader-u.
nnoremap <leader>u :UndotreeToggle<CR>

" Open telescope with leader-[pfb*] or leader-vv.
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>* :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>vv :lua require('telescope.builtin').help_tags()<CR>

" Close things with leader-q.
nnoremap <silent> <leader>q :lua require('jvs.navigation').close_buffer()<CR>

" Switch between the last two buffers with leader-leader.
nnoremap <leader><leader> :lua require('jvs.navigation').toggle_buffers()<CR>

" Focus on text with leader-[123].
nnoremap <leader>1 :Goyo<CR>
nnoremap <leader>2 :Limelight<CR>
nnoremap <leader>3 :Limelight!<CR>
