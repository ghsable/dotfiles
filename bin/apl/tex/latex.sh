#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  LaTeX Commands

Usage:
  sh ${0} platex   <*.tex> : [pLaTeX]       CONVERT *.tex -> *.dvi -> *.pdf & OPEN *.pdf
  sh ${0} uplatex  <*.tex> : [upLaTeX]      CONVERT *.tex -> *.dvi -> *.pdf & OPEN *.pdf
  sh ${0} latexmk  <*.tex> : [~/.latexmkrc] CONVERT *.tex -> *.dvi -> *.pdf & OPEN *.pdf
  sh ${0} latexmkc <*.tex> : [~/.latexmkrc] CONVERT *.tex -> *.dvi -> *.pdf & OPEN *.pdf(Sync)
  sh ${0} ptemplate        : [pLaTeX]       OPEN    pLaTeX  template
  sh ${0} utemplate        : [upLaTeX]      OPEN    upLaTeX template
  sh ${0} cloudlatex       :                OPEN    Cloud_LaTeX
  sh ${0} overleaf         :                OPEN    Overleaf
  sh ${0} *                :                USAGE

_EOT_
exit 1
}

case ${1} in
  platex)
    cd $(dirname ${2})
    platex -kanji=utf8 ${2}
    dvipdfmx ${2%.*}
    xdg-open ${2%.*}.pdf
    ;;
  uplatex)
    cd $(dirname ${2})
    uplatex -kanji=utf8 ${2}
    dvipdfmx ${2%.*}
    xdg-open ${2%.*}.pdf
    ;;
  latexmk)
    cd $(dirname ${2})
    latexmk -pv ${2%.*}
    ;;
  latexmkc)
    cd $(dirname ${2})
    latexmk -pvc ${2%.*}
    ;;
  ptemplate)
    firefox "http://hooktail.org/computer/index.php?TeX%A5%C6%A5%F3%A5%D7%A5%EC%A1%BC%A5%C8"
    ;;
  utemplate)
    firefox "https://texwiki.texjp.org/?upTeX%2CupLaTeX"
    ;;
  cloudlatex)
    firefox "https://cloudlatex.io/ja"
    ;;
  overleaf)
    firefox "https://ja.overleaf.com/"
    ;;
  *)
    usage
    ;;
esac
