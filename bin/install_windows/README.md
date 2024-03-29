# Windows

## Installation
Partition :

| Device    | Partition   | Size  | Type       | Partition Name      |
| :---      | :---        | :---  | :---       | :---                |
| /dev/sdX1 | Partition 1 | 5GB   | 回復       | Recovery,Windows RE |
| /dev/sdX2 | Partition 2 | 1GB   | システム   | System,ESP          |
| /dev/sdX3 | Partition 3 | 10GB  | 予約       | Reserved,MSR        |
| /dev/sdX4 | Partition 4 | 500GB | プライマリ | -                   |

```
# diskpart起動/ディスク番号確認
## Windowsセットアップより「Shift + F10」
diskpart
list disk
# HDDを選択
select disk 0
# 既存のパーティションを削除(パーティション分繰り返す)
list partition
select partition 0
delete partition override
# MBR->GPT形式へ変換
clean
convert gpt
# パーティションを順番に作成
## Partition 1
create partition primary size=5000
format quick fs=ntfs label="Windows RE tools"
set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac"
gpt attributes=0x8000000000000001
## Partition 2
create partition efi size=1000
format quick fs=fat32 label="System"
## Partition 3
create partition msr size=10000
## Partition 4
create partition primary size=500000
format quick fs=ntfs label="Windows"
# 最終確認
list volume
list partition
# 完了
exit
exit
```

Application :

> **Hardware**
>> * [ ] [Lenovo Vantage](https://www.microsoft.com/ja-jp/p/lenovo-vantage/9wzdncrfj4mv?activetab=pivot:overviewtab)
>> * [ ] [X570 Creator](https://www.asrock.com/MB/AMD/X570%20Creator/index.jp.asp#Download)
>> * [ ] [NVIDIA EXPERIENCE + DRIVER](https://www.nvidia.co.jp/Download/index.aspx?lang=jp)
>> * [ ] [Wacom SOFTWARE + DRIVER](https://account.wacom.com/ja-jp/software-library)
>> * [ ] [Kensington SlimBlade Trackball](https://www.kensington.com/p/slimblade-trackball/)
>> * [ ] [ELECOM M-DPT1MRBK,M-DWL01DBBK](https://www.elecom.co.jp/support/download/peripheral/mouse/assistant/)
>> * [ ] [ELECOM M-DUX50BK](https://www.elecom.co.jp/support/download/peripheral/mouse/m-dux_30_50/)
>> * [ ] [YAMAHA AG03](https://jp.yamaha.com/products/music_production/webcasting_mixer/ag03/downloads.html)
>> * [ ] [logicool BRIO](https://prosupport.logi.com/hc/ja/articles/360039591834-Downloads-BRIO)
>> * [ ] [Elgato](https://www.elgato.com/ja/gaming/downloads)
>> * [ ] [IODATA GV-USB3/HD](https://www.iodata.jp/lib/product/g/5754.htm)
>> 
> **Benchmark**
>> * [ ] [Cinebench](https://forest.watch.impress.co.jp/library/software/cinbenc/)
>> * [ ] [CPU-Z](https://forest.watch.impress.co.jp/library/software/cpuz/)
>> * [ ] [CrystalDiskMark](https://forest.watch.impress.co.jp/library/software/crystaldisk/)
>> * [ ] [H2testw](https://www.heise.de/download/product/h2testw-50539)
>> 
> **Documents**
>> * [ ] [7-Zip](https://sevenzip.osdn.jp/)
>> * [ ] [サクラエディタ](https://sakura-editor.github.io/download.html)
>> * [ ] [Sylpheed](https://sylpheed.sraoss.jp/ja/download.html)
>> * [ ] [CubePDF](https://www.cube-soft.jp/cubepdf/)
>> * [ ] [PDF-XChange Editor](https://forest.watch.impress.co.jp/library/software/pdfxchedit/)
>> * [ ] [WinMarge](http://winmerge.org/downloads/?lang=ja)
>> 
> **Office**
>> * [ ] [Office](https://products.office.com/ja-JP/compare-all-microsoft-office-products?tab=1)
>> 
> **APL**
>> * [ ] [Visual Studio](https://visualstudio.microsoft.com/ja/)
>> * [ ] [Visual Studio Code](https://code.visualstudio.com/)
>> * [ ] [Tera Term](https://forest.watch.impress.co.jp/library/software/utf8teraterm/)
>> * [ ] [Git for Windows](https://gitforwindows.org/)
>> * [ ] [Eclipse](http://mergedoc.osdn.jp)
>>    * [ ] e(fx)clipse
>>    * [ ] [Scene Builder](https://www.oracle.com/technetwork/java/javafxscenebuilder-1x-archive-2199384.html)
>> * [ ] [Arduino](https://www.arduino.cc/en/Main/Software#)
>> * [ ] [Scratch](https://scratch.mit.edu/download)
>> * [ ] [HSP](http://hsp.tv/index2.html)
>> * [ ] [UWSC](https://www.vector.co.jp/soft/winnt/util/se115105.html)
>> 
> **Web**
>> * [ ] [Google Chrome](https://www.google.com/intl/ja_ALL/chrome/)
>> * [ ] [Steam](http://store.steampowered.com/about/)
>> * [ ] [マイナポータル](https://myna.go.jp/SCK0101_03_001/SCK0101_03_001_Reload.form)
>> * [ ] [e-Tax](http://www.e-tax.nta.go.jp/index.html)
>> * [ ] [eLTAX](http://www.eltax.jp/www/contents/1397034807379/index.html)
>> * [ ] [e-Gov](http://www.e-gov.go.jp/help/shinsei/flow/setup/index.html)
>> 
> **Image**
>> * [ ] [GIMP](https://www.gimp.org/downloads/)
>> 
> **Movie**
>> * [ ] [EDIUS Pro 9](https://pro.grassvalley.jp/download/edius9.htm)
>> * [ ] [AITalk3](https://www.ai-j.jp/consumer/kantan3)
>> * [ ] [初音ミク V4X](https://ec.crypton.co.jp/mypage/license)
>> * [ ] [Studio One](https://my.presonus.com/products/software)
>> * [ ] [VLC media player](https://www.videolan.org/vlc/index.ja.html)
>> * [ ] [OBS Studio](https://obsproject.com/ja/download)
>> * [ ] [HandBrake](https://handbrake.fr/)
>> * [ ] [AviUtl](http://spring-fragrance.mints.ne.jp/aviutl/)
>> * [ ] [ゆっくりMovieMaker3](https://manjubox.net/ymm3/)
>> 
> **Shogi**
>> * [ ] [Kifu for Windows](http://kakinoki.o.oo7.jp/Kifuw.htm)
>> 
