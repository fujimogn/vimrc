set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#rc(expand('~/.vim/bundle/'))


" Utils/Edit
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'open-browser.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'thinca/vim-ambicmd'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/Align'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'fholgado/minibufexpl.vim'
" NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'banyan/recognize_charcode.vim'

" Display
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-haml'

" HTML
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'mattn/zencoding-vim'

" CSS
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'miripiruni/CSScomb-for-Vim'

" JavaScript
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

" Markdown
NeoBundle 'vim-scripts/Markdown'


filetype plugin indent on


if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif


"------------------------------------
" Basic
"------------------------------------

" デフォルトエンコード"
set encoding=utf-8

" 改行コード
set fileformats=unix,dos,mac

" 起動時のメッセージを表示しない
set shortmess+=I

" ビープをならさない
set vb t_vb=

" ヴィジュアル選択をクリップボードに
set clipboard+=autoselect

" "無名レジスタに入るデータを、*レジスタにも入れる
set clipboard+=unnamed


"------------------------------------
" History
"------------------------------------

set autowrite
set hidden

set backup
set backupdir=$HOME/.tmp

set swapfile
set directory=$HOME/.tmp

set undofile
set undodir=$HOME/.tmp

set history=10000
set updatetime=500
let g:svbfre = '.\+'



"------------------------------------
" Save
"------------------------------------

" 外部のエディタで編集中のファイルが変更されたら、自動的に読み直す
set autoread

" :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :! :make,
" CTRL-], CTRL-^ のコマンドを実行するたび、ファイルが変更されていれば、そのファイルを保存する
set autowrite

" ファイルの保存を確認する
set confirm


" function! s:remove_dust()
    " let cursor = getpos(".")
    " " 保存時に行末の空白を除去する
    " %s/\s\+$//ge
    " " 保存時にtabを2スペースに変換する
    " %s/\t/  /ge
    " call setpos(".", cursor)
    " unlet cursor
" endfunction
" autocmd BufWritePre * call <SID>remove_dust()



"------------------------------------
" Display
"------------------------------------

" 行番号を表示する
set number

" タブ文字、行末など不可視文字を表示する
set list

" 不可視文字のフォーマットを指定する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" ウィンドウの幅を超える行を折り返さない
set nowrap

" ウィンドウの横分割で新しいウィンドウをカレントウィンドウの下に開く
set splitbelow

" ウィンドウの縦分割で新しいウィンドウをカレントウィンドウの右に開く
set splitright

" カーソルの設定
" set cursorline
" set cursorcolumn

" カーソルの上または下に表示する最小限の行数
set scrolloff=10

" カーソルの右または左に、表示する文字数
set sidescrolloff=10

" ウィンドウの最後の行ができる限りまで表示される。含まれないと、最後の行が収まりきらないならその行は "@" と表示される
set display=lastline

" 横幅が長いコードをハイライトする
" http://vim-users.jp/2011/05/hack217/
set textwidth=0
if exists('&colorcolumn')
    set colorcolumn=+1
    autocmd FileType sh,zsh,cpp,perl,vim,ruby,slim,haml,css,sass,less,javascript,cofee,python,haskell,scheme setlocal textwidth=80
endif
" set textwidth=80
" if exists('&colorcolumn')
    " set colorcolumn=+1
" endif


" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"------------------------------------
" color
"------------------------------------

if $TERM =~ '^xterm'
  set t_Co=256
elseif $TERM =~ '^screen-bce'
  set t_Co=256
elseif $TERM =~ '^rxvt'
  set t_Co=88
elseif $TERM =~ '^linux'
  set t_Co=8
else
  set t_Co=16
endif

colorscheme monokai_256


"------------------------------------
" Statusline
"------------------------------------

" 常にステータスラインを表示する
set laststatus=2

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" 現在のモードを表示する
set showmode

" コマンドをステータスラインに表示する
set showcmd


"------------------------------------
" Search
"------------------------------------

" 検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set wrapscan
" 検索結果をハイライトする
set hlsearch
" インクリメンタルサーチを行う
set incsearch
" 検索で大文字小文字を区別しない
set ignorecase
" 検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase



