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
colorscheme solarized

" make cursor move by visual lines instead of file lines (when wrapping)
map k gk
map j gj
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

" jump with J/K
nnoremap J 5j
vnoremap J 5j
nnoremap K 5k
vnoremap K 5k

" invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" shorcuts
nnoremap ; :
inoremap jj <ESC>

" save when focus lost
au FocusLost * :wa

" new split
nnoremap <leader>s<space> <C-w>v<C-w>l
nnoremap <leader>vs <C-w><C-v>
nnoremap <leader>hs <C-w><C-s>

" navigate splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" navigate buffers
map <A-h> :bp<CR>
map <A-l> :bn<CR>

" move lines up and down
map <A-j> :m +1 <CR>
map <A-k> :m -2 <CR>

" clean whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" sudo write
cmap w!! w !sudo tee % >/dev/null

" NERDTree
map <F2> :NERDTreeToggle<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>N :NERDTreeFind<cr>
let NERDTreeIgnore=['.vim$', '\~$']

" rainbow parens
nmap <leader>R :RainbowParenthesesToggle<CR>

" gundo
nnoremap <F3> :GundoToggle<CR>

" copy to clipboard
vmap <leader>y "+y
" copy current line to clipboard
nmap <leader>Y "+yy
" paste from clipboard
nmap <leader>p "+gP

" show the registers from things cut/yanked
nmap <leader>r :registers<CR>

let g:yankring_history_dir = '~/.vim/tmp'
let g:yankring_history_file = 'yankring_history'

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

" fix issues with screen and ctrl+left/right
set term=xterm
