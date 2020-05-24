" This file will need to be renamed to ".vimrc" before use

" Disable vi support
set nocompatible

" Enable filetype plugins
filetype plugin on
filetype indent on

" Allow autoread for outside file changes
set autoread
au Focusgained,BufEnter * checktime

" Add handler for Capital W to be sudo save
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Allow line delete
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Set Editor information
set so=7
set number
syntax on
set cursorline
set ruler
set nostartofline
set laststatus=2
set mouse=a
set lazyredraw
set magic
set showmatch
set foldcolumn=1
set encoding=utf8
set ffs=unix,dos,mac
set showtabline=2

" turn off sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set Tab information
set autoindent
set smartindent
set wrap
set expandtab
set softtabstop=4
set shiftwidth=4
set lbr
set tw=500

" Set Search Options
set incsearch
set hlsearch
set ignorecase
set smartcase

" Set Color scheme
colorscheme industry
set background=dark

set history=2000

" Backup options (just use vcs instead)
set nobackup
set nowb
set noswapfile

" Improve command-line completion
set wildmenu

" Add column ruler
set colorcolumn=80

" Set keymaps
map <space> /
map <C-space> ?
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map 0 ^
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Enable Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#alt_sep = 1

execute vim-pathogen#autoload#pathogen#infect()
