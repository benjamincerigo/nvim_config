call plug#begin('~/.config/nvim/plugged')
" --- NERDCommenter ---- 
Plug 'preservim/nerdcommenter'

" --- Deoplete ---"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ------ ALE -----
Plug 'dense-analysis/ale'

" ---- FZF ----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- Jedi (python systax) ---
Plug 'deoplete-plugins/deoplete-jedi'

" ------ COLOUR ----
Plug 'wadackel/vim-dogrun'

" ------ Git commands ---
Plug 'tpope/vim-fugitive'

" ------ JS -------
"  From blog: https://www.vimfromscratch.com/articles/vim-for-javascript-and-react-in-2019/
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" ----- Important ----
let mapleader="\<Space>"
set tabstop=2 shiftwidth=2
set softtabstop=2
set expandtab
set bs=indent,eol,start
set autoindent
set ffs=unix,mac,dos
set number
set spell spelllang=en_gb
let g:LargeFile=10
filetype plugin indent on

" -------------------- Explorer Configurations ------"
" Make new panes open below and right, instead of above and left
set splitbelow
set splitright
" no banner
let g:netrw_banner=0
" Hiding files matching in explorer
" grabs regex from gitignore files that it can find also
let g:netrw_list_hide= '.*\.swp$,.*\.sw?$'    " netrw_gitignore#Hide() . !! This seems to be fucking up


" ----- COLOURS CONFIGURATION ---- "
colorscheme dogrun
set termguicolors

for f in split(glob('~/.config/nvim/config/general/*.vim'), '\n')
  exe 'source' f
endfor

for f in split(glob('~/.config/nvim/config/plugin/*.vim'), '\n')
  exe 'source' f
endfor

