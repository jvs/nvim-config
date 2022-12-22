" Install vim-plug if it's not found.
" From: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug '907th/vim-auto-save'
Plug 'akinsho/toggleterm.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kana/vim-arpeggio'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
"

" Utility function to roughly check if a plugin is loaded with vim-plug.
function! PlugLoaded(name)
    return (has_key(g:plugs, a:name)
        \ && isdirectory(g:plugs[a:name].dir)
        \ && stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction
