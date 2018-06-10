#!/bin/bash

# GET CONKY OPTION'S PARAMETER
readonly CONKYRC_FILE=~/bin/dzen/.conkyrc
# GET DZEN2 OPTION'S PARAMETER
readonly X_POSITION="0"
readonly Y_POSITION="0"
#readonly LINES="5"
#readonly WIDTH="220"
readonly ALIGNMENT="right"
#readonly FOREGROUND_COLORCODE="#87afd7"
#readonly BACKGROUND_COLORCODE="#000000"
readonly FONT_NAME="xft:TakaoPGothic:size=10:bold:antialias=true"
readonly TITLE_NAME="STATUS_BAR"
#readonly EVENT_AND_ACTIONS="onstart=uncollapse;button1=exit;button3=exit"

# DISPLAY STATUS_BAR
conky -c "${CONKYRC_FILE}" | dzen2 -x "${X_POSITION}" -y "${Y_POSITION}" -ta "${ALIGNMENT}" -fn "${FONT_NAME}" -title-name "${TITLE_NAME}" -p &
