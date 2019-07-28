#!/bin/bash

serverdir='/mnt/server'
batterydir='/sys/class/power_supply'

if [[ ! $(ls $serverdir) ]]; then
  exit
fi

batperc=$(tr -d '\0' <$serverdir$batterydir/BAT1/capacity)
acstat=$(tr -d '\0' <$serverdir$batterydir/ADP1/online)

if [[ $acstat == '1' ]]; then
  if [[ $batperc > '75' ]]; then
    echo "Full"
  else
    echo "Chk" $batperc
  fi
elif [[ $batperc < '45' ]]; then
  echo "%{F#ff0000}Bat $batperc%{F-}"
else
  echo "%{F#ffff00}Bat $batperc%{F-}"
fi
