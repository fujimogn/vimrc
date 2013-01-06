" エディタ幅
setlocal textwidth=80

" タブを使わないスペースにする ( タブを入力するときはc-v<TAB> )
set expandtab

" 可視のタブ幅。4スペース分
set tabstop=4

" cindentやautoindent時や >> で挿入されるタブの幅
set shiftwidth=4

" <TAB>, <BS>の使用などの編集操作をするときのタブが対応する空白の数
set softtabstop=4

" 新しい行を挿入したとき、現在行と同じインデントを適用する
set autoindent

" 行頭の余白内で <TAB> を使う際 shiftwidth の数だけインデントする。
" 行頭以外では 'tabstop' の数だけ空白が挿入される。初期値：オフ
set smarttab

function! PHPFoldSetting(lnum)
  let l:line = getline(a:lnum)
  if l:line =~ 'function'
    return '>1'
  elseif getline(a:lnum + 1) =~ ' \* '
    return 0
  elseif getline(a:lnum) =~ ' \* '
    return 0    
  else       
    return '='   
  endif
endfunction
set foldmethod=expr foldexpr=PHPFoldSetting(v:lnum)

" Keymap
inoremap <buffer> { <Space>{}<Left><CR>.<CR><ESC>kA<BS><Tab>


