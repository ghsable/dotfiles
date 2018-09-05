" --- ~/.vimrc


" ------ 文字コード ------
" --- ファイル読込み時の文字コードを設定
let &termencoding=&encoding
set encoding=utf-8
" --- 使用するファイル形式を設定
set fileformats=unix,dos,mac
" --- ファイル保存時の文字コードを設定
set fileencoding=utf-8
" --- ファイル閲覧時の文字コードを設定(文字化け防止)
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
" --- 文字入力時の文字コードを設定
set fenc=utf-8
" --- Vim script内でマルチバイト文字を使う場合の設定
scriptencoding utf-8
" --- 全角特殊文字の表示を調整(プラグインと競合する可能性有り)
set ambiwidth=double
" ---


" ------ <Leader> ------
" --- <Leader>の割当て(以降の設定を有効にするため最上行に定義)
let mapleader="\<Space>"
" --- キーバインド
" 保存/終了
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" 行頭/行末に移動
noremap <Leader>h ^
noremap <Leader>l $
" 他は各プラグインに記載
" ---


" ------ カラースキーム ------
" --- 背景色を設定
set background=dark
" --- {{{ ---
" --- 全角スペースの表示('Colorscheme'に依存)
autocmd Colorscheme * highlight FullWidthSpace cterm=underline ctermbg=darkgray ctermfg=lightblue gui=underline guifg=lightblue guibg=darkgray
autocmd VimEnter * match FullWidthSpace /　/
" カラースキームの設定
" default , koehler , murphy , desert , pablo , peachpuff , elflord
" blue , darkblue , delek , evening , morning
" *1 : autocmd Colorschemeより下に記載しないとエラーが発生する
" *2 : highlightより上に記載しないと設定が上書きされる
colorscheme default
" --- }}} ---
" --- HTMLを簡易強調表示
highlight link htmlItalic LineNr
highlight link htmlBold WarningMsg
highlight link htmlBoldItalic ErrorMsg
" ---


" ------ 外部プラグイン ------
" --- 常にロード(start)
" --- {{{ ---
" --- vim-jp/vimdoc-ja(https://github.com/vim-jp/vimdoc-ja)
"     --- ':help'を日本語化
" *   表示言語の優先度を設定(:help @enで英語表示)
set helplang=ja,en
" *   ヘルプを画面全体で開く
set helpheight=999
" --- tpope/vim-fugitive(https://github.com/tpope/vim-fugitive)
"     --- Gitの機能提供
" *   ステータスバーにGitのブランチ名を表示、その他Git操作
"statusline+=%{fugitive#statusline()} -> 定義済み
" --- Yggdroot/indentLine(https://github.com/Yggdroot/indentLine)
"     --- インデントを可視化(関数の終了位置を認識できるように縦線を入れる)
"         nathanaelkane/vim-indent-guidesと競合するため、いずれかを無効にする必要がある
" *   indentLineを設定(0:無効,1:有効)
"     ":IndentLinesToggle"で表示切替を行う
let g:indentLine_enabled=1
" *   インデントの色を設定(1:グレー色,2:グレー色強調)
"let g:indentLine_setColors=1
" *   インデントの色を数値で設定(239:グレー色が基準)
let g:indentLine_color_term=243
" *   インデント表示を定義
"     例) c,¦,┆,│,▏
"     * 全角文字を利用するとカーソル位置が半角1文字ズレるため注意
let g:indentLine_char='¦'
" *   ファイルタイプでインデント表示を除外
let g:indentLine_fileTypeExclude=['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim']
" *   Conceal(構文隠蔽)を設定
"     例) jsonのダブルクォーテーションのような、構文としては必要だが視認性を妨げるものを非表示にする
"     concealcursor:カーソル行のテキストをどのモード時にConceal表示するかを設定
"                   n:ノーマルモード,v:ビジュアルモード,i:挿入モード,c:コマンドライン編集
"     conceallevel:Conceal対象のテキストの状態を設定
"                   0:通常通り表示(デフォルト),1:代理文字(初期設定はスペース)に置換,2:非表示,3:完全に非表示
"     -> Concealを有効 -> 全モードでindentが表示されるように設定
"     -> indentLine_charの扱いを半角スペースに設定(半角1文字ズレ対策)
"     -> Global変数に同じ内容を再定義(他プラグインで上書きされた際の対策)
let g:indentLine_setConceal=0
let g:indentLine_concealcursor='nvic'
let g:indentLine_conceallevel=0
set concealcursor=nvic conceallevel=0
" --- nathanaelkane/vim-indent-guides(https://github.com/nathanaelkane/vim-indent-guides)
"     --- インデントを可視化(半角空白2文字のインデントに色を付ける)
"         Yggdroot/indentLineと競合するため、いずれかを無効にする必要がある
" *   インデントの可視化を有効
"let g:indent_guides_enable_on_vim_startup=1
" *   インデントの色を設定
"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  guibg=darkgray ctermbg=darkgray
"autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=gray ctermbg=gray
" --- previm/previm(https://github.com/previm/previm)
"     --- Markdownのプレビュー(mermaid記法対応)
" *   デフォルトブラウザを設定
let g:previm_open_cmd='firefox'
" *   HTMLをブラウザで開くコマンドをキーバインド
nnoremap <Leader>m :PrevimOpen<CR>
" *   :PrevimOpenによるCSSスタイルをGitHubライクに設定(外部ファイル参照)
"     PrevimのデフォルトCSSスタイルを無効 -> 外部CSSファイルを設定
"     https://blog.wadackel.me/2017/previmg-github-style/
let g:previm_disable_default_css=1
let g:previm_custom_css_path='~/.vim/myconfig/previm/markdown.css'
" --- davidhalter/jedi-vim(https://github.com/davidhalter/jedi-vim)
"     --- Pythonの入力補完<Ctrl-c>
" *   自動補完機能を有効(有効:1,無効:0)
let g:jedi#completions_enabled=1
let g:jedi#auto_vim_configuration=1
" *   "."を入力すると補完が自動表示される設定を解除
let g:jedi#popup_on_dot=0
" *   docstring(補足説明)を非表示
autocmd FileType python setlocal completeopt-=preview
" --- rust-lang/rust.vim(https://github.com/rust-lang/rust.vim)
"     --- Rustのハイライト表示・インデント等
" *   オートインデントを設定(1:有効/2:無効)
let g:rust_recommended_style=0
" --- racer-rust/vim-racer(https://github.com/racer-rust/vim-racer)
"     --- Rustの入力補完<Ctrl-x><Ctrl-o>
" *   racerバイナリを指定(pacman依存,cargo未使用)
let g:racer_cmd=expand('/usr/bin/racer')
" *   補完時の関数定義(例:引数と戻り値の型)の表示設定(1:表示/2:非表示)
let g:racer_experimental_completer=0
" --- vim-syntastic/syntastic(https://github.com/vim-syntastic/syntastic)
"     --- 構文エラーチェック
" *   構文エラー行に「>>」を表示
let g:syntastic_enable_signs=1
" *   各言語のチェッカーを設定
"     * 言語によって、左サイドのエラー表示(>>)領域が常に表示している/していないがある
"     例) g:syntastic_<言語名>_checkers=['<Linter名>']
let g:syntastic_rust_checkers=['cargo']
let g:syntastic_python_checkers=['flake8']
" *   ロードするチェッカーを設定(機能を限定する事でロード時間を短縮)
"     'active':バッファを保存するたびにsyntasticが機能 ,
"     'passive':":SyntasticCheck"実行時にsyntasticが機能
"     -> 'active_filetypes'に指定した言語はバッファ保存時に機能、それ以外は":SyntasticCheck"実行時に機能
let g:syntastic_mode_map={ 'mode': 'passive',
                         \ 'active_filetypes': ['rust','python'],
                         \ 'passive_filetypes': []
                         \ }
" *   他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list=1
" *   構文エラーリスト(":Errors")の表示設定(0:非表示,1:表示)
let g:syntastic_auto_loc_list=0
" *   ファイルを開いた時に構文エラーチェックを実行
let g:syntastic_check_on_open=1
" *   ":wq"で終了する時に構文エラーチェックを実行しない(":w"でエラーチェックを行う設定にしているため)
let g:syntastic_check_on_wq=0
" *   シンボルの定義(デフォルト:'>>')
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='⚠'
" --- vim-scripts/taglist.vim(https://github.com/vim-scripts/taglist.vim)
"     --- ソースコードファイルの構造をリスト表示/タグジャンプ
" ArchWiki推奨設定(<C-l>で表示/非表示)
let Tlist_Compact_Format=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
nnoremap <C-l> :TlistToggle<CR>
" --- }}} ---


" --- 遅延ロード(opt)
" --- {{{ ---
" --- Filetypeを有効にする(Filetypeによる条件分岐に依存)
filetype on
" --- 各プラグインの関数定義
" --- xxx(https://github.com/xxx/xxx)
" *   xxx
"function! s:config_xxx()
  " プラグインの設定
  " プラグインのロード
"  packadd xxx
"endfunction
" --- }}} ---
" --- {{{ ---
"if has("autocmd")
  " FileTypeによって各プラグインを遅延ロード
"  augroup lazy-load
"    autocmd!
   " xxx -> xxx(https://github.com/xxx/xxx)
"    autocmd FileType xxx call s:config_xxx()
"  augroup END
"endif
" --- }}} ---
" ---


" ------ 外部コマンド ------
" --- Ctags(https://ja.wikipedia.org/wiki/Ctags)
"     --- タグジャンプ機能を提供(ctags -R -f ~/.tags)
" タグファイルのロード先を定義(カレントディレクトリから${HOME}へ遡って検索)
set tags=.tags;${HOME}
" タグファイルを自動生成(トリガ:現在のファイルの上書き時)
function! s:execute_ctags() abort
  " タグファイル名を定義
  let tag_name='.tags'
  " ディレクトリを遡りタグファイルを探しパスを取得
  let tags_path=findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合の処理
  " -> ${HOME}にインデックスファイルを生成
  if tags_path==#''
    execute 'silent !cd ${HOME} && ctags -R -f' tag_name '2> /dev/null &'
    return
  endif
  " タグファイルのディレクトリパスを取得(`:p:h`の部分は、:h filename-modifiersで確認)
  let tags_dirpath=fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動し'ctags'をバックグラウンド実行(エラー出力破棄)
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction
augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END
" キーバインド(タグジャンプ時に複数ある場合は一覧表示)
nnoremap <C-]> g<C-]>
" ---


" ------ Omni補完専用キーバインド ------
" --- <Tab><?>にキーバインド(https://daisuzu.hatenablog.com/entry/2015/12/05/002129)
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : MyInsCompl()
function! MyInsCompl()
  let c = nr2char(getchar())
  " 現在のファイルを行単位で検索
  if c == "l"
    return "\<C-x>\<C-l>"
  " 現在のファイルの単語単位で検索(上から)
  elseif c == "n"
    return "\<C-x>\<C-n>"
  " 現在のファイルの単語単位で検索(下から)
  elseif c == "p"
    return "\<C-x>\<C-p>"
  " 'dictionary'オプションから検索
  elseif c == "k"
    return "\<C-x>\<C-k>"
  " 'thesaurus'オプションから検索
  elseif c == "t"
    return "\<C-x>\<C-t>"
  " 現在のファイル/インクルードされているファイルから単語単位で検索
  elseif c == "i"
    return "\<C-x>\<C-i>"
  " 'tags'オプションから検索(外部プログラムCtags依存)
  elseif c == "]"
    return "\<C-x>\<C-]>"
  " ディレクトリー/ファイルネームを検索
  elseif c == "f"
    return "\<C-x>\<C-f>"
  " 'define'オプション/'include'オプション/'path'オプションから検索
  elseif c == "d"
    return "\<C-x>\<C-d>"
  " Vimコマンドを検索
  elseif c == "v"
    return "\<C-x>\<C-v>"
  " 'completefunc'オプションから検索
  elseif c == "u"
    return "\<C-x>\<C-u>"
  " 'omnifunc'オプションから検索(プラグイン拡張補完機能を割当)
  elseif c == "o"
    return "\<C-x>\<C-o>"
  " スペル提案('spell'オプションに依存)
  elseif c == "s"
    return "\<C-x>s"
  endif
  return "\<Tab>"
endfunction
" ---


" ------ システム(管理) ------
" --- 編集中のファイルが変更されたら自動で読み直す
set autoread
" --- 未保存ファイルがある時は終了前に保存確認
set confirm
" --- 生成ファイル
" ~/.vim/.netrwhistを作成しない
let g:netrw_dirhistmax=0
" ファイルを上書きする前にバックアップを作成、書込が成功してもバックアップは保存(有効:backup/無効:nobackup)
set nowritebackup
set nobackup
" swapファイルを作成しない
set noswapfile
" viminfoファイルを作成しない
"set viminfo=
" --- Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" --- スクロール時に5行空ける
set so=5
" --- ビープ音
" ビープ音オフ
set vb t_vb=
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" ビープ音を可視化
set visualbell
" --- backspace無反応時の処置
set backspace=indent,eol,start
" ---


" ------ システム(表示) ------
" --- GUI
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 新しいウィンドウを下/右に開く(プラグイン競合の可能性有り)
set splitbelow
set splitright
" --- 起動時のメッセージを非表示
set shortmess+=I
" --- ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" ---


" ------ 全体(モード不問) ------
" --- シンタックス有効
syntax on
" --- カーソル位置強調(行列)
" 行番号を表示(number:絶対番号/relativenumber:相対番号)
set number
" 横方向を強調表示/アンダーライン設定/行番号強調設定/カーソル削除
" -> 行番号のみ強調表示
set cursorline
"highlight  CursorLine term=underline cterm=underline guibg=Grey90
highlight  CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE
highlight  clear CursorLine
" 列方向を強調表示
"set cursorcolumn
" --- 行間を設定
set linespace=1
" --- スクロール
" カーソル行の上下へのオフセットを設定
set scrolloff=5
" カーソル行の左右へのオフセットを設定
set sidescrolloff=16
" 左右スクロールは一文字づつ行う
set sidescroll=1
" --- listモード
" タブ文字をCTRL-Iで表示、行末に$で表示(有効:list/無効:nolist)
set list
" Listモード(訳注:オプション'list'がONの時)に使われる文字を設定
" tab:タブ , extends:折り返した行の行末 , trail:行末のスペース , eol:行末の改行文字 ,
" precedes:折り返してきた行の行頭 , nbsp:ノンブレーカブル・スペース
set listchars=tab:>-,extends:<,trail:-,eol:<
"set listchars=tab:▸\ ,extends:❯,trail:«,precedes:❮,eol:↲
" --- 文字入力/表示の折り返し
" 一行の文字数が多すぎても正常に表示
set display=lastline
" 画面端まで文字入力されても折り返さない
set nowrap
" 文字入力中において右端まで入力された時の自動改行を防止
setlocal textwidth=0
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" --- マウスサポート有効
"set mouse=a
"set ttymouse=xterm2
" --- 行頭で'←'、行末で'→'を押した時に次行へカーソルを遷移
set whichwrap=b,s,<,>,[,]
" --- 行末の1文字先までカーソルを移動できるようにする
"set virtualedit=onemore
" --- スペルチェックを有効にする(ただし日本語は除外)
"set spelllang+=cjk
"set spell
" ---


" ------ ビジュアルモード ------
" --- バッファを切替えてもundoの効力を失わない
set hidden
" --- XのCLIPBOARDバッファと共有
"set clipboard=unnamed,unnamedplus
" --- 検索
" 検索した文字をハイライト表示
set hlsearch
" インクリメンタルサーチを有効
set incsearch
" 検索時に大文字/小文字を無視
set ignorecase
" 検索時に大文字/小文字の両方が含まれている時は区別
set smartcase
" 検索がファイル末尾まで進んだらファイル先頭から再び検索(有効:wrapscan/無効:nowrapscan)
set wrapscan
" --- 置換
" 置換の時、'g'オプションをデフォルトで有効
set gdefault
" {{{ ---
" 検索時のハイライト解除
" Esc押した時の切替時間短縮(Escキーバインド依存、設定するとEscキーバインドが無効化される)
"set timeout timeoutlen=0
" ESC連打で検索時ハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR>
" --- }}}
" --- {{{ ---
" --- 数値の扱い
" 全ての数を10進数として扱う(デフォルトは8進数、<C-a>,<C-x>に依存)
set nrformats=
" インクリメント(+)/デクリメント(-)にキーバインドを設定(nrformatsに依存)
nnoremap + <C-a>
nnoremap - <C-x>
" --- }}} ---
" --- キーバインド(未分類)
" 行末コピー(Y)
nnoremap Y y$
" 挿入モードでカーソル移動(<C-j>,<C-k>,<C-h>,<C-l>)
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" ---


