" You can use other key to expand snippet.
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <C-k> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <C-k> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
let g:vsnip_snippet_dir = expand('~/.config/nvim/snippet')
