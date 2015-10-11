"  _____ _       _   _          _
" /  ___| |     | | | |        (_)
" \ `--.| | ___ | |_| |____   ___ _ __ ___  _ __ ___
"  `--. \ |/ _ \| __| '_ \ \ / / | '_ ` _ \| '__/ __|
" /\__/ / | (_) | |_| | | \ V /| | | | | | | | | (__
" \____/|_|\___/ \__|_| |_|\_/ |_|_| |_| |_|_|  \___|
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Tom Hadlaw, tomhadlaw144@gmail.com
"	Version: 1.0.0
" Sections:
"		#General
"		#UI
"		#Backup
"		#Text
"		#Movement
"		#Status
"		#Mapping
"		#Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" #General
set history=10000
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" reads in file when it is modified.
set autoread

" simplify saving.
nmap <leader>w :w!<cr>

" #UI
set wildmenu
" ignore compiled files (I often compile to -o a).
set wildignore=*.8,*-,*.pyc
" Ruler is the thing at the bottom that shows your line/col.
set ruler
" Height of command bar.
set cmdheight=2
" searching stuff.
set ignorecase
set smartcase
set hlsearch
set incsearch "incremental search."

"improves performance"
set lazyredraw
"improve regex"
set magic

set showmatch
set mat=2

" Stuff to prevent me from going insane "
set noerrorbells
set novisualbell
""set t_vb=
set tm=500

" #Colors
syntax enable
"Note: This may not be what I want"
set encoding=utf-8

" use unix filetypes.
set ffs=unix,dos,mac

" #Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" these are more annoying than anything. "
set noswapfile

" #Text
set clipboard=unnamed

" improves tab stuff
set smarttab

set tabstop=8
set shiftwidth=4

set lbr
set tw=500

" auto/smart indent.
set ai
set si
set wrap

map 0 ^
" #Movement
map j gj
map k gk

map <space> /
map <c-space> ?

" #Status
"always show status line.

function! HasPaste()
    if &paste
	return 'PASTE '
    en
    return ''
endfunction

set laststatus=2
"
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Col:\ %c

" #Mapping

" Deletes trailing whitespaces.
func! DTW()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal 'z"
endfunc

autocmd BufWrite *.py :call DTW()
autocmd BufWrite *.c :call DTW()
autocmd BufWrite *.go :call DTW()
autocmd BufWrite .vimrc :call DTW()
autocmd BufWrite *.yaml :call DTW()
autocmd BufWrite *.java :call DTW()

" #Misc
set number
highlight ColorColumn ctermbg=232 guibg=#2c2d27
set colorcolumn=80
set pastetoggle=<F1>

" pathogen plugin manager
execute pathogen#infect()

inoremap {	{}<Left>
inoremap [	[]<Left>
inoremap (	()<Left>
inoremap "	""<Left>
inoremap '	''<Left>
noremap `	``<Left>

set showcmd
set cursorline
set wildmenu
set showmatch
set incsearch
set number

cnoreabbrev W w
cnoreabbrev X x