"------------------------------------
" Edit
"------------------------------------

" どんな設定の時も勝手に改行しないように
set formatoptions=q

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" バックスペースキーでなんでも消せるように
set backspace=indent,eol,start

" IMEをOFF
set iminsert=0
set imsearch=0

" Visual blockモードでフリーカーソルを有効にする
set virtualedit+=block

" タブを使わないスペースにする ( タブを入力するときはc-v<TAB> )
set expandtab

" 可視のタブ幅。4スペース分
set tabstop=2

" cindentやautoindent時や >> で挿入されるタブの幅
set shiftwidth=2

" <TAB>, <BS>の使用などの編集操作をするときのタブが対応する空白の数
set softtabstop=2

" 新しい行を挿入したとき、現在行と同じインデントを適用する
set autoindent

" 行頭の余白内で <TAB> を使う際 shiftwidth の数だけインデントする。
" 行頭以外では 'tabstop' の数だけ空白が挿入される。初期値：オフ
set smarttab


" ファイルを開いた時に、以前のカーソル位置を復元する
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

"------------------------------------
" fold
"------------------------------------

set foldmethod=marker
set foldcolumn=3
set foldlevel=0


"------------------------------------
" Mouse
"------------------------------------

" set mouse=a
" set guioptions+=a
" set ttymouse=xterm2



"------------------------------------
" Keymap lader
"------------------------------------

" Leader
let mapleader=","

"-------------------------------------------------------------------------------
" Keymap
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"----------------------------------------------------------------------------

" : ; 入れ替え
noremap ; :
noremap : ;

" Return で改行
" nnoremap <CR> :<C-u>call append(expand('.'), '')<CR>ji

" インサートモードを抜ける
inoremap jj <ESC>
inoremap kk <ESC>

" 基本移動
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk

" 移動支援
noremap H ^
noremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" ウィンドウ移動
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ヤンク
nnoremap Y y$
nnoremap vy vawy
vnoremap v $h

" タブ
nnoremap <C-t>  <Nop>
nnoremap <C-t>c  :<C-u>tabnew<CR>
nnoremap <C-t>x  :<C-u>tabclose<CR>
nnoremap <C-t>o  :<C-u>tabonly<CR>
nnoremap <C-t>n  gt
nnoremap <C-t>p  gT

" バッファ
" nnoremap <Space>1 :e #1<CR>
" nnoremap <Space>2 :e #2<CR>
" nnoremap <Space>3 :e #3<CR>
" nnoremap <Space>4 :e #4<CR>
" nnoremap <Space>5 :e #5<CR>
" nnoremap <Space>6 :e #6<CR>
" nnoremap <Space>7 :e #7<CR>
" nnoremap <Space>8 :e #8<CR>
" nnoremap <Space>9 :e #9<CR>
" nnoremap <Space>[ :<C-u>bp<CR>
" nnoremap <Space>] :<C-u>bn<CR>


" 検索ハイライトをクリア
nnoremap <silent><ESC><ESC> :nohlsearch<CR><ESC>

" Fold
inoremap zz <C-O>za
nnoremap zz za
onoremap zz <C-C>zw
vnoremap zz zf

" via http://d.hatena.ne.jp/ns9tks/20080318/1205851539
" 行頭で h を押すと折畳を閉じる。
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" 折畳上で l を押すと折畳を開く。
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" 行頭で h を押すと選択範囲に含まれる折畳を閉じる。
vnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" 折畳上で l を押すと選択範囲に含まれる折畳を開く。
vnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" Ex-mode
cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down>  <C-n>

"挿入モードのキーバインドをemacs風に
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D

" 括弧までを消したり置き換えたりする
" http://vim-users.jp/2011/04/hack214/
vnoremap ( t(
vnoremap ) t)
onoremap ( t(
onoremap ) t)

" 保存・終了
nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>

" 日付挿入
inoremap <leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <leader>date <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

"------------------------------------
" misc command
"------------------------------------
"
command! Editrc edit $MYVIMRC
command! Editgrc edit $MYGVIMRC
command! Reloadrc source $MYVIMRC
command! Reloadgrc source $MYGVIMRC

