" vi:set ts=2 sts=2 sw=2 tw=0:
"=============================================================================
" FILE: .vimrc
" AUTHOR: Ayumi Fujii <fujimogn@gmail.com>
" Last Modified: 2013/01/21 06:56:20
"=============================================================================


set nocompatible
"------------------------------------
" NeoBundle
"------------------------------------

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Utils/Edit
NeoBundle 'Shougo/vimproc', { 'build': {
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
      \ 'cygwin': 'make -f make_cygwin.mak',
      \ }}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'banyan/recognize_charcode.vim'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'open-browser.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'taku-o/vim-catn'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-template'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'h1mesuke/vim-alignta'

" Display
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'taichouchou2/alpaca_complete',{
      \ 'depends' : 'tpope/vim-rails',
      \ 'build' : {
      \     'mac' : 'gem install alpaca_complete',
      \     'unix' : 'gem install alpaca_complete',
      \  }}
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-haml'

" HTML
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-ragtag'

" CSS
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hail2u/vim-css-syntax'
NeoBundle 'miripiruni/CSScomb-for-Vim'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'groenewege/vim-less'

" JavaScript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'kchmck/vim-coffee-script'

" PHP
NeoBundle 'everzet/phpfolding.vim'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'stephpy/vim-phpdoc'
NeoBundle 'violetyk/cake.vim'

" Markdown
NeoBundle 'vim-sripts/Markdown'


NeoBundleCheck

filetype plugin indent on

function! g:has_plugin(name)
  let nosuffix = a:name =~? '\.vim$' ? a:name[:-5] : a:name
  let suffix   = a:name =~? '\.vim$' ? a:name      : a:name . '.vim'
  return &rtp =~# '\c\<' . nosuffix . '\>'
        \ || globpath(&rtp, suffix, 1) != ''
        \ || globpath(&rtp, nosuffix, 1) != ''
        \ || globpath(&rtp, 'autoload/' . suffix, 1) != ''
        \ || globpath(&rtp, 'autoload/' . tolower(suffix), 1) != ''
endfunction



"------------------------------------
" Env
"------------------------------------

let g:username='Ayumi Fujii'
let g:email='fujimogn@gmail.com'

let $PATH = $PATH.':/usr/local/bin/'.':'.$HOME.'/bin'

"------------------------------------
" Basic
"------------------------------------

" エンコード
set encoding=utf-8 fileencodings=utf-8,ucs-bom,iso-2022-jp,euc-jp,cp932

" 改行コード
set fileformat=unix fileformats=unix,dos,mac

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

set hidden

" set nobackup
set backup
set backupdir=$HOME/.tmp

" set noswapfile
set swapfile
set directory=$HOME/.tmp

set undofile
set undodir=$HOME/.tmp

set history=10000
set updatetime=500


" "------------------------------------
" " Save
" "------------------------------------

" 外部のエディタで編集中のファイルが変更されたら、自動的に読み直す
set autoread

" バッファを自動的に保存する
" :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :! :make,
" CTRL-], CTRL-^ のコマンドを実行するたび、ファイルが変更されていれば、そのファイルを保存する
" set autowrite

" ファイルの保存を確認する
set confirm

" 保存時に行末の空白を除去する
" http://d.hatena.ne.jp/thinca/20120130/1327919787
if has('autocmd')
  autocmd BufWritePre * :%s/\S\zs\s\+$//e
endif

"------------------------------------
" Display
"------------------------------------

" 行番号を表示する
" set number

" 相対行番号を有効にする
set relativenumber

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
set cursorline

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" カーソルの上または下に表示する最小限の行数
set scrolloff=10

" カーソルの右または左に、表示する文字数
set sidescrolloff=10

set textwidth=80
if exists('&colorcolumn')
  set colorcolumn=+1
endif

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast


" "------------------------------------
" " color
" "------------------------------------

syntax enable

set t_Co=256

colorscheme monokai_256


" "------------------------------------
" " Statusline
" "------------------------------------

" 常にステータスラインを表示する
" set laststatus=2

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

set formatoptions=q
set fo-=t fo-=c fo -=r fo-=o
if has('autocmd')
  autocmd FileType * setlocal fo-=t fo-=c fo-=r fo-=o
endif

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" バックスペースキーでなんでも消せるように
set backspace=indent,eol,start

" IMEをOFF
set iminsert=0
set imsearch=0

" Visual blockモードでフリーカーソルを有効にする
set virtualedit+=block

