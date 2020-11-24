" -------------- Deoplete ---- "
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ale', 'rank', 999)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

