" --- fcitx/fcitx5 - https://github.com/fcitx/fcitx5
"      --- Input Method Framework
" --- google/mozc - https://github.com/google/mozc
"      --- 日本語Input Method Editor(IME)

" *   インサートモード/コマンドラインを抜けた後に入力メソッドをOFF - https://wonwon-eater.com/linux-vim-neovim-ime/
"     fcitx5-remote -c: 入力メソッドOFF, fcitx5-remote -o: 入力メソッドON
if executable('fcitx5')
  autocmd InsertLeave * :call system('fcitx5-remote -c')
  autocmd CmdlineLeave * :call system('fcitx5-remote -c')
endif
