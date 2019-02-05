" vim-plug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colors
Plug 'altercation/vim-colors-solarized'

" Tools
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/Rename2'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/YankRing.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'

" Tools - Search
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'corntrace/bufexplorer'

" Tools - Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

" Tools - Tab Completion
" macvim must be compiled with python3 support
" brew reinstall macvim --with-python3
Plug 'maralla/completor.vim', { 'do': 'make js' }
Plug 'maralla/completor-typescript'

" Tools - Formatting
Plug 'Raimondi/delimitMate'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Languages
Plug 'vim-scripts/csv.vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'jparise/vim-graphql'

" Languages - Ruby
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-cucumber'

" Languages - Yavascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'burnettk/vim-angular'
Plug 'digitaltoad/vim-jade'

" Languages - Yavascript - Typescript
Plug 'HerringtonDarkholme/yats.vim'

" Languages - Web
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'

call plug#end()

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

" wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc,*.class,vendor/gems/*
set wildignore+=*.jpg,*.jpeg,*.gif,*.png
set wildignore+=*.zip,*.apk
set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

set wildignorecase

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
" inoremap jj <ESC>

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

" vim-dirvish
let g:dirvish_relative_paths = 1
" folders at the top
let g:dirvish_mode = ':sort ,^.*[\/],'

" replace without clearing buffer
vnoremap <leader>p "_dP

" show the registers from things cut/yanked
nmap <leader>r :registers<CR>

" highlight current line
set cursorline

" enabled spell checking in git commit
autocmd FileType gitcommit setlocal spell

" generic completion
let g:completor_node_binary = '~/.nvm/versions/node/v8.11.1/bin/node'
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <silent> <CR> <C-r>=<SID>endwise_compatible_enter()<CR>
function! s:endwise_compatible_enter()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" Ruby files
let g:ruby_indent_block_style = 'do'
" highlight cap files
au BufRead,BufNewFile *.cap set filetype=ruby
" highlight jbuilder files
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:ale_linters = {
\  'ruby': ['rubocop', 'reek', 'ruby'],
\  'javascript': ['eslint'],
\  'typescript': ['tslint', 'tsserver', 'typecheck'],
\}

let g:ale_fixers = {
\  'javascript': [
\    'eslint',
\  ],
\  'ruby': [
\    'rubocop',
\  ],
\}

" let g:ale_ruby_rubocop_executable = '.bundle/bin/rubocop'
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

" show errors/warnings in airline
let g:airline#extensions#ale#enabled = 1

" tagbar
map <leader>rt :TagbarToggle<cr>

" fzf
nnoremap <silent> <Leader>ag  :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>AG  :Rg <C-R><C-A><CR>
xnoremap <silent> <Leader>ag  y:Rg <C-R>"<CR>

" ack
if executable('ack-grep')
  let g:ackprg = 'ack-grep -H --nocolor --nogroup --column'
endif
if executable('ag')
  " https://github.com/ggreer/the_silver_searcher
  let g:ackprg = 'ag --vimgrep'
endif
if executable('rg')
  " https://github.com/BurntSushi/ripgrep
  let g:ackprg = 'rg --vimgrep'
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
let g:used_javascript_libs = 'jquery,underscore,ramda,jasmine,chai,react'

" JSX
let g:jsx_ext_required = 0

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" project specific .vimrc
set exrc
set secure