" ファイルを開いた時に、以前のカーソル位置を復元する
augroup restoreCursor
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   exe "normal! g`\"" |
        \ endif
augroup END

"------------------------------------
" Indent
"------------------------------------

" 新しい行を挿入したとき、現在行と同じインデントを適用する
set autoindent

" タブを使わないスペースにする ( タブを入力するときはc-v<TAB> )
set expandtab

" 行頭の余白内で <TAB> を使う際 shiftwidth の数だけインデントする。
" 行頭以外では 'tabstop' の数だけ空白が挿入される。初期値：オフ
set smarttab

" 可視のタブ幅。4スペース分
set tabstop=2

" cindentやautoindent時や >> で挿入されるタブの幅
set shiftwidth=2

" <TAB>, <BS>の使用などの編集操作をするときのタブが対応する空白の数
" 0の場合はtabstopと同じ
set softtabstop=2


"------------------------------------
" fold
"------------------------------------
" フォールドの有効
set foldenable

" フォールドする種類
" set foldmethod=marker

" ウィンドウの端に確保される折畳を示すカラムの幅を指定する数
" set foldcolumn=3

" フォールドするレベル(初期値：0)
" 'foldlevel'が0の時には、全ての折畳が閉じられる。
" 'foldlevel'が正の時には、設定値より大きなレベルの折畳が閉じられる。
" 'foldlevel'が非常に大きい時は、全ての折畳が開かれる。
" set foldlevel=1

" ファイルを開いたときのフォールドレベルの値(初期値：-1)
set foldlevelstart=-1

" 折り畳む最小行数(初期値：1)
set foldminlines=3

" 折り畳むネストの最大値(初期値：20)
set foldnestmax=2

"------------------------------------
" Mouse
"------------------------------------

set mouse=a
set guioptions+=a
set ttymouse=xterm2

"------------------------------------
" Keymap lader
"------------------------------------

" Leader
let mapleader=","

"-------------------------------------------------------------------------------
" Keymap
"-------------------------------------------------------------------------------

" : ; 入れ替え
noremap : ;
noremap ; :


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
nnoremap <C-t>   <Nop>
nnoremap <C-t>c  :<C-u>tabnew<CR>
nnoremap <C-t>x  :<C-u>tabclose<CR>
nnoremap <C-t>o  :<C-u>tabonly<CR>
nnoremap <C-t>n  <C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <C-t>p  gT

" バッファ
nnoremap <Space>1 :e #1<CR>
nnoremap <Space>2 :e #2<CR>
nnoremap <Space>3 :e #3<CR>
nnoremap <Space>4 :e #4<CR>
nnoremap <Space>5 :e #5<CR>
nnoremap <Space>6 :e #6<CR>
nnoremap <Space>7 :e #7<CR>
nnoremap <Space>8 :e #8<CR>
nnoremap <Space>9 :e #9<CR>
nnoremap <Space>[ :<C-u>bp<CR>
nnoremap <Space>] :<C-u>bn<CR>

" 検索ハイライトをクリア
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>

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

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yyPVr*jyypVr*
nnoremap <leader>3 yyPVr-jyypVr-
nnoremap <leader>4 yypVr=
nnoremap <leader>5 yypVr-
nnoremap <leader>6 yypVr^
nnoremap <leader>7 yypVr

" 日付挿入
nnoremap <leader>time i<C-R>=strftime('%H:%M')<CR><ESC>
nnoremap <leader>date i<C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR><ESC>

" インサートモードを抜ける
inoremap jj <ESC>
inoremap kk <ESC>

" 挿入モードのキーバインドをemacs風に
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
" inoremap <C-k> <C-o>D
inoremap <C-y> <C-o>P
inoremap <C-u> <C-o>d0


cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down>  <C-n>

set pastetoggle=<F2>


"------------------------------------
" misc command
"------------------------------------

command! Editrc edit $MYVIMRC
command! Editgrc edit $MYGVIMRC
command! Reloadrc source $MYVIMRC
command! Reloadgrc source $MYGVIMRC

nnoremap <Space>. :<C-u>Editrc<Cr>
nnoremap <Space>, :<C-u>Reloadrc<Cr>

