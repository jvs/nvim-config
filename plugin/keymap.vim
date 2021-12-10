" Remap leader key.
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Make Y yank to the end of the line.
nnoremap Y y$

" Cut, copy, and paste using the clipboard with leader-[xcv].
vnoremap <leader>x "*d
vnoremap <leader>c "*y
nnoremap <leader>v "*p


" Go to start of line with leader-H and end of line with leader-L.
nnoremap <leader>H ^
xnoremap <leader>H ^
nnoremap <leader>L g_
xnoremap <leader>L g_

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

" Focus on text with leader-rr, leader-er, and leader-re.
nnoremap <leader>rr :Goyo<CR>
nnoremap <leader>er :Limelight<CR>
nnoremap <leader>re :Limelight!<CR>

" Open terminals with leader[1-8]
nnoremap <leader>1 :1ToggleTerm<CR>
nnoremap <leader>2 :2ToggleTerm<CR>
nnoremap <leader>3 :3ToggleTerm<CR>
nnoremap <leader>4 :4ToggleTerm<CR>
nnoremap <leader>5 :5ToggleTerm<CR>
nnoremap <leader>6 :6ToggleTerm<CR>
nnoremap <leader>7 :7ToggleTerm<CR>
nnoremap <leader>8 :8ToggleTerm<CR>

" Lazygit with leader-g.
nnoremap <leader>g :lua _lazygit_toggle()<CR>

" Chords.
if PlugLoaded('vim-arpeggio')
    call arpeggio#load()

    " Use jk as escape and df as colon.
    call arpeggio#map('cilnosvx', '', 0, 'jk', '<Esc>')
    call arpeggio#map('cilnosvx', '', 0, 'df', ':')
else
    echo "failed to load chords"
endif
