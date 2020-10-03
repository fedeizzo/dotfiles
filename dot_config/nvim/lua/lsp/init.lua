local on_attach_ls = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

-- python
require'nvim_lsp'.pyls.setup{on_attach=on_attach_ls}

-- bash
require'nvim_lsp'.bashls.setup{on_attach=on_attach_ls}

-- c/c+=
require'nvim_lsp'.ccls.setup{on_attach=on_attach_ls}

-- dokcer
require'nvim_lsp'.dockerls.setup{on_attach=on_attach_ls}
