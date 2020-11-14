" ##########################################
" CLASSIC VIM CONFIG
" ##########################################
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

runtime! customScript/*.vim

" disable vi compatibily
set nocompatible

" set path to load all file in directory
set path+=**

" display all mathcing file during tab complete
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
endif
inoremap <Tab> <C-X><C-F>
 
" intendt options
set autoindent
set smartindent

" tab options
set tabstop=4
set shiftwidth=4
set expandtab
set showtabline=2
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" fold options
set nofoldenable

" show keystroke currently entering
set showcmd

" set mapleader to space
let mapleader=' '

" highlight syntax
syntax on
filetype plugin on

" line number
set number
set relativenumber

" enable mouse navigation
set mouse=a

" new tab appear
set splitbelow

" highlight for shearching
set hlsearch

" add spellcheck
set spelllang+=it
set spell

" ##########################################
" custom classic vim config
" ##########################################
" change esc button to jk in inser mode
imap jk <Esc>zz

" remove highlight for searching
nnoremap <silent> <Leader>h :noh<CR>

" remap for clipboard register
nnoremap  <Leader>y "+
vnoremap  <Leader>y "+y<CR>

" add automatic output
nnoremap <silent> <Leader>c :call AutomaticOutput()<CR>

" fzf files open
" let $FZF_DEFAULT_OPTS='--layout=reverse'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" nnoremap <silent> <Leader>o :call fzf#vim#files(RootFolder())<CR>
" nnoremap <silent> <Leader>O :bufdo bd<CR>

" new tab
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" save & quit shortcut
nnoremap <silent> <Leader>a :w<CR>
nnoremap <silent> <Leader>q :q<CR>

" change split navigatin
nnoremap  <C-h> <C-w><C-h>
nnoremap  <C-j> <C-w><C-j>
nnoremap  <C-k> <C-w><C-k>
nnoremap  <C-l> <C-w><C-l>

" Goyo keybind
nnoremap <Leader>g :Goyo<CR>

" autocmd group
augroup mm_buf_cmds
    autocmd!
    autocmd BufWritePost *.vim source %
    autocmd BufWritePost *.cpp silent lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePost *.c silent lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePost *.ts silent lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePost *.py silent lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePost *.hs silent lua vim.lsp.buf.formatting_sync()
    " au BufNewFile,BufRead *.py set foldmethod=indent
    au BufNewFile,BufRead *.py set autoindent
    autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype vimwiki silent nnoremap <silent> <Leader>d :call ToggleTask()<CR>
    autocmd Filetype vimwiki silent nnoremap <silent> <Leader>b :!pdfPreview "%:p"<CR>
    autocmd FileType fzf set nonu nornu
augroup end

" ##########################################
" plugin installation
" ##########################################
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

call plug#end()

" Colorscheme configuration
set termguicolors
colorscheme nord

" load config settings
runtime! plugins/*.vim

lua require("lsp")
setlocal omnifunc=v:lua.vim.lsp.omnifunc