command! -bang -bar -complete=file -nargs=? Cp932 edit<bang> ++encoding=cp932       <args>
command! -bang -bar -complete=file -nargs=? Eucjp edit<bang> ++encoding=euc-jp      <args>
command! -bang -bar -complete=file -nargs=? Jis   edit<bang> ++encoding=iso-2022-jp <args>
command! -bang -bar -complete=file -nargs=? Utf8  edit<bang> ++encoding=utf-8       <args>
command! -bang -bar -complete=file -nargs=? Dos   edit<bang> ++fileformat=dos       <args>
command! -bang -bar -complete=file -nargs=? Mac   edit<bang> ++fileformat=mac       <args>
command! -bang -bar -complete=file -nargs=? Unix  edit<bang> ++fileformat=unix      <args>

command! Delnbsp %s/ / /g




"------------------------------------
" neocomplcache
"------------------------------------

if g:has_plugin( 'neocomplcache' )
  
  " AutoComplPopの自動起動を無効
  let g:acp_enableAtStartup = 0

  " 起動時に有効
  let g:neocomplcache_enable_at_startup = 1

  " 入力に大文字が入力されている場合、大文字小文字の区別をする
  let g:neocomplcache_enable_smart_case = 1

  " 大文字小文字を区切りとしたあいまい検索を行うかどうか。
  " DTと入力するとD*T*と解釈され、DateTime等にマッチする。
  let g:neocomplcache_enable_camel_case_completion = 1

  " アンダーバーを区切りとしたあいまい検索を行うかどうか。
  " m_sと入力するとm*_sと解釈され、mb_substr等にマッチする。
  let g:neocomplcache_enable_underbar_completion = 1

  " シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4
  let g:neocomplcache_min_syntax_length = 3

  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'




  " Define file-type dependent dictionaries.
  let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'java'        : $HOME . '/.vim/dict/java.dict',
    \ 'c'           : $HOME . '/.vim/dict/c.dict',
    \ 'cpp'         : $HOME . '/.vim/dict/cpp.dict',
    \ 'javascript'  : $HOME . '/.vim/dict/javascript.dict',
    \ 'objc'        : $HOME . '/.vim/dict/objc.dict',
    \ 'perl'        : $HOME . '/.vim/dict/perl.dict',
    \ 'php'         : $HOME . '/.vim/dict/php.dict',
    \ 'wordpress'   : $HOME . '/.vim/dict/wordpress.dict',
    \ 'vim'         : $HOME . '/.vim/dict/vim.dict'
    \ }


  " Define keyword, for minor languages
  if !exists('g:neocomplcache_keyword_patterns')
    " let g:neocomplcache_keyword_patterns = {}
  endif

  " Enable omni completion. Not required if they are already set elsewhere in .vimrc

  if has('autocmd')
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  endif

  " Enable heavy omni completion, which require computational power and may stall the vim.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

  " <CR> で確定してポップアップを閉じる
  " http://starzero.hatenablog.com/entry/20120920/1348105635
  function! s:my_crinsert()
    return pumvisible() ? neocomplcache#close_popup() : "\<Cr>"
  endfunction
  inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>

  " 前回行われた補完をキャンセル
  inoremap <expr><C-g>     neocomplcache#undo_completion()

endif


"------------------------------------
" neosnippet
"------------------------------------

if g:has_plugin( 'neosnippet' )

  if !exists("g:neosnippet#snippets_directory")
    let g:neosnippet#snippets_directory=""
  endif
  let g:neosnippet#snippets_directory='~/.vim/snippets'

  imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  "スニペットファイルを編集する
  nnoremap <Space>nes :NeoSnippetEdit<CR>

  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

endif


"------------------------------------
" neocomplcache-rsense
"------------------------------------

if g:has_plugin( 'neocomplcache-rsense' )
  if (!exists('g:neocomplcache#sources#rsense#home_directory')) &&
        \ (executable(expand( $RSENSE_HOME.'/bin/rsense')))
    let g:neocomplcache#sources#rsense#home_directory = expand($RSENSE_HOME)
  endif
end



"------------------------------------
" Unite
"------------------------------------

