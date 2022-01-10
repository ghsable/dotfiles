" --- previm/previm - https://github.com/previm/previm
"     --- Markdownのプレビュー(mermaid記法対応)

" *   デフォルトブラウザを設定
let g:previm_open_cmd='firefox'
" *   HTMLをブラウザで開くコマンドをキーバインド
nnoremap <Leader>m :PrevimOpen<CR>
" *   :PrevimOpenによるCSSスタイルをGitHubライクに設定(外部ファイル参照)
"     PrevimのデフォルトCSSスタイルを無効 -> 外部CSSファイルを設定
"     https://blog.wadackel.me/2017/previmg-github-style/
let g:previm_disable_default_css=1
let g:previm_custom_css_path='markdown.css'
