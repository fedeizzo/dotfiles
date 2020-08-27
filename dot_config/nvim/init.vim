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
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

nnoremap <silent> <Leader>o :call fzf#vim#files(RootFolder())<CR>
nnoremap <silent> <Leader>O :bufdo bd<CR>

" new tab
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" save & quit shortcut
nnoremap <silent> <Leader>a :w<CR>
nnoremap <silent> <Leader>q :q<CR>

" Goyo keybind
nnoremap <Leader>g :Goyo<CR>

" autocmd group
augroup mm_buf_cmds
    autocmd!
    autocmd BufWritePost *.vim source %
    autocmd BufWritePost *.cpp silent :LspDocumentFormat
    autocmd BufWritePost *.c silent :LspDocumentFormat
    autocmd BufWritePost *.ts silent :LspDocumentFormat
    autocmd BufWritePost *.py silent :LspDocumentFormat
    au BufNewFile,BufRead *.py set foldmethod=indent
    au BufNewFile,BufRead *.py set autoindent
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
Plug 'macthecadillac/axe', {'on': 'Axe'}   " async command support
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}                   " focus mode
Plug '/usr/bin/fzf'                        " fuzzy finder support
Plug 'junegunn/fzf.vim'                    " fuzzy finder support
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

" colorchemes
Plug 'arcticicestudio/nord-vim'            " colorscheme

" lsp plugins 
Plug 'prabirshrestha/vim-lsp'              " lsp support
Plug 'prabirshrestha/async.vim'            " async lsp support
Plug 'mattn/vim-lsp-settings'              " lsp settings preconfigured


" autocomplete plugins
Plug 'prabirshrestha/asyncomplete.vim'     " async autocomplete
Plug 'prabirshrestha/asyncomplete-lsp.vim' " async lsp autocomplete

" snippet plugins
Plug 'hrsh7th/vim-vsnip'                   " snippet support
Plug 'hrsh7th/vim-vsnip-integ'             " lsp snippet support

call plug#end()

" Colorscheme configuration
set termguicolors
colorscheme nord

" load config settings
runtime! plugins/*.vim
