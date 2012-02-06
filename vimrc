" load pathogen
runtime bundle/core/pathogen/autoload/pathogen.vim
call pathogen#infect('~/.dotfiles/vim/bundle/tools')
call pathogen#infect('~/.dotfiles/vim/bundle/langs')
call pathogen#infect('~/.dotfiles/vim/bundle/colors')

filetype plugin indent on

set nocompatible
set number
set ruler
syntax enable
set encoding=utf-8
set laststatus=2 " always show the status bar

" leader character
let mapleader = ","

" whitespace
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set list listchars=tab:▸\ ,trail:·

" backups
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

" files to ignore
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc,*.class,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.jpg,*.jpeg,*.gif,*.png
set wildignore+=*.zip,*.apk

" allow mouse clicks
set mouse=a

" show matching brackets.
set showmatch

" bounce between brackets
nmap <tab> %
vmap <tab> %
runtime! macros/matchit.vim

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

" fix issues with screen and ctrl+left/right
set term=xterm

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" enabled spell checking in git commit
autocmd FileType gitcommit setlocal spell

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2

" tagbar
map <leader>rt :TagbarToggle<cr>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
let g:ctrlp_clear_cache_on_exit = 1

" ack
if executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
