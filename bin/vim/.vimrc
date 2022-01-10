" --- ~/.vimrc

" ------ デフォルト ------
" --- {{{ ---
runtime! init.vim
" --- }}} ---

" ------ 外部コマンド ------
" --- {{{ ---
runtime! package-config/*/*.vim
" --- }}} ---

" ------ 外部プラグイン ------
" --- 常にロード(pack/start)
" --- {{{ ---
runtime! plugin-config/*/*.vim
" --- }}} ---
