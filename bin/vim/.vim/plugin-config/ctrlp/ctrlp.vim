" --- ctrlpvim/ctrlp.vim - https://github.com/ctrlpvim/ctrlp.vim
"     --- ファジーファインダー

" *   ctrlp起動のキーマップを定義
"let g:ctrlp_map='<c-p>'
"let g:ctrlp_cmd='CtrlP'
" *   ctrlpの対象から除外
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
