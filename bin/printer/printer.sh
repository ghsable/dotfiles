#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Printer Commands

Usage:
  sh ${0} lpstat                       : DISPLAY Printers
  sh ${0} lpoptions   <queue_name>     : SET     Default_Printer
  sh ${0} cupsenable  <queue_name>     : ENABLE  Printer(*Error)
  sh ${0} cupsdisable <queue_name>     : DISABLE Printer(*Error)
  sh ${0} cupsreject  <queue_name>     : DELETE  Printer(*Error)
  sh ${0} lpr         <inputfile_path> : PRINT   File(Not EUC-JP)
  sh ${0} lpq                          : DISPLAY Print_Queue
  sh ${0} lprm                         : DELETE  Print_Queue
  sh ${0} *                            : USAGE

EOF:
  http://localhost:631/

_EOT_
exit 1
}

case ${1} in
  lpstat)
    lpstat -s
    ;;
  lpoptions)
    lpoptions -d ${2}
    ;;
  cupsenable)
    cupsenable ${2}
    cupsaccept ${2}
    ;;
  cupsdisable)
    cupsdisable ${2}
    ;;
  cupsreject)
    cupsreject ${2}
    cupsdisable ${2}
    lpadmin -x ${2}
    ;;
  lpr)
    lpr ${2}
    ;;
  lpq)
    lpq
    ;;
  lprm)
    lprm
    ;;
  *)
    usage
    ;;
esac
