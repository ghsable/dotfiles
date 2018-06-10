#!/bin/bash

# A simple popup showing system information

# GET SYSTEM INFORMATION
HOST=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$( uptime | sed 's/.* up //' | sed 's/[0-9]* us.*//' | sed 's/ day, /d /'\
        | sed 's/ days, /d /' | sed 's/:/h /' | sed 's/ min//'\
        |  sed 's/,/m/' | sed 's/  / /')
PACKAGES=$(pacman -Q | wc -l)
UPDATED=$(awk '/upgraded/ {line=$0;} END { $0=line; gsub(/[\[\]]/,"",$0); \
         printf "%s %s",$1,$2;}' /var/log/pacman.log)

# GET DZEN2 OPTION'S PARAMETER
readonly X_POSITION="1215"
readonly Y_POSITION="25"
readonly LINES="5"
readonly WIDTH="220"
readonly ALIGNMENT="center"
readonly FOREGROUND_COLORCODE="#87afd7"
readonly BACKGROUND_COLORCODE="#000000"
readonly FONT_NAME="xft:TakaoPGothic:size=10:bold:antialias=true"
readonly TITLE_NAME="POPUP_SYSINFO"
readonly EVENT_AND_ACTIONS="onstart=uncollapse;button1=exit;button3=exit"

# DISPLAY POPUP_SYSINFO
{
# Fist line goes to title
echo 'SYSTEM INFORMATION'
# The following lines go to slave window
echo "HOST    : ${HOST}"
echo "KERNEL  : ${KERNEL}"
echo "UPTIME  : ${UPTIME}"
echo "PACMAN  : ${PACKAGES} packages"
echo "UPDATED : ${UPDATED}"
} | dzen2 -x "${X_POSITION}" -y "${Y_POSITION}" -l "${LINES}" -w "${WIDTH}" -ta "${ALIGNMENT}" -fg "${FOREGROUND_COLORCODE}" -bg "${BACKGROUND_COLORCODE}" -fn "${FONT_NAME}" -title-name "${TITLE_NAME}" -e "${EVENT_AND_ACTIONS}" -p

# "onstart=uncollapse" ensures that slave window is visible from start.
