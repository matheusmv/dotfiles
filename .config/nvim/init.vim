" ****************************************************************************
" *** Configs
" ****************************************************************************

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
:autocmd BufRead,BufNewFile *.h,*.c set filetype=c
:autocmd Filetype go setlocal tabstop=8 shiftwidth=8 softtabstop=8

:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set expandtab
:set smartindent
:set nowrap

:set ignorecase
:set smartcase

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
:set encoding=utf-8

:set inccommand=split " %s/word/new-word/g

:set nobackup
:set nowritebackup
:set directory=~/.vim/swapdir
:set undodir=~/.vim/undodir

:set updatetime=300


" ****************************************************************************
" *** Plugins
" ****************************************************************************

call plug#begin()

    " vim-airline
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/vim-airline/vim-airline-themes'

    " nerdtree
    Plug 'https://github.com/preservim/nerdtree'

    " devicons
    "Plug 'https://github.com/ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    " lexima
    Plug 'https://github.com/cohama/lexima.vim'

    " vim-fugitive
    Plug 'https://github.com/tpope/vim-fugitive'

    " vim-gitgutter
    Plug 'https://github.com/airblade/vim-gitgutter'

    " barbar
    Plug 'romgrk/barbar.nvim'

    " indentLine
    Plug 'https://github.com/Yggdroot/indentLine'

    " nvim-telescope
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'

    " gruvbox theme
    Plug 'gruvbox-community/gruvbox'

    " cmp
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'L3MON4D3/LuaSnip'

    " lsp
    Plug 'neovim/nvim-lspconfig'

call plug#end()

:lua require('matheusmv.init')


" ****************************************************************************
" *** Colors & Themes
" ****************************************************************************

colorscheme gruvbox
highlight Normal ctermbg=none
highlight NonText ctermbg=none


" ****************************************************************************
" *** Maps & Settings
" ****************************************************************************

let mapleader = "\<space>"

" Save file
nnoremap <leader>w :w<CR>

" Remap Ctrl+c to Esc
nmap <C-c> <esc>
imap <C-c> <esc>
vmap <C-c> <esc>
omap <C-c> <esc>

" Move between buffers
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Relative numbering
fun! NumberToggle()
    if (&relativenumber == 1)
        set nornu
        set number
    else
        set rnu
    endif
endfun

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<CR>

" Disable arrow keys
for key in [ '<Up>', '<Down>', '<Left>', '<Right>' ]
    exec 'nnoremap' key '<Nop>'
    exec 'vnoremap' key '<Nop>'
    exec 'inoremap' key '<Nop>'
    exec 'cnoremap' key '<Nop>'
endfor


" ****************************************************************************
" *** vim-airline settings
" ****************************************************************************

let g:airline_theme= 'gruvbox'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'


" ****************************************************************************
" *** nerdtree settings
" ****************************************************************************

nnoremap <leader>d :NERDTreeToggle<CR>

let NERDTreeNaturalSort = 1
let NERDTreeRespectWildIgnore = 1


" ****************************************************************************
" *** barbar settings
" ****************************************************************************

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


" ****************************************************************************
" *** indentLine settings
" ****************************************************************************

let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" Toggle line indentation.
nnoremap <F3> :IndentLinesToggle<CR>


" ****************************************************************************
" *** telescope settings
" ****************************************************************************

nnoremap <leader>f :Telescope find_files theme=dropdown<CR>


" ****************************************************************************
" *** cmp settings
" ****************************************************************************

set completeopt=menu,menuone,noselect


" ****************************************************************************
" *** trim white spaces
" ****************************************************************************

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MATHEUSMV
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
