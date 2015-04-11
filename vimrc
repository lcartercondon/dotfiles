" Enable filetype plugins
filetype plugin on
filetype indent on

" Automatically read files when changed outside vim
set autoread

" leader  for extra key combos
let mapleader = ","
let g:mapleader = ","

" Interface tweaks

" turn on wildmenu
set wildmenu
" ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the ocmmand bar
set cmdheight=1

" Hide abandoned buffers
set hid

" Make backspace act right
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Be smart about searching with cases
set ignorecase
set smartcase
set hlsearch
set incsearch

" Don't redraw during macros
set lazyredraw

" regular expression magic
set magic

" show matching brackets
set showmatch

" turn off annoyances
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Coloring tweaks

syntax enable
colorscheme desert
set background=dark

" UTF-8 only duh
set encoding=utf8

" Unix files
set ffs=unix,dos,mac

" File settings
set nobackup
set nowb
set noswapfile

" Text and tabs
set smarttab
set shiftwidth=4
set tabstop=4

set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Cursor and buffers
map j gj
map k gk

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

" " Specify the behavior when switching between buffers 
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

" Always show status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Mappings
" remap VIM 0 to first non-blank
map 0 ^


" Spell checking 
" ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Helper functions
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction


