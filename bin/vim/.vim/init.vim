" --- ~/.vimrc

" ------ 説明 ------
" --- キー割当て変更コマンド(:h key-mapping)
" ---------------------------------------------------------------------
" | モード                                 | *再割当無し | 再割当有り |
" ---------------------------------------------------------------------
" | ノーマルモード＋ビジュアルモード       | noremap     | map        |
" | コマンドラインモード＋インサートモード | noremap!    | map!       |
" | ノーマルモード                         | nnoremap    | nmap       |
" | ビジュアル(選択)モード                 | vnoremap    | vmap       |
" | コマンドラインモード                   | cnoremap    | cmap       |
" | インサート(挿入)モード                 | inoremap    | imap       |
" ---------------------------------------------------------------------


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


" ------ <Leader>,<LocalLeader> ------
" --- <Leader>,<LocalLeader>の割当て
"     (以降の設定を有効にするため最上行に定義)
let mapleader="\<Space>"
let maplocalleader="\\"
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


" ------ Omni補完専用キーバインド ------
" --- <Tab><?>にキーバインド - https://daisuzu.hatenablog.com/entry/2015/12/05/002129
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
" --- Filetypeを有効にする(Filetypeによる条件分岐に依存)
filetype on
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
"set scrolloff=5
set scrolloff=9999
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
set listchars=tab:>-,extends:<,trail:-
"set listchars=tab:>-,extends:<,trail:-,eol:<
"set listchars=tab:▸\ ,extends:❯,trail:«,precedes:❮,eol:↲
" --- 文字入力/表示の折り返し
" 一行の文字数が多すぎても正常に表示
set display=lastline
" 画面端まで文字入力されても折り返さない
set nowrap
" 文字入力中において右端まで入力された時の自動改行を防止
set formatoptions=q
set textwidth=0
setlocal formatoptions=q
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
" --- Conceal(構文隠蔽)を設定
" 例) jsonのダブルクォーテーションのような、構文としては必要だが視認性を妨げるものを非表示にする
" * 原則 無効(0)が適切だが、indentLine で有効(2)が求められる場合は、各.vimでオーバーライドする
" concealcursor:カーソル行のテキストをどのモード時にConceal表示するかを設定
"               n:ノーマルモード,v:ビジュアルモード,i:挿入モード,c:コマンドライン編集
" conceallevel:Conceal対象のテキストの状態を設定
"               0:通常通り表示(デフォルト),1:代理文字(初期設定はスペース)に置換,2:非表示,3:完<
" -> Concealを有効 -> 全モードでindentが表示されるように設定
" -> indentLine_charの扱いを半角スペースに設定(半角1文字ズレ対策)
" -> Global変数に同じ内容を再定義(他プラグインで上書きされた際の対策)
let g:indentLine_setConceal=0
let g:indentLine_concealcursor='nvic'
let g:indentLine_conceallevel=0
set concealcursor=nvic conceallevel=0
" ---


" ------ ノーマルモード ------
" --- 行番号表示ON/OFF(:set invnumberと同義)
nnoremap <Leader>n :set number!<CR>
" --- Shellの設定(:terminal, :term): <C-w>+hjkl
" デフォルトシェルを定義
set shell=/usr/bin/zsh
" ターミナル起動のショートカット
nnoremap <Leader>t :terminal<CR>
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
inoremap {<CR> {<CR>}<ESC><S-o><TAB>
inoremap (<CR> (<CR>)<ESC><S-o><TAB>
inoremap [<CR> [<CR>]<ESC><S-o><TAB>
"inoremap <<CR> <<CR>><ESC><S-o><TAB>
" --- ポップアップ
" Insert mode補完の設定
" menu:ポップアップメニューを使った補完を有効 , menuone:補完候補が一つしかなくてもポップアップメニューを表示
" longest:マッチする一番長いテキストのみ補完 , preview:補完関数が対応していれば、プレビューウインドウに追加情報を表示
set completeopt=menuone,preview,noinsert
" ポップアップメニューの高さを設定
set pumheight=10
" ポップアップメニューの色を変更
" Pmenu:ノーマルアイテム , PmenuSel:選択しているアイテム
" PmenuSbar:スクロールバー , PmenuThumb:スクロールバーのレバー
highlight  Pmenu ctermbg=6
highlight  PmenuSel ctermbg=11
highlight  PmenuSbar ctermbg=6
highlight  PmenuThumb ctermfg=13
" --- ペースト
" ペーストモード(無効:nopaste, 有効:paste)
" 'nopaste'の場合: `Shift+Insert`で正常にペーストできない可能性有り
" 'paste'の場合:   'inoremap'の再割当てが正常に動作しなくなる
set nopaste
" ペーストモードON/OFF
nnoremap <Leader>p :set paste!<CR>
" INSERTキーを全てのモードで無効にし、誤操作(ペースト)を防止
noremap <silent><Insert> <Nop>
inoremap <silent><Insert> <Nop>
" --- クリップボード
" --- (`$ vim --version | grep clipboard`で`+clipboard`の出力である場合)クリップボードを共有
" unnamed:中クリックでペーストされるテキストをコピー
" autoselect:vim上でハイライトして選択したテキストをクリップボードにコピー,
" unnamedplus:<C-v>などでペーストされるテキストをコピー("+レジスタ(XのCLIPBOARDバッファ)と共有)
" (https://pocke.hatenablog.com/entry/2014/10/26/145646)
set clipboard&
set clipboard^=unnamed,autoselect,unnamedplus
" --- IM
" IMをデフォルトOFFにして挿入モード開始時に全角入力状態を防止
" 0:オフ , 1:オン , -1:iminsertの設定値を参照
set iminsert=0 imsearch=-1
" インサートモードから抜ける(ESC)時、IMを確実にOFF
" 'fcitx5-remote -c'でIMがOFFになるまでのラグを0にする(単体の使用ではOFFにならない)
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
" (MacVim,GVimの場合)インサートモードから抜ける/入る際にIMをOFF
set imdisable
" --- キーバインド(未分類)
" インサートモードから抜ける
inoremap jj <ESC>
inoremap っｊ <ESC>
inoremap じゅん <ESC>
inoremap ff <ESC>
inoremap っｆ <ESC>
inoremap ｆｆ <ESC>
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
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%#warningmsg#
set statusline+=%*
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
