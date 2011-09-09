if has('gui_gtk2')
  set gfn=DejaVu\ Sans\ Mono\ 9
  set guioptions=m
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif has('gui_macvim')
  set guifont=Menlo:h13
  set guioptions=aAce
  set transparency=5
  let g:gist_clip_command = 'pbcopy'

  " Command-t for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

  " Command-F for ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>
endif
