#!/bin/bash

serverdir='/mnt/server'
batterydir='/sys/class/power_supply'

batperc=$(tr -d '\0' <$serverdir$batterydir/BAT1/capacity)
acstat=$(tr -d '\0' <$serverdir$batterydir/ADP1/online)

if [[ $acstat == '1' ]]; then
  if [[ $batperc > '79' ]]; then
    echo "Full"
  else
    echo "Chk" $batperc
  fi
elif [[ $batperc < '45' ]]; then
  echo "%{F#ff0000}Bat $batperc%{F-}"
else
  echo "Bat $batperc"
fi
