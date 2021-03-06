#!/bin/bash

# A simple popup showing system information

# GET DZEN2 OPTION'S PARAMETER
readonly X_POSITION="860"
readonly Y_POSITION="25"
readonly LINES="8"
readonly WIDTH="580"
readonly ALIGNMENT="center"
readonly FOREGROUND_COLORCODE="#87afd7"
readonly BACKGROUND_COLORCODE="#000000"
readonly FONT_NAME="xft:TakaoPGothic:size=10:bold:antialias=true"
readonly TITLE_NAME="POPUP_PACMAN"
readonly EVENT_AND_ACTIONS="onstart=uncollapse;button1=exit;button3=exit"

# DISPLAY POPUP_PACMAN
{
# Fist line goes to title
echo 'PACMAN'
# The following lines go to slave window
pacman --version
} | dzen2 -x "${X_POSITION}" -y "${Y_POSITION}" -l "${LINES}" -w "${WIDTH}" -ta "${ALIGNMENT}" -fg "${FOREGROUND_COLORCODE}" -bg "${BACKGROUND_COLORCODE}" -fn "${FONT_NAME}" -title-name "${TITLE_NAME}" -e "${EVENT_AND_ACTIONS}" -p

# "onstart=uncollapse" ensures that slave window is visible from start.