" ------ インサートモード ------
" --- インデント
" オートインデント
" autoindent:一つ前の行に基づくインデント
" smartindent:autoindentと同様だが幾つかのC構文を認識し適切な箇所のインデントを増減
" cindent:他の2つの方法よりも賢く動作し異なるインデントスタイルにも対応
" indentexpr:この中で一番融通が利く:ある行のインデントを計算するのにVimスクリプトを実行
"            この方法が有効である(空でない)時にはその他のインデントは抑制される
set autoindent
set smartindent
" コメント行で改行すると次の行の先頭に自動的にコメント記号が入らない
set fo=cqlM
" <Tab>を半角空白2文字に置き換える
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" --- 括弧入力/表示
" 対応した括弧を強調表示、対応する括弧の表示時間を0.1秒に設定
set showmatch matchtime=1
" 対応した括弧の強調を非表示
"set noshowmatch
"let loaded_matchparen=1
" 自動で括弧を閉じる
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
"inoremap < <><LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
" 改行した時に自動で括弧を閉じる
inoremap {<CR> {<CR>}<ESC><S-o>
inoremap (<CR> (<CR>)<ESC><S-o><TAB>
inoremap [<CR> [<CR>]<ESC><S-o><TAB>
"inoremap <<CR> <<CR>><ESC><S-o><TAB>
" --- ポップアップ
" Insert mode補完の設定
" menu:ポップアップメニューを使った補完を有効 , menuone:補完候補が一つしかなくてもポップアップメニューを表示
" longest:マッチする一番長いテキストのみ補完 , preview:補完関数が対応していれば、プレビューウインドウに追加情報を表示
set completeopt=menuone,preview
" ポップアップメニューの高さを設定
set pumheight=10
" ポップアップメニューの色を変更
" Pmenu:ノーマルアイテム , PmenuSel:選択しているアイテム
" PmenuSbar:スクロールバー , PmenuThumb:スクロールバーのレバー
highlight  Pmenu ctermbg=6
highlight  PmenuSel ctermbg=11
highlight  PmenuSbar ctermbg=6
highlight  PmenuThumb ctermfg=13
" --- ペーストモード(有効:paste , 無効:nopaste)
set nopaste
" --- キーバインド(未分類)
" インサートモードから抜ける
inoremap jj <ESC>
inoremap っｊ <ESC>
" --- IMをデフォルトOFFにして挿入モード開始時に全角入力状態を防止
set iminsert=0 imsearch=0
" ---


" ------ コマンドモード ------
" --- 入力コマンドの履歴数を設定
set history=1000
" --- オプション入力時にTAB補完を有効、補完表示をbashライクに設定
" '""':最初のマッチのみ補完 , 'full':Tabを押すごとに次のマッチを補完、wildmenuが有効ならwildmenuを開始 ,
" 'longest':共通する最長の部分まで補完 , 'list':マッチするものをリスト表示 ,
" 'longest:full':longestと同じだがwildmenuが有効ならwildmenuを開始
" 'list:full':マッチするものをリスト表示しつつTABを押すごとに次のマッチを補完
" 'list:longest':マッチするものをリスト表示しつつ共通する最長の部分まで補完
set wildmenu wildmode=list:longest,full
" ---


" ------ ステータスバー ------
" --- 全般
" 最下ウィンドウにいつステータス行が表示されるかを設定
" 0:全く表示しない , 1:ウィンドウの数が2以上のときのみ表示 , 2:常に表示
set laststatus=2
" カーソルが何行目の何列目に置かれているかを表示(有効:ruler/無効:noruler)
set ruler
" コマンド(の一部)を画面の最下行に表示(有効:showcmd/無効:noshowcmd)
set showcmd
" コマンドラインに使われる画面上の行数を設定
set cmdheight=1
" モードを非表示
set showmode
" ウィンドウ下部のgVimが確保するスペースを調整
set guiheadroom=0
" --- 画面表示(LEFT)
" ファイル名
set statusline=%F
" 変更チェック
set statusline+=%m
" 読み込み専用かどうか
set statusline+=%r
" ヘルプページなら[HELP]
set statusline+=%h
" プレビューウインドウなら[Preview]
set statusline+=%w
" --- 画面表示(RIGHT)
" これ以降は右寄せ表示
set statusline+=%=
" [plugin][syntastic]構文エラーの最終行を表示
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%#warningmsg#
set statusline+=%*
" [plugin][vim-fugitive]Gitのブランチ名を表示
set statusline+=%{fugitive#statusline()}
" FileType(現在編集中ファイルのタイプ、filetypeに依存)
set statusline+=%y
" File Encoding
set statusline+=[ENC=%{&fileencoding}]
" 何列列数/全列数
set statusline+=[COLUMN=%c]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ---


" ------ 疑似プラグイン ------
" --- {{{ ---
" --- カーソル位置を記憶(~/.viminfo依存)
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
" --- }}} ---
" --- 挿入モード時にステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine gui=none guifg=black guibg=yellow cterm=none ctermfg=black ctermbg=yellow'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
" ---
