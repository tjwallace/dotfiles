filetype off
call pathogen#runtime_append_all_bundles()

set nocompatible
set encoding=utf-8

" leader character
let mapleader = ","

" line numbers
set number

" tab fix
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
if has("autocmd")
	filetype plugin indent on
endif

" backups
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

" allow mouse clicks
set mouse=a

" syntax highlighting
syntax on

" show matching brackets.
set showmatch

" bounce between brackets
nnoremap <tab> %
vnoremap <tab> %

" show in title bar
set title

" search
set hlsearch
set ignorecase
set smartcase
set incsearch
nnoremap <leader><space> :noh<cr>

" wrap at word
set linebreak

" colorscheme
set background=dark
colorscheme delek

" make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" force hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" shorcuts
nnoremap ; :
inoremap jj <ESC>

" save when focus lost
au FocusLost * :wa

" new vertical split
nnoremap <leader>s<space> <C-w>v<C-w>l
nnoremap <leader>vs<space> <C-w><C-v>
nnoremap <leader>hs<space> <C-w><C-s>

" navigate splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" clean whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" sudo write
cmap w!! w !sudo tee % >/dev/null

" NERDTree
map <F2> :NERDTreeToggle<cr>
map <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$']

" rainbow parens
nmap <leader>R :RainbowParenthesesToggle<CR>

" copy to clipboard
vmap <leader>y "+y
" copy current line to clipboard
nmap <leader>Y "+yy
" paste from clipboard
nmap <leader>p "+gP

" show the registers from things cut/yanked
nmap <leader>r :registers<CR>

" map the various registers to a leader shortcut for pasting from them
nmap <leader>0 "0p
nmap <leader>1 "1p
nmap <leader>2 "2p
nmap <leader>3 "3p
nmap <leader>4 "4p
nmap <leader>5 "5p
nmap <leader>6 "6p
nmap <leader>7 "7p
nmap <leader>8 "8p
nmap <leader>9 "9p

let g:yankring_history_dir = '~/.vim/tmp'
let g:yankring_history_file = 'yankring_history'

" buffers
map <A-H> :bp<CR>
map <A-L> :bn<CR>

" leader shortcuts for Rails commands
map <Leader>m :Rmodel
map <Leader>c :Rcontroller
map <Leader>v :Rview
map <Leader>u :Runittest
map <Leader>f :Rfunctionaltest
map <Leader>tm :RTmodel
map <Leader>tc :RTcontroller
map <Leader>tv :RTview
map <Leader>tu :RTunittest
map <Leader>tf :RTfunctionaltest
map <Leader>sm :RSmodel
map <Leader>sc :RScontroller
map <Leader>sv :RSview
map <Leader>su :RSunittest
map <Leader>sf :RSfunctionaltest

" move lines up and down
map <A-j> :m +1 <CR>
map <A-k> :m -2 <CR>

" fix issues with screen and ctrl+left/right
set term=xterm

if has('gui_running')
  colorscheme molokai
  if has('gui_gtk2')
    set guioptions=m
  elseif has('gui_macvim')
    set guioptions=aAce
    set transparency=5
  endif
endif
