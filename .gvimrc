set t_Co=<t_co>
set anti
set guioptions=
set lines=60
set columns=90
set background=dark

if has('gui_macvim')
  set guifont=Ricty:h16
  " <C-Enter> でフルスクリーンをトグル
  nnoremap <C-Return> :set invfullscreen<CR>
endif


