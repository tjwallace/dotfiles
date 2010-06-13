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

" Copy paste
map <C-c> "+yy
map <C-v> "+p

" Move lines up and down
map <C-J> :m +1 <CR>
map <C-K> :m -2 <CR>
