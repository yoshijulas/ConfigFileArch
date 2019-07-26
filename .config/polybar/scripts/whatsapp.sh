#!/bin/bash
# if you want to use this script, you need to have installed wmctrl
# sudo pacman -S wmctrl
# You need to have open a page of WhatsApp elsewhere than your main daily window
# This is my first script, if is bad, ID = yoshijulas
COLOR_NOTIF='#44ff44'
COLOR_CLOSED='#ff0000'


com=$(wmctrl -l | grep 'WhatsApp' | awk '{print $4}')
comnum=$(echo $com | sed 's/[()]//g')
if [[ ! $(wmctrl -l | grep 'WhatsApp ') ]]; then
  echo "%{F$COLOR_CLOSED} Not Opened%{F-}"; exit
elif [[ $com == "WhatsApp" ]]; then
  echo " 0 Notif"; exit
else
  echo "%{F$COLOR_NOTIF} $comnum Notif%{F-}"
fi
