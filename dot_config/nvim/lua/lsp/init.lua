local on_attach_ls = function(client)
  require'completion'.on_attach(client)
end

-- python
require'nvim_lsp'.pyls.setup{on_attach=on_attach_ls}

-- bash
require'nvim_lsp'.bashls.setup{on_attach=on_attach_ls}

-- c/c+=
require'nvim_lsp'.ccls.setup{on_attach=on_attach_ls}

-- dokcer
require'nvim_lsp'.dockerls.setup{on_attach=on_attach_ls}

--haskell
require'nvim_lsp'.hls.setup{on_attach=on_attach_ls}

--typescript/javascript
require'nvim_lsp'.tsserver.setup{on_attach=on_attach_ls}

--treesitter
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
    },
    indent = { enable = true },
    refactor = {
        highlight_definitions = { enable = false },
        highlight_current_scope = { enable = false },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "<leader>r",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
}
