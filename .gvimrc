set t_Co=<t_co>
set anti
set guioptions=aAce
set lines=60
set columns=90
set background=dark

if has('gui_macvim')
  set guifont=Ricty:h16
  " <C-Enter> でフルスクリーンをトグル
  nnoremap <C-Return> :set invfullscreen<CR>

" 透明度
  set transparency=10
  " フォーカスを離れたときに透明度を上げる
  " via http://vim-users.jp/2011/10/hack234
  augroup hack234
    autocmd!
    autocmd FocusGained * set transparency=10
    autocmd FocusLost * set transparency=80
  augroup END

  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
  map <D-0> :tablast<CR>
endif

