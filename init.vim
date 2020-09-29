let mapleader="\<Space>"
" key set up
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


call plug#begin('~/.config/nvim/plugged')
" --- Deoplete ---"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ------ ALE -----
Plug 'dense-analysis/ale'

" ---- FZF ----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ------ COLOUR ----
Plug 'wadackel/vim-dogrun'
call plug#end()

" -------------- MAPPINGS ----------------
map <C-\> :Texplore<CR>
map <leader><y> :'<,'>!tee >(pbcopy)<CR>
" On 'nnoremap' see http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
" !!! Watch out for trailing white space !!!
" ##### Panning #####
" ## File nav and control ##
" Map <space-e> to open explorer on left pane
nnoremap <leader>e :call MakeEx(25)<cr>
" Map <space-w> to be write changes
nnoremap <leader>w :w<cr>
" Map <space-q> to be quit
nnoremap <leader>q :q<cr>
" Map <space-a> to be write changes and quit
nnoremap <leader>x :x<cr>
" Remove that such fucking annoying popup window ting
map q: :q
" Map <space> movements to changing panes
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
" Resizing short cuts
nnoremap <silent> <leader>f :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>d :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
" copy relative path to clipboard
nnoremap <leader>c :let @+=fnamemodify(expand("%"), ":~:.")<CR>
" # Normalises widths # of open buffers - except if one has been fixed
fun! NormalizeWidths()
    let eadir_pref = &eadirection
    set eadirection=hor
    set equalalways! equalalways!
    let &eadirection = eadir_pref
endf
" # Autocalls normalize when using 'v' from netrw
augroup NetrwGroup
    autocmd! BufEnter * call NormalizeWidths()
augroup END
" ### Make Explore Smart ###
fun! MakeEx(vex_width)
    if exists("t:netrw_lexbufnr")
        execute "Lexplore"
        call NormalizeWidths()
    else
        execute "Lexplore"
        execute "vertical resize" . a:vex_width
        set winfixwidth
        call NormalizeWidths()
    endif
endf

" -------------------- Explorer Configurations ------"
" Make new panes open below and right, instead of above and left
set splitbelow
set splitright
" no banner
let g:netrw_banner=0
" Hiding files matching in explorer
" grabs regex from gitignore files that it can find also
let g:netrw_list_hide= '.*\.swp$,.*\.sw?$'    " netrw_gitignore#Hide() . !! This seems to be fucking up


" -------------- ALE ------ "
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
nmap <silent> <leader>. <Plug>(ale_next_wrap)

" -------------- Deoplete ---- "
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

" ------ SPELL CHECK -----
" ]s, z=, zg are the commands that you need.
" Open the list of added words
nnoremap <leader>z :vsp ~/.config/nvim/spell/en.utf-8.add<CR>


" ---- FZF ----
nnoremap <leader>p :Files<CR>

" ----- COLOURS CONFIGURATION ---- "
colorscheme dogrun
set termguicolors
