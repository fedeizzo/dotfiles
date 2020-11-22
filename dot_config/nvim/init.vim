runtime! customScript/*.vim

call plug#begin('~/.local/share/nvim/plugged')

" utility plugins
Plug 'ryanoasis/vim-devicons'              " icon support
Plug 'itchyny/lightline.vim'               " status line bottom of the screen
Plug 'itchyny/vim-cursorword'              " underline same word over cursor
Plug 'rhysd/accelerated-jk'                " move quickly j and k for navigation 
Plug 'kshenoy/vim-signature'               " print mark on the left
Plug 'tpope/vim-commentary'                " comment everything
Plug 'tpope/vim-surround'                  " swap surround chars
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} " tag bar on the right
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}                   " focus mode
Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}            " count startup time
Plug 'mengelbrecht/lightline-bufferline'   " adds buffer top of the screen
Plug 'yggdroot/indentline'                 " draws indent line
Plug 'jiangmiao/auto-pairs'                " autoclose brackets
Plug 'unblevable/quick-scope'              " highlight unique char in word
Plug 'tpope/vim-fugitive'                  " better git integration

" languages plugins
Plug 'elzr/vim-json', { 'for': 'json' }                       " json support
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }             " markdown support
Plug 'kovetskiy/sxhkd-vim', {'for': 'sxhkd'}                 " sxhkd support
Plug 'alaviss/nim.nvim', { 'for': 'nim' }                    " nim support
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }                     " vimwiki
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " javascript
Plug 'mxw/vim-jsx', { 'for': 'javascript' } " jsx
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript
Plug 'cespare/vim-toml' " toml
Plug 'LnL7/vim-nix' " nix
Plug 'neovimhaskell/haskell-vim' " haskell

" colorchemes
Plug 'arcticicestudio/nord-vim'            " colorscheme

" snippet plugins
Plug 'hrsh7th/vim-vsnip'                   " snippet support
Plug 'hrsh7th/vim-vsnip-integ'             " lsp snippet support

" lua lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'steelsojka/completion-buffers'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'romgrk/nvim-treesitter-context'

" lua dap plugins
Plug 'mfussenegger/nvim-dap'

" start page
Plug 'mhinz/vim-startify'

call plug#end()

lua require('init')
runtime! plugins/*.vim
