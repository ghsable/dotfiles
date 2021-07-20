# Shogi

## Requirement
### GUI
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [将棋所](http://shogidokoro.starfree.jp/) | [Mono](https://github.com/ghsable/dotfiles/blob/main/bin/apl/mono/README.md) | `-` |

### USI shogi engine
#### KPPT
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [Apery](https://github.com/HiraokaTakuya/apery_rust) | [Rust](https://github.com/ghsable/dotfiles/blob/main/bin/apl/rust/README.md) | `-` |
| [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `clang++` | [Makefile](https://github.com/ghsable/dotfiles/tree/main/bin/shogi/YaneuraOu/KPPT/Makefile) <br> - build options: `YANEURAOU_ENGINE_KPPT` <br> - target cpu: `grep -i sse4_2 /proc/cpuinfo` |

#### NNUE
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `clang++` | [Makefile](https://github.com/ghsable/dotfiles/tree/main/bin/shogi/YaneuraOu/NNUE/Makefile) <br> - build options: `YANEURAOU_ENGINE_NNUE` <br> - target cpu: `grep -i sse4_2 /proc/cpuinfo` |

### Evaluation function
#### KPPT
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [リゼロ評価関数 epoch8](https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md) | [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `-` |
| [elmo_WCSC28](https://mk-takizawa.github.io/elmo/) | [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `-` |

#### NNUE
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [水匠4](https://twitter.com/tayayan_ts/status/1416621532164497411) | [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | `-` |

### Book
#### KPPT
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| [100テラショック定跡](https://github.com/yaneurao/YaneuraOu/releases/tag/BOOK-100T-Shock) | [YaneuraOu](https://github.com/yaneurao/YaneuraOu) | Use <br> - [リゼロ評価関数 epoch8](https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md) |

#### NNUE
| Name | Requirement | Addition |
| :--- | :--- | :--- |
| `-` | `-` | `-` |

## Install/Run

    sh init.sh

this script : [init.sh](https://github.com/ghsable/dotfiles/blob/main/bin/shogi/init.sh)
