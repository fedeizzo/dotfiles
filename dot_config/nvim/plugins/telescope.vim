nnoremap <silent> <Leader>o :lua require'telescope.builtin'.git_files{}<CR>
" nnoremap <silent> <Leader>O :lua require'telescope.builtin'.find_files{cwd=RootFinder()}

nnoremap <silent> <Leader>f :lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <silent> <Leader>F :lua require'telescope.builtin'.grep_string{search=true}<CR>

" TODO guardare treesitter che sembra un botto interessante
" TODO guardare le funzioni di telescope riguardanti lsp
