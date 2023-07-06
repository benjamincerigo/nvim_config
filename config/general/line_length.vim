" Set the line length for different file types
" Use gq to format a paragraph
augroup python_file
    autocmd!
    autocmd FileType python
        \ let &colorcolumn="100" |
        \ set textwidth=99 |
        \ set formatoptions-=t
augroup END
augroup markdown_file
    autocmd!
    autocmd FileType markdown
        \ let &colorcolumn="100" |
        \ set textwidth=99 |
        \ set formatoptions+=t
  augroup END
