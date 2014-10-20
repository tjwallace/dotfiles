" BEGIN VUNDLE
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'

" Tools
Plugin 'bling/vim-airline'
Plugin 'skammer/vim-css-color'
Plugin 'tpope/vim-dispatch'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-rbenv'
Plugin 'vim-scripts/Rename2'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/YankRing.vim'

" Tools - Search
Plugin 'tpope/vim-vinegar'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'corntrace/bufexplorer'

" Tools - Git
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'

" Tools - Tab Completion
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Tools - Formatting
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Languages
Plugin 'vim-scripts/csv.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'gre/play2vim'

" Languages - Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-cucumber'

" Languages - Yavascript
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'digitaltoad/vim-jade'

" Languages - Web
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()
filetype plugin indent on
" END VUNDLE

set number
set ruler
syntax enable
set encoding=utf-8
set laststatus=2 " always show the status bar
set backspace=start,eol,indent

" leader character
let mapleader = "\\"

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
set background=light
let g:solarized_contrast="high"
let g:solarized_visibility="high"
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

" netrw
map <leader>n :e.<cr>
map <leader>N :Explore<cr>

" copy to clipboard
vmap <leader>y "+y
" copy current line to clipboard
nmap <leader>Y "+yy
" paste from clipboard
nmap <leader>p "+gP

" show the registers from things cut/yanked
nmap <leader>r :registers<CR>

" fix issues with screen and ctrl+left/right
set term=xterm

" highlight current line
set cursorline

" enabled spell checking in git commit
autocmd FileType gitcommit setlocal spell

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" tagbar
map <leader>rt :TagbarToggle<cr>

" ctrlp
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
\ }
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" ack
if executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
if executable("ag")
  " https://github.com/ggreer/the_silver_searcher
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" yankring
let g:yankring_history_dir = '~/.vim/tmp'
let g:yankring_history_file = 'yankring_history'

" airline (status line)
let g:airline_left_sep=''
let g:airline_right_sep=''

" dispatch
let g:rspec_command = "Dispatch rspec {spec}"

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" global search for word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>

" highlight cap files
au BufRead,BufNewFile *.cap set filetype=ruby

" close hidden buffers
" http://stackoverflow.com/a/1536094
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,jasmine'