if g:has_plugin( 'unite' )
  let g:unite_source_file_mru_limit = 200
  let g:unite_enable_start_insert = 1

  " unite prefix key.
  nnoremap [unite] <Nop>
  xnoremap [unite] <Nop>
  nmap <Space>u [unite]
  xmap <Space>u [unite]
  nmap f [unite]
  xmap f [unite]

  nnoremap [unite];  :<C-u>Unite<Space>
  nnoremap <silent> [unite]u  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=>\  file<CR>
  nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=>\  file<CR>
  nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files -prompt=>\  file_mru file<CR>
  nnoremap <silent> [unite]m  :<C-u>Unite -buffer-name=mru -prompt=>\  file_mru<CR>
  nnoremap <silent> [unite]b  :<C-u>Unite -buffer-name=buffer -prompt=>\  buffer<CR>
  nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register -prompt=>\   register<CR>
  nnoremap <silent> [unite]l  :<C-u>Unite -buffer-name=line -prompt=>\   line<CR>
  nnoremap <silent> [unite]c  :<C-u>Unite -buffer-name=colorscheme -no-start-insert colorscheme<CR>
  nnoremap <silent> [unite]o  :<C-u>Unite -buffer-name=outline -prompt=>\  outline<CR>
  nnoremap <silent> [unite]rm :<C-u>Unite rails/model -prompt=>\   rails/model<CR>
  nnoremap <silent> [unite]rc :<C-u>Unite rails/controller -prompt=>\   rails/controller<CR>
  nnoremap <silent> [unite]rv :<C-u>Unite rails/view -prompt=>\   rails/view<CR>
  nnoremap <silent> [unite]rh :<C-u>Unite rails/helper -prompt=>\   rails/helper<CR>
  nnoremap <silent> [unite]rl :<C-u>Unite rails/lib -prompt=>\   rails/lib<CR>
  nnoremap <silent> [unite]rd :<C-u>Unite rails/db -prompt=>\   rails/db<CR>
  nnoremap <silent> [unite]rj :<C-u>Unite rails/javascript -prompt=>\   rails/javascript<CR>
  nnoremap <silent> [unite]rs :<C-u>Unite rails/stylesheet -prompt=>\   rails/stylesheet<CR>


  function! EnableUniteKeymap()
    " escでuniteを終了
    nmap <silent><buffer> <ESC> <Plug>(unite_exit)
    " 入力モードのときjjでノーマルモードに移動
    imap <buffer> jj <Plug>(unite_insert_leave)
    " 入力モードのときctrl+wでバックスラッシュも削除
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    " c-sでsplit
    nnoremap <silent><buffer><expr> <C-l> unite#smart_map('s', unite#do_action('split'))
    inoremap <silent><buffer><expr> <C-l> unite#smart_map('s', unite#do_action('split'))
    " c-vでvsplit
    nnoremap <silent><buffer><expr> <C-v> unite#smart_map('v', unite#do_action('vsplit'))
    inoremap <silent><buffer><expr> <C-v> unite#smart_map('v', unite#do_action('vsplit'))
  endfunction
  if has('autocmd')
    autocmd FileType unite call EnableUniteKeymap()
  endif
endif

"------------------------------------
" minibufexpl.vim
"------------------------------------"

if g:has_plugin( 'minibufexpl' )
  
  let g:miniBufExplModSelTarget = 1
  let g:miniBufExplorerMoreThanOne = 2
  let g:miniBufExplModSelTarget = 0
  let g:miniBufExplUseSingleClick = 1
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplVSplit = 15
  let g:miniBufExplSplitBelow=1
  
  if has('autocmd')
    autocmd BufRead,BufNew :call UMiniBufExplorer
  endif

  nnoremap <F3> :TMiniBufExplorer<cr>

  nnoremap <silent> <C-d> :<C-u>bd<CR>
  nnoremap <silent> <C-n> :<C-u>MBEbn<CR>
  nnoremap <silent> <C-p> :<C-u>MBEbp<CR>

  hi MBEVisibleActive guifg=#A6E22E guibg=fg ctermfg=118
  hi MBEVisibleChangedActive guifg=#F1266F guibg=fg ctermfg=161
  hi MBEVisibleChanged guifg=#960050 guibg=fg ctermfg=162
  hi MBEVisibleNormal guifg=#66D9EF guibg=fg ctermfg=81
  hi MBEChanged guifg=#E6DB74 guibg=fg ctermfg=229
  hi MBENormal guifg=#808080 guibg=fg ctermfg=244
endif




"------------------------------------
" syntastic
"------------------------------------"

if g:has_plugin( 'syntastic' )

  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=2


  " let g:syntastic_enable_highlighting=0
  " let g:syntastic_auto_jump=1
  " let g:syntastic_enable_signs=1
  " let g:syntastic_auto_loc_list = 1
  " let g:syntastic_mode_map = {
  " " \  'mode': 'active',
  " " \ 'active_filetypes': ['ruby', 'javascript'],
  " " \ 'passive_filetypes': ['html']
  " " \ }
  " let g:syntastic_javascript_checker = 'jshint'

