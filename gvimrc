if has('gui_gtk2')
  set gfn=DejaVu\ Sans\ Mono\ 9
  set guioptions=m

  let g:gist_clip_command = 'xclip -selection clipboard'
elseif has('gui_macvim')
  set guifont=Menlo:h13
  set guioptions=aAce

  let g:gist_clip_command = 'pbcopy'

  " ctrlp
  macmenu &File.New\ Tab key=<D-S-t>
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>
  map <D-r> :CtrlPTag<CR>

  " Ack
  macmenu Edit.Find.Find\.\.\. key=<nop>
  map <D-f> :Ack<space>
endif
