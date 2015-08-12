set nocompatible		"ViMproved
filetype off 			"required for vundle
set shell=bash
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage itself
Plugin 'gmarik/Vundle.vim'

" fugitive plugin for git"
Plugin 'tpope/vim-fugitive'

" airline
Plugin 'bling/vim-airline'

" bufferline
Plugin 'bling/vim-bufferline'

" tagbar
Plugin 'majutsushi/tagbar'

" csv.vim
Plugin 'chrisbra/csv.vim'

" syntastic
Plugin 'scrooloose/syntastic.git'

" nerdtree
Plugin 'scrooloose/nerdtree.git'

" tmuxline.vim
Plugin 'edkolev/tmuxline.vim'

" promptline.vim
Plugin 'edkolev/promptline.vim'

" base16
Plugin 'chriskempson/base16-vim'

" you complete me
" Plugin 'Valloric/YouCompleteMe.git'

call vundle#end() 			" end vundle whatnot

" base16 shit
let base16colorspace=256

" Enable filetype plugins
filetype plugin indent on

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
set nu
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
" set lazyredraw

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
set background=dark
colorscheme base16-ocean

" UTF-8 only duh
set encoding=utf-8

" Unix files
set ffs=unix,dos,mac

" File settings
set nobackup
set nowb
set noswapfile

" Text and tabs
set softtabstop=0
set expandtab
set smarttab
set shiftwidth=2

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
set showtabline=2
set noshowmode

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

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

" vim-latex specific
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1

" NerdTree commands
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists ("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" promptline settings
let g:promptline_preset = {
  \'a'          : [promptline#slices#user(), promptline#slices#jobs()],
  \'c'          : [promptline#slices#cwd()],
  \'x'          : [promptline#slices#vcs_branch(), promptline#slices#git_status(), '$(git rev-parse --short HEAD 2>/dev/null)'],
  \'y'          : [promptline#slices#battery({'threshold': 100})],
  \'z'          : [promptline#slices#host({ 'only_if_ssh': 0 })]}

" tmuxline settings
let g:tmuxline_preset = 'tmux'
