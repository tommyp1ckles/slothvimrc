" Sets how many lines of history VIM has to remember
set history=5001

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" colors_name must be unset and reset, or vim will helpfully reload the
" colorscheme when we set the background for the Normal group.
" See the help entries ':hi-normal-cterm' and 'g:colors_name'
if exists("g:colors_name")
  let colors_name = g:colors_name
  unlet g:colors_name
endif

" Similarly, the global variable 'syntax_cmd' must be set to something vim
" doesn't recognize, lest vim helpfully switch all colors back to the
" default whenever the Normal group is changed (in syncolor.vim)...
if exists("g:syntax_cmd")
  let syntax_cmd = g:syntax_cmd
endif
let g:syntax_cmd = "PLEASE DON'T CHANGE ANY COLORS!!!"

" ... change normal here ...
"make text background match that of the terminal
highlight Normal ctermbg=NONE
autocmd ColorScheme * highlight Normal ctermbg=None

if exists("colors_name")
  let g:colors_name = colors_name
endif

unlet g:syntax_cmd
if exists("syntax_cmd")
  let g:syntax_cmd = syntax_cmd
endif


" Enable syntax highlighting
syntax enable

"set background=dark
"let g:molokai_original=1
colorscheme desert

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 8 spaces
"set shiftwidth=4
"set tabstop=4
set tabstop=8
set shiftwidth=4 

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set cindent 

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Col:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Jeremy added this
set t_Co=256 "256 colors
set number
set nospell

"color column
"set textwidth=80
"set colorcolumn=+1
highlight ColorColumn  ctermbg=233 guibg=#2c2d27

" highlight the 80th column
"
" In Vim >= 7.3, also highlight columns 120+
"if exists('+colorcolumn')
  " (I picked 120-320 because you have to provide an upper bound and 320 just
  "  covers a 1080p GVim window in Ubuntu Mono 11 font.)
"  let &colorcolumn="80,".join(range(120,320),",")
"else
  " fallback for Vim < v7.3
"  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

set colorcolumn=80
"makes <F2> toggle paste mode on/off
set pastetoggle=<F2>

"set nohlsearch "Don't highlight last search

" Fix typing errors
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> qw ((getcmdtype() is# ':' && getcmdline() is# 'qw')?('wq'):('qw'))

" Autocomplete stuff (All in a plugin)
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

"inoremap {<CR> {<CR><BS>}<Esc>ko

"Copy all to clipboard
inoremap <F3> <Esc>gg"+yG``
map <F3> <Esc>gg"+yG``
map! <F3> <Esc>gg"+yG``


" Semicolon goes to the end of the line
inoremap ;<cr> <end>;<cr>
"inoremap ; <end>;

"Know when you're in insert
":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

" ??
set esckeys

"Make Mouse work for selecting and junk
set mouse=a

if filereadable("~/.vimrc")
  ""so ~/.vimrc
endif

:imap <C-BS> <C-W>

"Toms added stuff
"Makes :X behave like :x.


"""""""""""""""""""THIS IS WHERE MY CHANGES ACTUALLY BEGIN!""""""""""""""""""
" Maps the :X command to :x because I dont ever use vim encryption and I tend
" to hit it a lot by mistake.
cnoreabbrev X x
"indentation style for filetype"
set shiftwidth=2
set tabstop=2
augroup vimrc_autocmd
    autocmd FileType puppet setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
		autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4
		autocmd FileType c set expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup end

" Run pathogen plugin manager "
execute pathogen#infect()

" Parenthesis matching stuff "
inoremap {	{}<Left>
inoremap {<CR>	{<CR>}<Esc>O
inoremap {{	{
inoremap {}	{}
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
imap <C-p> printf()<left>
