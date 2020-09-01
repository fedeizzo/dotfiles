let g:lsp_settings = {
\   'pyls': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\  'typescript-language-server': {
\     'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact'],
\   },
\  'nimlsp': {
\
\   }
\}

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'} " icons require GUI
let g:lsp_signs_hint = {'text': '?'} " icons require GUI
 
map  <Leader>x :LspCodeAction<CR>
nmap <Leader>x :LspCodeAction<CR>
map  <Leader>f :LspWorkspaceSymbol<CR>
nmap  <Leader>f :LspWorkspaceSymbol<CR>
map  <Leader>r :LspRename<CR>
nmap  <Leader>r :LspRename<CR>
map  gd :LspDeclaration<CR>
nmap  gd :LspPeekDeclaration<CR>
map  gp :LspPeekDeclaration<CR>
nmap  gp :LspPeekDeclaration<CR>
map  K :LspHover<CR>
nmap  K :LspHover<CR>