nnoremap <Space>. :<C-u>Editrc<Cr>
nnoremap <Space>, :<C-u>Reloadrc<Cr>

command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

"------------------------------------
" neocomplcache
"------------------------------------

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Keymap
"
" <CR> で確定してポップアップを閉じる
" http://starzero.hatenablog.com/entry/20120920/1348105635
function! s:my_crinsert()
    return pumvisible() ? neocomplcache#close_popup() : "\<Cr>"
endfunction
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>

" <TAB> で保管
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" スニペットの展開
" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
" smap <C-k>     <Plug>(neocomplcache_snippets_expand)
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

"------------------------------------
" Unite
"------------------------------------

"インサートモードで開始しない
let g:unite_enable_start_insert = 0

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>u [unite]

" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

function! EnableUniteKeymap()
  " escでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)

  " 入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  " 入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " sでsplit
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  " vでvsplit
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  " fでvimfiler
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction
autocmd FileType unite call EnableUniteKeymap()


"------------------------------------
" vimfiler
"------------------------------------

"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1

"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

"現在開いているバッファのディレクトリを開く
nnoremap <silent> <F3> :<C-u>VimFilerBufferDir -quit<CR>

"現在開いているバッファをIDE風に開く
" nnoremap <silent> <F2> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

nnoremap <silent> <F2> :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

if exists('unite#custom_action')
  let my_action = { 'is_selectable' : 1 }
  function! my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_split', my_action)

  let my_action = { 'is_selectable' : 1 }
  function! my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_vsplit', my_action)
endif

"------------------------------------
" syntastic
"------------------------------------"

" とりあえず
let g:syntastic_enable_highlighting=0
let g:syntastic_auto_jump=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {
      \  'mode': 'active',
      \ 'active_filetypes': ['ruby', 'javascript'],
      \ 'passive_filetypes': ['html']
      \ }
let g:syntastic_javascript_checker = 'jshint'


"------------------------------------
" quickrun
"------------------------------------"

let g:quickrun_no_default_key_mappings = 1
nmap <Space>r <Plug>(quickrun)

function! s:quickrun_of_buffer()
  if !exists('b:quickrun_of_buffer')
    let b:quickrun_of_buffer = ''
  endif
  echo 'QuickRun' b:quickrun_of_buffer
  execute 'QuickRun' b:quickrun_of_buffer
endfunction
autocmd FileType quickrun nnoremap <silent> <buffer> <ESC> :q<CR>
"

"------------------------------------
" vim-ambicmd
"------------------------------------"
" http://d.hatena.ne.jp/thinca/20110830/1314631439
autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
   inoremap <buffer> <expr> <Space> ambicmd#expand("\<Space>")
   inoremap <buffer> <expr> <CR>    ambicmd#expand("\<CR>")
startinsert!
endfunction

"------------------------------------
" vim-rooter
"------------------------------------"

" <Leader>cd でカレントディレクトリを移動（デフォルト）
" map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
" 一旦全部削除
" autocmd! rooter
" 標準では以下の拡張子で自動的に起動
autocmd BufEnter *.rb,*.html,*.haml,*.slim,*.erb,*.rjs,*.css,*.less,*.scss,*.sass,*.js,*.coffee :Rooter
" cd の代わりに lcd を使う
let g:rooter_use_lcd = 1


"------------------------------------
" Autodate
"------------------------------------

let g:autodate_format = ': %FT%T%z'
let g:autodate_keyword_pre = '$Date'
let g:autodate_keyword_post = '\$'


"------------------------------------
" open-browser.vim
"------------------------------------

" カーソル下のURLをブラウザで開く
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)

" カーソル下のキーワードをググる
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" vim-powerline
"------------------------------------
let g:Powerline_symbols = 'fancy'
let g:Powerline_mode_i  = '挿入'
let g:Powerline_mode_R  = '置換'
let g:Powerline_mode_n  = '通常'
let g:Powerline_mode_v  = 'ビジュアル'
let g:Powerline_mode_V  = '行ビジュアル'
let g:Powerline_mode_cv = '矩形ビジュアル'
let g:Powerline_mode_s  = '選択'
let g:Powerline_mode_S  = '行選択'
let g:Powerline_mode_cs = '矩形選択'


