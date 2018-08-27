# Printer

## Installation

Foomatic:

    1. Initialize
       sh install.sh
    2. Set Printer(GUI)
       -> http://localhost:631/
          Administration/Add Printer
          PPD : foomatic

maker:

    1. Initialize
       sh install.sh
    2. Download Printer-Driver(*.rpm)
       -> http://www.openprinting.org/printers
    3. Open file(*.rpm)
       rpmextract.sh *.rpm
    4. Add Printer(GUI)
       -> http://localhost:631/
          Administration/Add Printer
          PPD : ~/path/to/file

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/printer/install.sh)

## Example(Set Printer Options)

    # General
    Media Size       : A4
    Media Type       : Stationery
    Print Color Mode : Color
    Print Quality    : High
    Print Scaling    : Auto Fit

## Setup lpr

    # GET queue_name
    lpstat -s
    -> EPSON_XX-XXX : xxx://XXXXXXXX000.xxxxx:000/xxx/xxxxx
    # SET default_printer
    lpoptions -d EPSON_XX-XXX
    # PRINT TEST
    lpr /path/to/file

## EOF

    http://localhost:631/
    Printers/Queue Name/Maintenance/Print Test Page

