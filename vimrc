filetype off

call pathogen#runtime_append_all_bundles()

" Line numbers
set number

" Tab fix
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
if has("autocmd")
	filetype plugin indent on
endif

" Allow mouse clicks
set mouse=a

" Syntax highlighting
syntax on

" Show matching brackets.
set showmatch

" show in title bar
set title

" highlight search
set hlsearch
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
" unless they contain upper-case letters:
set smartcase
" incremental search
set incsearch

" Wrap at word
set linebreak

" Colorscheme
colorscheme desertEx

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" , is the leader character
let mapleader = ","

" NERDTree
:noremap <Leader>n :NERDTreeToggle<CR>

" copy to clipboard
nmap <leader>y "+y
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

" Buffers
map <A-Left> :bp<CR>
map <A-Right> :bn<CR>

" Leader shortcuts for Rails commands
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

" Move lines up and down
map <C-J> :m +1 <CR>
map <C-K> :m -2 <CR>

" Fix issues with screen and ctrl+left/right
set term=xterm
