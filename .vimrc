" ------ 全体 ------
" --- 行番号を表示
set number
" --- シンタックス有効
syntax enable
" --- 行間を1を設定
set linespace=1
" --- 検索した文字をハイライト表示
set hlsearch
" --- オートインデント
set autoindent
" --- ステータス行にコマンドを表示
set showcmd
" --- モードを非表示
set noshowmode
" --- 画面端まで文字入力されても折り返さない
set nowrap
" --- 対応した括弧を強調非表示
set noshowmatch
let loaded_matchparen=1
" --- 対応した括弧を強調表示
" --- 対応する括弧の表示時間を0.1秒に設定
"set showmatch
"set matchtime=1
" --- バッファを切替えてもundoの効力を失わない
set hidden
" --- 起動時のメッセージを非表示
set shortmess+=I
" --- インクリメンタルサーチを有効
set incsearch
" --- 検索時に大文字/小文字を無視
set ignorecase
" --- 大文字/小文字の両方が含まれている時は区別
set smartcase
" --- オプション入力時にTAB補完を有効、補完表示をbashライクに設定
set wildmenu
set wildmode=longest,list
" --- 入力コマンドの履歴数を50件に設定
set history=50
" --- 一行の文字数が多すぎても正常に表示
set display=lastline
" --- 補完メニューの高さを設定
set pumheight=10
" --- Yを行末コピー挙動に再バインディング
nnoremap Y y$
" --- インクリメント(+)/デクリメント(-)に再バインディング
nnoremap + <C-a>
nnoremap - <C-x>

" ------ その他 ------
" --- ビープ音オフ
set vb t_vb=
" --- backspace無反応時の処置
set backspace=indent,eol,start
"コメント行で改行すると次の行の先頭に自動的にコメント記号が入らない
set fo=cqlM
" --- IMをデフォルトOFFにして挿入モード開始時に全角入力状態を防止
set iminsert=0 imsearch=0
" --- Esc押した時の切替時間短縮
set timeout timeoutlen=0
" --- スクロール時に5行空ける
set so=5
