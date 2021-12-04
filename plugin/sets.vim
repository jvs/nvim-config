set autoindent
set autowrite
set autowriteall

" Use the OS clipboard by default.
" See: https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
" set clipboard^=unnamed,unnamedplus

set colorcolumn=80,100
set expandtab
set hidden
set laststatus=2
set list
set modelines=0
set mouse=a
set nobackup
set nohlsearch
set nomodeline
set noswapfile
set nowrap
set number
set relativenumber
set report=0
set scrolloff=2
set shiftround
set shiftwidth=4

" set signcolumn=yes
" set smartindent

set splitbelow
set splitright
set synmaxcol=200
set tabstop=4 softtabstop=4

set title

set undodir=~/.nvim/undodir
set undofile
set visualbell
set wrapscan

" Required by nvim-tree.
set termguicolors

" Use two spaces for Lua and JavaScript files.
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2

" Set undo breakpoints after typing certain characters.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap <CR> <CR><c-g>u


" Show special characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:␣,trail:·'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.,trail:-'
endif

