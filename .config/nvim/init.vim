" ===== neovim configs =====

:set path+=**

:set wildmode=longest,list,full
:set wildmenu

:set wildignore+=*.pyc
:set wildignore+=*_build/*
:set wildignore+=**/coverage/*
:set wildignore+=**/node_modules/*
:set wildignore+=**/android/*
:set wildignore+=**/ios/*
:set wildignore+=**/.git/*

:set number
:set relativenumber
:set autoindent

:autocmd Filetype c setlocal tabstop=8 shiftwidth=8 softtabstop=8
:autocmd Filetype go setlocal tabstop=8 shiftwidth=8 softtabstop=8

:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set expandtab
:set smartindent
:set nowrap

:set guicursor=
:set nohlsearch
:set hidden
:set noerrorbells
:set incsearch
:set scrolloff=8

:set mouse=a
:set signcolumn=yes
:set colorcolumn=80
:set cmdheight=1
:set encoding=UTF-8

:set inccommand=split " %s/word/new-word/g

" History (check later)
":set noswapfile
":set nobackup
":set undodir=~/.vim/undodir
":set undofile


" ===== plugins =====

call plug#begin()

" https://github.com/junegunn/vim-plug
" Reload init.vim and :PlugInstall to install plugins.

Plug 'https://github.com/vim-airline/vim-airline' " vim-airline
Plug 'https://github.com/preservim/nerdtree'      " nerdtree
Plug 'https://github.com/ryanoasis/vim-devicons'  " vim-devicons
Plug 'https://github.com/cohama/lexima.vim'       " lexima autoclose {,(...
"Plug 'https://github.com/airblade/vim-gitgutter'  " vim-gitgutter

Plug 'kyazdani42/nvim-web-devicons' " required for barbar
Plug 'romgrk/barbar.nvim' " barbar

Plug 'nvim-lua/plenary.nvim' " required for nvim-telescope
Plug 'nvim-telescope/telescope.nvim' " nvim-telescope

Plug 'gruvbox-community/gruvbox' " gruvbox theme

" check later
" https://github.com/josa42/coc-go
" https://github.com/clangd/coc-clangd
" https://www.youtube.com/watch?v=UsgZ1V9KiUg

" cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

" LSP
Plug 'neovim/nvim-lspconfig'

call plug#end()

" ===== lua.init =====

:lua require('matheusmv.init')


" ===== colors & themes =====

colorscheme gruvbox
highlight Normal ctermbg=none
highlight NonText ctermbg=none


" ===== key-maps & settings =====

let mapleader = "\<space>"


" ===== vim-airline settings =====

let g:airline_powerline_fonts = 1


" ===== nerdtree settings =====

nnoremap <leader>d :NERDTreeFocus<CR>
nnoremap <leader>d :NERDTreeToggle<CR>

"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'


" ===== barbar settings =====

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used


" ===== nvim-telescope settings =====

nnoremap <leader>f :Telescope find_files disable_devicons=true<CR>


" ===== cmp settings =====

set completeopt=menu,menuone,noselect


" ===== trim white spaces =====

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ARCHX64
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
