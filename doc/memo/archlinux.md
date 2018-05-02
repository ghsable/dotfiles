ビデオカードのブランド,PCIアドレスを確認 :

    lspci | grep -e VGA -e 3D

udevが正しくサウンドカードを検知しているかチェックする :

    lsmod | grep '^snd' | column -t
