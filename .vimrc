" ------ ** 行頭記載 ** ------
" ------ <Leader> ------
" --- <Leader>の割当て(以降の設定を有効にするため最上行に定義)
let mapleader = "\<Space>"
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
" --- HTMLを簡易整形
highlight link htmlItalic LineNr
highlight link htmlBold WarningMsg
highlight link htmlBoldItalic ErrorMsg
" ---


" ------ 外部プラグイン ------
" --- 常にロード(start)
" --- {{{ ---
" --- vim-fugitive(https://github.com/tpope/vim-fugitive)
"     ステータスバーにGitのブランチ名を表示、その他Git操作
" *   'statusline+=%{fugitive#statusline()}'を定義済み
" --- vim-indent-guides(https://github.com/nathanaelkane/vim-indent-guides)
"     インデントを可視化
" *   インデントの可視化を有効
let g:indent_guides_enable_on_vim_startup=1
" *   インデントの色を設定
let g:indent_guides_auto_colors= 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgray ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=gray
" --- previm(https://github.com/previm/previm)
"     Markdownのプレビュー(mermaid記法対応)
" *   デフォルトブラウザを設定
let g:previm_open_cmd='firefox'
" *   HTMLをブラウザで開くコマンドをキーバインド
nnoremap <Leader>m :PrevimOpen<CR>
" --- }}} ---
" --- 遅延ロード(opt)
" --- {{{ ---
" --- Filetypeを有効にする(Filetypeによる条件分岐に依存)
filetype on
" --- 各プラグインの関数定義
" --- jedi-vim(https://github.com/davidhalter/jedi-vim)
" *   Pythonの入力補完
function! s:config_jedivim()
  " プラグインの設定
  
  " プラグインのロード
  packadd jedi-vim
endfunction
" --- }}} ---
" --- {{{ ---
if has("autocmd")
  " FileTypeによって各プラグインを遅延ロード
  augroup lazy-load
    autocmd!
   " python -> jedi-vim(https://github.com/davidhalter/jedi-vim)
    autocmd FileType python call s:config_jedivim()
  augroup END
endif
" --- }}} ---
" ---


" ------ 外部ソフトウェア ------
" --- Taglist
" ソースコードファイルの構造の概観を提供(<C-l>で表示/非表示)
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <C-l> :TlistToggle<CR>
" ---


" ------ システム(管理) ------
" --- 編集中のファイルが変更されたら自動で読み直す
set autoread
" --- 生成ファイル
" ~/.vim/.netrwhistを作成しない
let g:netrw_dirhistmax=0
" ファイルを上書きする前にバックアップを作成、書込が成功してもバックアップは保存(有効:backup/無効:nobackup)
set nowritebackup
set nobackup
" swapファイルを作成しない
set noswapfile
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
" --- 文字コード
" 文字入力時の文字コードを設定
set fenc=utf-8
" ファイル閲覧時の文字コードを設定(文字化け防止)
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
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
" --- カーソル行の上下へのオフセットを設定
set scrolloff=5
" --- 全角特殊文字の表示を調整(プラグインと競合する可能性有り)
set ambiwidth=double
" --- listモード
" タブ文字をCTRL-Iで表示、行末に$で表示(有効:list/無効:nolist)
set list
" Listモード(訳注:オプション'list'がONの時)に使われる文字を設定
" tab:タブ , extends:折り返した行の行末 , trail:行末のスペース , eol:行末の改行文字 , 
" precedes:折り返してきた行の行頭 , nbsp:ノンブレーカブル・スペース
set listchars=tab:>-,extends:<,trail:-,eol:<
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
" --- IMをデフォルトOFFにして挿入モード開始時に全角入力状態を防止
set iminsert=0 imsearch=0
" --- backspace無反応時の処置
set backspace=indent,eol,start
" ---


" ------ ビジュアルモード ------
" --- バッファを切替えてもundoの効力を失わない
set hidden
" --- XのCLIPBOARDバッファと共有
"set clipboard=unnamedplus
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
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
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
" ---


" ------ コマンドモード ------
" --- 入力コマンドの履歴数を設定
set history=1000
" --- オプション入力時にTAB補完を有効、補完表示をbashライクに設定
set wildmenu
set wildmode=longest,list
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
" [plugin]Gitのブランチ名を表示
" .vim/pack/mypackage/start/vim-fugitive
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
" viminfoファイルを作成しない
"set viminfo=
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
