if has('gui_gtk2')
  set gfn=DejaVu\ Sans\ Mono\ 9
  set guioptions=m
elseif has('gui_macvim')
  set guifont=Menlo:h13
  set guioptions=aAce
  set transparency=5

  " Command-t for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

  " Command-F for ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>
endif
