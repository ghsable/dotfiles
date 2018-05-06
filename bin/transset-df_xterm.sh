#!/bin/bash

# start Xterm -> transset-df
xterm &
sleep 0.6 && transset-df -i $(xwininfo -root -tree -int | grep -e 'xterm' -e 'XTerm' | cut -f 6 -d " " | sort | tail -n1) 0.75 
