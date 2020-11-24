" -------------- MAPPINGS ----------------
map <C-\> :Texplore<CR>
" Map <space-y> to copy to gnome clipboard
" Based on https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p
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
" Map <space-x> to be write changes and quit
nnoremap <leader>x :x<cr>
" Map <space-r> to reload page 
nnoremap <leader>r :e!<cr>
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
" last visual shape reselect
noremap gV `[v`]
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
