" --- Yggdroot/indentLine - https://github.com/Yggdroot/indentLine
"     --- インデントを可視化(関数の終了位置を認識できるように縦線を入れる)
"         (nathanaelkane/vim-indent-guidesと競合するため、いずれかを無効にする必要がある)

" *   indentLineを設定(0:無効,1:有効)
"     ':IndentLinesToggle'で表示切替
let g:indentLine_enabled=1
" *   インデントの色を設定(1:グレー色,2:グレー色強調)
"let g:indentLine_setColors=1
" *   インデントの色を数値で設定(239:グレー色が基準)
let g:indentLine_color_term=243
"let g:indentLine_color_gui = '#708090'
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
let g:indentLine_setConceal=1
let g:indentLine_concealcursor='nvic'
let g:indentLine_conceallevel=2
set concealcursor=nvic conceallevel=2
