" エディタ幅
setlocal textwidth=80

" タブを使わないスペースにする ( タブを入力するときはc-v<TAB> )
set expandtab

" 可視のタブ幅。4スペース分
set tabstop=4

" cindentやautoindent時や >> で挿入されるタブの幅
set shiftwidth=2

" <TAB>, <BS>の使用などの編集操作をするときのタブが対応する空白の数
set softtabstop=2

" 新しい行を挿入したとき、現在行と同じインデントを適用する
set autoindent

" 行頭の余白内で <TAB> を使う際 shiftwidth の数だけインデントする。
" 行頭以外では 'tabstop' の数だけ空白が挿入される。初期値：オフ
set smarttab


" * での検索や text-object 等での選択時に - で切らない
" http://qiita.com/items/0a14d0649f918f5e3ce7
setlocal iskeyword& iskeyword+=-

" vimのgfを改良
" http://sanrinsha.lolipop.jp/blog/2012/01/vim%E3%81%AEgf%E3%82%92%E6%94%B9%E8%89%AF%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B.html
setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=./;/

" Keymap


" Plugin
noremap <silent> <buffer> <Space>s :<C-u>CSScomb<CR>
noremap <silent> <buffer> <Space>h :<C-u>ColorToggle<CR>


highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

