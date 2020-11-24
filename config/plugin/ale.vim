" -------------- ALE ------ "
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
nmap <silent> <leader>. <Plug>(ale_next_wrap)

let g:ale_linters = {
\ 'python': ['flake8', 'mypy', 'pylint', 'pyright', 'pydocstyle']
\}
