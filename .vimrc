

" ------ 全体 ------
" --- 入力コマンドの履歴数を50件に設定
set history=50
" --- バッファを切替えてもundoの効力を失わない
set hidden
" --- 行間を1を設定
set linespace=1
" --- コメント行で改行すると次の行の先頭に自動的にコメント記号が入らない
set fo=cqlM
" --- 画面端まで文字入力されても折り返さない
set nowrap
" --- 入力中において右端まで入力された時の自動改行を防止
autocmd FileType text setlocal textwidth=0
" --- 一行の文字数が多すぎても正常に表示
set display=lastline
" --- タブ文字をCTRL-Iで表示、行末に$で表示(有効:list/無効:nolist)
set list
" --- Listモード(訳注:オプション'list'がONの時)に使われる文字を設定
" tab:タブ , extends:折り返した行の行末 , trail:行末のスペース , eol:行末の改行文字 , 
" precedes:折り返してきた行の行頭 , nbsp:ノンブレーカブル・スペース
set listchars=tab:>-,extends:<,trail:-,eol:<
" --- Esc押した時の切替時間短縮
set timeout timeoutlen=0
" --- ビープ音オフ
set vb t_vb=


" ------ システム管理 ------
" --- ファイルを上書きする前にバックアップを作成、書込が成功してもバックアップは保存(有効:backup/無効:nobackup)
set nobackup
" --- swapファイルを作成しない
set noswapfile
" --- viminfoファイルを作成しない
set viminfo=


" ------ システム表示 ------
" --- 行番号を表示
set number
" --- カーソルが何行目の何列目に置かれているかを表示(有効:ruler/無効:noruler)
set ruler
" --- 起動時のメッセージを非表示
set shortmess+=I
" --- ステータス行にコマンドを表示
set showcmd
" --- モードを非表示
set noshowmode
" --- 最下ウィンドウにいつステータス行が表示されるかを設定
" 0:全く表示しない , 1:ウィンドウの数が2以上のときのみ表示 , 2:常に表示
set laststatus=2
" コマンド(の一部)を画面の最下行に表示(有効:showcmd/無効:noshowcmd)
set showcmd
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" ---
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ---
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title


" ------ 文字入力 ------
" --- オートインデント
set autoindent
" --- <Tab>を半角空白2文字に置き換える
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" --- backspace無反応時の処置
set backspace=indent,eol,start
" --- IMをデフォルトOFFにして挿入モード開始時に全角入力状態を防止
set iminsert=0 imsearch=0
" --- スクロール時に5行空ける
set so=5


" ------ 補完/強調 ------
" --- シンタックス有効
syntax enable
" --- 補完メニューの高さを設定
set pumheight=10
" --- 対応した括弧を強調非表示
set noshowmatch
let loaded_matchparen=1
" --- 対応した括弧を強調表示
" --- 対応する括弧の表示時間を0.1秒に設定
"set showmatch
"set matchtime=1
" --- オプション入力時にTAB補完を有効、補完表示をbashライクに設定
set wildmenu
set wildmode=longest,list
" --- 横方向を強調表示/アンダーライン設定/行番号強調設定/カーソル削除
" 行番号のみ強調表示
set cursorline
"hi CursorLine term=underline cterm=underline guibg=Grey90
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE
hi clear CursorLine
" 縦方向を強調表示
"set cursorcolumn


" ------ ポップアップ ------
" --- Insert mode補完の設定
" menu:ポップアップメニューを使った補完を有効 , menuone:補完候補が一つしかなくてもポップアップメニューを表示
" longest:マッチする一番長いテキストのみ補完 , preview:補完関数が対応していれば、プレビューウインドウに追加情報を表示
set completeopt=menuone,preview
" --- ポップアップメニューの色を変更
" Pmenu:ノーマルアイテム , PmenuSel:選択しているアイテム
" PmenuSbar:スクロールバー , PmenuThumb:スクロールバーのレバー
highlight Pmenu ctermbg=6
highlight PmenuSel ctermbg=11
highlight PmenuSbar ctermbg=6
highlight PmenuThumb ctermfg=13


" ------ 検索 ------
" --- 検索した文字をハイライト表示
set hlsearch
" --- インクリメンタルサーチを有効
set incsearch
" --- 検索時に大文字/小文字を無視
set ignorecase
" --- 大文字/小文字の両方が含まれている時は区別
set smartcase
" --- 検索がファイル末尾まで進んだらファイル先頭から再び検索(有効:wrapscan/無効:nowrapscan)
set wrapscan


" ------ キーバインド ------
" --- 行末コピー(Y)
nnoremap Y y$
" --- インクリメント(+)/デクリメント(-)
nnoremap + <C-a>
nnoremap - <C-x>
