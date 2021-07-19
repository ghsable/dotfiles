# Shogi

## Requirement
### GUI
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [将棋所](http://shogidokoro.starfree.jp/) | [Mono](https://github.com/ghsable/dotfiles/blob/main/bin/apl/mono/README.md) | `-` |

### USI shogi engine
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [Apery](https://github.com/HiraokaTakuya/apery_rust) | [Rust](https://github.com/ghsable/dotfiles/blob/main/bin/apl/rust/README.md) | `-` |
| [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `clang++` | [Makefile](https://github.com/ghsable/dotfiles/tree/main/bin/shogi/YaneuraOu/Makefile) <br> - build options: `YANEURAOU_ENGINE_KPPT` <br> - target cpu: `grep -i sse4_2 /proc/cpuinfo` |
| ~~[水匠4](https://twitter.com/tayayan_ts/status/1416621532164497411)~~ | [YaneuraOu(WCSOC2020)](https://drive.google.com/drive/folders/1xMzf2NsEap8x6i5IWlzCie8enecBe7OX) <br> `g++` | `Windows only` <br> [水匠2のビルド手順](https://kisagai.com/project/engineshogibanusage/%E6%B0%B4%E5%8C%A0%EF%BC%92%E3%81%AE%E3%83%93%E3%83%AB%E3%83%89%E6%89%8B%E9%A0%86/): `build error(g++ version)` |

### Evaluation function
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [リゼロ評価関数 epoch8](https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md) | [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `-` |
| [elmo(WCSC28)](https://mk-takizawa.github.io/elmo/) | [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `-` |

### Book
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [100テラショック定跡](https://github.com/yaneurao/YaneuraOu/releases/tag/BOOK-100T-Shock) | [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | Use <br> - [リゼロ評価関数 epoch8](https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md) |

## Install/Run

    sh init.sh

this script : [init.sh](https://github.com/ghsable/dotfiles/blob/main/bin/shogi/init.sh)
