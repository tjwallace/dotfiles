" vim-plug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" leader character
let mapleader = "\\"

" vim-plug config
" limit concurrency to avoid hammering GitHub
let g:plug_threads = 2

" TODO: consider using these defaults
" https://github.com/sheerun/vimrc
" https://github.com/tpope/vim-sensible

call plug#begin('~/.vim/plugged')

" Colors
Plug 'ericbn/vim-solarized'
Plug 'sblauen/chalk'
Plug 'kaicataldo/material.vim'

" Tools
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/Rename2'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/YankRing.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-projectionist'
Plug 'pbrisbin/vim-mkdir'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'jpalardy/spacehi.vim'

" Tools - Search
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'corntrace/bufexplorer'
Plug 'pechorin/any-jump.vim'

" Tools - Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

" Tools - Tab Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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
Plug 'wfxr/protobuf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Languages - Ruby
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-cucumber'

" Languages - Yavascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript'] }

" Languages - Yavascript - Typescript
Plug 'HerringtonDarkholme/yats.vim'

" Languages - Web
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'iloginow/vim-stylus'

" Languages - Docker
Plug 'ekalinin/Dockerfile.vim'

" Languages - Ansible
Plug 'pearofducks/ansible-vim'
Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" Disable strange Vi defaults.
set nocompatible

set number
set ruler
syntax enable
set encoding=utf-8
set laststatus=2 " always show the status bar

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Reload unchanged files automatically.
set autoread

" whitespace
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" spacehi - space/tab highlighting
augroup mostly_spacehi
  autocmd!
  autocmd Syntax * SpaceHi
  autocmd FileType help     NoSpaceHi
  autocmd FileType diff     NoSpaceHi
  autocmd FileType man      NoSpaceHi
  autocmd FileType go       NoSpaceHi
  autocmd FileType make     NoSpaceHi
augroup END

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

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

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

" COLORSCHEMES
" solarized
set termguicolors
set background=light
colorscheme solarized

" chalk
" colorscheme chalk

" material
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'palenight'
" let g:airline_theme = 'material'
" colorscheme material

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

" coc.nvim (completion) config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)

" Global coc extensions
let g:coc_global_extensions = [
      \ 'coc-solargraph',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-git',
      \ 'coc-syntax',
      \ '@yaegassy/coc-ansible',
      \ 'coc-docker',
      \ 'coc-go',
      \ 'coc-yaml',
      \ ]

let g:coc_filetype_map = {
      \ 'yaml.ansible': 'ansible',
      \ }

" Ruby files
let g:ruby_indent_block_style = 'do'
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1

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
\  'ruby': ['rubocop'],
\  'javascript': ['eslint'],
\}

" let g:ale_ruby_rubocop_executable = '.bundle/bin/rubocop'
let g:ale_ruby_rubocop_auto_correct_all = 1

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

" prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx Prettier

" show errors/warnings in airline
let g:airline#extensions#ale#enabled = 1

" tagbar
map <leader>rt :TagbarToggle<cr>

" fzf
nnoremap <silent> <Leader>ag  :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>AG  :Rg <C-R><C-A><CR>
xnoremap <silent> <Leader>ag  y:Rg <C-R>"<CR>

" any-jump
let g:any_jump_grouping_enabled = 1
let g:any_jump_search_prefered_engine = 'rg'

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

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>
let test#strategy = "dispatch"

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

" Autoload vimrc changes
" From https://superuser.com/a/417997
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
