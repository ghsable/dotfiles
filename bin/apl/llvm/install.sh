#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL LLVM

Usage:
  sh ${0} install-packages : INSTALL Packages
  sh ${0} *                : USAGE

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# llvm       : Compiler base'
    echo '# clang      : LLVM front end(C/C++/Objective-C Compiler)'
    echo '# emscripten : LLVM bytecode compiler to JavaScript(emcc)'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S llvm \
                   clang \
                   emscripten
    sudo pacman -Sc
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
