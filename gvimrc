if has('gui_gtk2')
  set gfn=DejaVu\ Sans\ Mono\ 9
  set guioptions=m
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif has('gui_macvim')
  set guifont=Menlo:h13
  set guioptions=aAce
  set transparency=5
  let g:gist_clip_command = 'pbcopy'

  " CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  macmenu &Tools.Make key=<nop>
  map <D-b> :CommandTBuffer<CR>
  macmenu &File.Open\ Tab\.\.\. key=<nop>
  map <D-T> :CommandTFlush<CR>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

  " Ack
  macmenu Edit.Find.Find\.\.\. key=<nop>
  map <D-f> :Ack<space>
endif
