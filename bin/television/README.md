# Television

## Requirement

**Hardware**

* [JFL3D-P](https://www.maspro.co.jp/pdfview/pdfview.php?keyword=JFL3D-P&tp=C&search=%B8%A1%BA%F7)
* [CSR7DW-P](https://www.maspro.co.jp/web_catalog2017/maspro2017/HTML5/pc.html#/page/161)
* [PX-S1UD](http://www.plex-net.co.jp/product/px-s1udv2plus/)
or [PX-Q1UD1](http://www.plex-net.co.jp/product/px-q1ud/)
* [SCR3310-NTTCom](https://www.ntt.com/business/services/application/authentication/jpki/download2.html)
* [B-CAS](https://www.b-cas.co.jp/)

**Software**

* [libarib25](https://aur.archlinux.org/packages/libarib25-git/)
* [recdvb](https://aur.archlinux.org/packages/recdvb/)

## Reference

* [地上デジタル放送 チャンネル一覧表](https://www.maspro.co.jp/contact/bro/bro_ch.html)

## Example

recdvb:

    recdvb --b25 --strip <channel> <sec> /path/to/file.ts