endif


"------------------------------------
" quickrun
"------------------------------------"

if g:has_plugin( 'quickrun' )
  let g:quickrun_no_default_key_mappings = 1
  nmap <Space>r <Plug>(quickrun)

  if has('autocmd')
    autocmd FileType quickrun nnoremap <silent> <buffer> q :q<CR>
  endif
 
  let g:quickrun_config = {}
  let g:quickrun_config._ = {'runner': 'vimproc', 'split': 'below:8'}
  let g:quickrun_config['coffee'] = {'command': 'coffee', 'exec': '%c -cpb %s'}
  let g:quickrun_config['ruby'] = {'command': 'ruby'}
  let g:quickrun_config['ruby.rspec'] = {'command': "spec -l {line('.')}"}
  let g:quickrun_config['php.wordpress'] = {'command': 'php'}
  " let g:quickrun_config['markdown'] = {
        " \ 'type': 'markdown/pandoc',
        " \ 'cmdopt': '-s',
        " \ 'outputter': 'browser'
        " \ }
  " via: http://blog.glidenote.com/blog/2013/01/10/vim-quickrun-marked/
  let g:quickrun_config['markdown'] = {
        \ 'outputter' : 'null',
        \ 'command'   : 'open',
        \ 'cmdopt'    : '-a',
        \ 'args'      : 'Marked',
        \ 'exec'      : '%c %o %a %s',
        \ }
  let g:quickrun_config['textile'] = {
        \ 'command': 'redcloth',
        \ 'tempfile': '%{tempname()}.textile',
        \ 'exec': ['%c %s > %s:p:r.html', 'open %s:p:r.html', 'sleep 1', 'rm %s:p:r.html'] }

endif

"------------------------------------
" NERD_commenter
"------------------------------------

if g:has_plugin( 'nerdcommenter' )
  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1
  let g:NERDShutUp = 1

  vmap <Space>cc <Plug>NERDCommenterToggle
  nmap <Space>cc <Plug>NERDCommenterToggle
  nmap <Space>ca <Plug>NERDCommenterAppend
  nmap <Space>c$ <Plug>NERDCommenterToEOL
  vmap <Space>cs <Plug>NERDCommenterSexy
  vmap <Space>cb <Plug>NERDCommenterMinimal
endif


"------------------------------------
" vim-textmanip
"------------------------------------

if g:has_plugin( 'textmanip' )
  xmap <Space>d <Plug>(textmanip-duplicate-down)
  nmap <Space>d <Plug>(textmanip-duplicate-down)
  xmap <Space>D <Plug>(textmanip-duplicate-up)
  nmap <Space>D <Plug>(textmanip-duplicate-up)

  xmap J <Plug>(textmanip-move-down)
  xmap K <Plug>(textmanip-move-up)
  xmap H <Plug>(textmanip-move-left)
  xmap L <Plug>(textmanip-move-right)
endif

"------------------------------------
" vim-smartchr
"------------------------------------

