" --- prabirshrestha/asyncomplete.vim - https://github.com/prabirshrestha/asyncomplete.vim
"     --- 非同期のオートコンプリート
" --- prabirshrestha/asyncomplete-lsp.vim - https://github.com/prabirshrestha/asyncomplete-lsp.vim
"     --- asyncomplete.vimとvim-lspにLanguage Server Protocolのオートコンプリートソースを提供

" *   入力開始時に自動的にオートコンプリートポップアップメニューを表示
let g:asyncomplete_auto_popup=1
" *   'completeopt'のオーバーライドを許可(0:無効, 1:有効)
let g:asyncomplete_auto_completeopt=0
" *   オートコンプリートポップアップ表示までのディレイ
let g:asyncomplete_popup_delay=100
" *   Enter押下で改行せずにポップアップを閉じる
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"
