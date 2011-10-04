filetype off
call pathogen#runtime_append_all_bundles()

set nocompatible

set number
set ruler
syntax on

set encoding=utf-8

" leader character
let mapleader = ","

" whitespace
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set list listchars=tab:▸\ ,trail:·
if has("autocmd")
  filetype plugin indent on
endif

" folding
set foldmethod=syntax
set foldnestmax=3
set foldlevelstart=3

" backups
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

" tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" allow mouse clicks
set mouse=a

" show matching brackets.
set showmatch

" bounce between brackets
nmap <tab> %
vmap <tab> %

" show in title bar
set title

" status bar
set laststatus=2

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

" start/end of line
map H ^
map L $

" jump with J/K
nnoremap J 5j
vnoremap J 5j
nnoremap K 5k
vnoremap K 5k

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

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Thorfile, Rakefile, Vagrantfile and Gemfile are ruby
au BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