if g:has_plugin( 'smartchr' )
  inoremap <buffer><expr> + smartchr#loop('+', ' + ', '++')
  inoremap <buffer><expr> - smartchr#loop('-', ' - ', '--')
  inoremap <buffer><expr> / smartchr#loop('/', '/ ', '// ')
  inoremap <buffer><expr> & smartchr#loop('&', ' & ', ' && ')
  inoremap <buffer><expr> % smartchr#loop('%', ' % ', ' %% ')

  inoremap <buffer><expr> , smartchr#one_of(', ', ',', ',<CR>')

  inoremap <buffer><expr> > smartchr#loop('>', ' => ', ' -> ')
  inoremap <buffer><expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
  inoremap <buffer><expr> ! smartchr#loop('!', ' != ')
  inoremap <buffer><expr> <Bar> smartchr#loop('<Bar>', ' <Bar> ', ' <Bar><Bar> ')

  inoremap <buffer><expr> ? smartchr#loop('?', '? ')
  inoremap <buffer><expr> : smartchr#loop(':', ': ', '::')

  inoremap <buffer><expr> ; smartchr#one_of(';', ';<CR>')
  
  inoremap <buffer><expr> } smartchr#one_of('}', '}<CR>')
  
  " inoremap <expr> <buffer> { smartchr#one_of('{', '#{' )
  inoremap {<CR> <Space>{<CR>}<ESC>O
endif

"------------------------------------
" vim-easymotion
"------------------------------------"

if g:has_plugin( 'easymotion' )
  let g:EasyMotion_leader_key = '<Space>'
  let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
  let g:EasyMotion_grouping=1
  hi EasyMotionTarget ctermbg=1 ctermfg=0
  hi EasyMotionShade  ctermbg=none ctermfg=blue
endif

"------------------------------------
" vim-indent-guides
"------------------------------------"

if g:has_plugin( 'indent-guides' )
  let g:miniBufExplModSelTarget = 1
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size = 1
  let g:indent_guides_auto_colors = 0
  if has('autocmd')
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#454545 ctermbg=237
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3E3E3E ctermbg=236
  endif
endif

"------------------------------------
" vim-php-cs-fixer
"------------------------------------"

if g:has_plugin( 'php-cs-fixer' )
  if executable(expand($HOME.'/.vim/bin/php-cs-fixer.phar'))
    let g:php_cs_fixer_path = expand($HOME.'/.vim/bin/php-cs-fixer.phar')
    " let g:php_cs_fixer_level = "all"
    " let g:php_cs_fixer_config = "default"
    " let g:php_cs_fixer_php_path = "php"
    " let g:php_cs_fixer_fixers_list = ""
    " let g:php_cs_fixer_enable_default_mapping = 1
    " let g:php_cs_fixer_dry_run = 0
    " let g:php_cs_fixer_verbose = 0

    function! EnablePCFKeymap()
      nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
      nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
    endfunction
    if has('autocmd')
      autocmd BufNewFile,BufRead *.php call EnablePCFKeymap()
    endif
  endif
endif


"------------------------------------
" zencoding-vim
"------------------------------------

if g:has_plugin( 'zencoding' )
  " <C-e>で展開
  let g:user_zen_expandabbr_key = '<C-e>'
  " 展開するHTMLの言語を設定
  let g:user_zen_settings = {'lang' : 'ja'}
endif

"-----------------------------------
" Autodate
"------------------------------------

let autodate_format = ': %Y/%m/%d %H:%M:%S'
let autodate_keyword_pre = '\cLast Modified'
let autodate_keyword_post = '$'

"------------------------------------
" open-browser.vim
"------------------------------------

if g:has_plugin( 'openbrowser' )
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
endif


"------------------------------------
" vim-powerline
"------------------------------------


if g:has_plugin( 'powerline' )
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
endif

"------------------------------------
" vim-phpdoc
"------------------------------------
if g:has_plugin( 'phpdoc.vim' )
  if has('autocmd')
    " autocmd FileType php inoremap <Space>cd <ESC>:call PhpDocSingle()<CR>i
    autocmd FileType php nnoremap <Space>cd :call PhpDocSingle()<CR>
    autocmd FileType php vnoremap <Space>cd :call PhpDocRange()<CR>
  endif
  let g:pdv_cfg_Author = g:username. ' <'. g:email .'>'
  let g:pdv_cfg_Copyright = "Copyright (c) ".strftime("%Y")
  let g:pdv_cfg_Type = "mixed"
  let g:pdv_cfg_Package = ""
  let g:pdv_cfg_Version = "$id$"
  let g:pdv_cfg_Copyright = ""
  let g:pdv_cfg_License = ""
  let g:pdv_cfg_php4always = 0
endif

"------------------------------------
" FileType
"------------------------------------
if has('autocmd')
  autocmd BufNewFile,BufRead,BufReadPre *.sass set filetype=sass
  autocmd BufNewFile,BufRead,BufReadPre *.less set filetype=less
  autocmd BufNewFile,BufRead,BufReadPre *.scss set filetype=scss
  autocmd BufNewFile,BufRead,BufReadPre *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead,BufReadPre *.slim set filetype=slim
  autocmd BufNewFile,BufRead,BufReadPre *.haml set filetype=haml
  autocmd BufNewFile,BufRead,BufReadPre Makefile.rule set filetype=make
  autocmd BufNewFile,BufRead,BufReadPre *.ctp set filetype=php
endif


" ルートディレクトリの固有ファイル有無でファイルタイプ判断したい ( vim-rooter とか？)
" とりあえず今は場合に応じこれコメントアウトかモードラインに書く
if has('autocmd')
  autocmd BufNewFile,BufRead,BufReadPre *.php set filetype=php.wordpress
  autocmd FileType php.wordpress setlocal syntax=wordpress
  autocmd FileType php.wordpress EnableFastPHPFolds
endif

