" --- prabirshrestha/vim-lsp - https://github.com/prabirshrestha/vim-lsp/
"     --- 非同期のLanguage Server Protocol
"         - Document: https://github.com/prabirshrestha/vim-lsp/blob/master/doc/vim-lsp.txt

" *   Diagnostics(ファイルの変更に伴いリアルタイムにエラー表示する機能)を有効にする設定
let g:lsp_diagnostics_enabled=1
" *   現在の行の診断エラーをステータスに表示
let g:lsp_diagnostics_echo_cursor=1
" *   コードのLinterとして表示をするシンボル・表示までの時間を定義
"     デフォルト値:
"       - `LspError` defaults to `E>`
"       - `LspHint` defaults to `H>`
"       - `LspInformation` defaults to `I>`
"       - `LspWarning` defaults to `W>`
let g:lsp_diagnostics_signs_enabled=1
let g:lsp_diagnostics_signs_error={'text': '✗'}
let g:lsp_diagnostics_signs_hint={'text': 'H>'}
let g:lsp_diagnostics_signs_information={'text': 'I>'}
let g:lsp_diagnostics_signs_warning={'text': '⚠'}
let g:lsp_diagnostics_signs_delay=100
" *   エラー行と別の行にカーソルがある時のシンボル表示(コードアクション状態)を非表示(0)にする
let g:lsp_document_code_action_signs_enabled=0
"let g:lsp_document_code_action_signs_hint={'text': 'A>'}
"let g:lsp_document_code_action_signs_delay=100
" *   textEditプロパティによる補完機能を設定(0:無効, 1:有効)
"     動作がおかしい場合は無効(0)にする
let g:lsp_text_edit_enabled=1
