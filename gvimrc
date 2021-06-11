if has('gui_gtk2')
  set gfn=DejaVu\ Sans\ Mono\ 9
  set guioptions=m

  let g:gist_clip_command = 'xclip -selection clipboard'
elseif has('gui_macvim')
  set guifont=Menlo:h13
  set linespace=1
  set guioptions=aAce

  let g:gist_clip_command = 'pbcopy'

  " New tab
  macmenu &File.New\ Tab key=<D-S-t>

  " fzf
  map <D-t> :GFiles<CR>
  map <D-r> :Files<CR>

  " quick fix list navigation
  map <D-j> :cn<CR>
  imap <D-j> <ESC>:cn<CR>
  map <D-k> :cp<CR>
  imap <D-k> <ESC>:cp<CR>

  " Ack
  macmenu Edit.Find.Find… key=<nop>
  map <D-f> :Ack<space>
endif