"------------------------------------
" NERD_commenter
"------------------------------------
"
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1

vmap <Space>cc <Plug>NERDCommenterToggle
nmap <Space>cc <Plug>NERDCommenterToggle
nmap <Space>ca <Plug>NERDCommenterAppend
nmap <Space>c$ <Plug>NERDCommenterToEOL
vmap <Space>cs <Plug>NERDCommenterSexy
vmap <Space>cb <Plug>NERDCommenterMinimal

"------------------------------------
" Align
"------------------------------------

let g:Align_xstrlen = 3
let g:DrChiptopLvlMenu = ''


"------------------------------------
" vim-textmanip
"------------------------------------"
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap J <Plug>(textmanip-move-down)
xmap K <Plug>(textmanip-move-up)
xmap H <Plug>(textmanip-move-left)
xmap L <Plug>(textmanip-move-right)

"------------------------------------
" YankRing.vim
"------------------------------------"
" http://nanasi.jp/articles/vim/yankring_vim.html

"記録する履歴件数を100件に制限する
" let g:yankring_max_history=100

"ウィンドウの高さ調整
" let g:yankring_window_height=13

"保存先の変更
" let g:yankring_history_dir=expand('$HOME')
" let g:yankring_history_file='.yankring_history'


"------------------------------------
" minibufexpl.vim
"------------------------------------"
" http://nanasi.jp/articles/vim/minibufexpl_vim.html

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplSplitBelow=0
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
nnoremap <C-d> :<C-u>bd<CR>
nnoremap <C-n> :<C-u>MBEbn<CR>
nnoremap <C-p> :<C-u>MBEbp<CR>

hi MBEVisibleActive guifg=#A6E22E guibg=fg ctermfg=118
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg ctermfg=161
hi MBEVisibleChanged guifg=#960050 guibg=fg ctermfg=162
hi MBEVisibleNormal guifg=#66D9EF guibg=fg ctermfg=81
hi MBEChanged guifg=#E6DB74 guibg=fg ctermfg=229
hi MBENormal guifg=#808080 guibg=fg ctermfg=244


"------------------------------------
" vim-indent-guides
"------------------------------------"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#454545 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3E3E3E ctermbg=236


"------------------------------------
" Rsense
"------------------------------------
let g:rsenseUseOmniFunc = 1

if !empty( $RSENSE_HOME ) && filereadable(expand( $RSENSE_HOME.'/bin/rsense'))
  let g:rsenseHome = $RSENSE_HOME
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

"------------------------------------
" zencoding-vim
"------------------------------------

" <C-y>で展開
let g:user_zen_expandabbr_key = '<C-y>'

" 展開するHTMLの言語を設定
let g:user_zen_settings = {'lang' : 'ja'}


"------------------------------------
" vim-css3-syntax
"------------------------------------
highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/



autocmd FileType html,xhtml,xml setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,xhtml setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=./;/
autocmd BufNewFile,BufRead *.less setlocal filetype=less
autocmd BufNewFile,BufRead *.scss setlocal filetype=scss
" autocmd BufNewFile,BufRead *.scss,*.less,*.css setlocal foldmethod=marker
" autocmd BufNewFile,BufRead *.scss,*.less,*.css setlocal foldmarker={,}
" autocmd BufNewFile,BufRead *.scss,*.less,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
" autocmd BufNewFile,BufRead *.scss,*.less,*.css inoremap <buffer> {<cr> {}<left><cr>.<cr><esc>kA<bs><space><space>
" autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
" autocmd FileType scss,less,css setlocal iskeyword+=-
" autocmd FileType scss,less,css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" autocmd FileType css setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead Makefile.rule setlocal filetype=make
autocmd Filetype make set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *vimperatorrc*,*.vimp set filetype=vimperator

autocmd FileType help nnoremap q :q<CR>
autocmd FileType help noremap <ESC> :q<CR>

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
