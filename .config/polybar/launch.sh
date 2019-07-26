#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config

width=$(xrandr | grep current | sed 's/.*\(current\s\w*\s\w\s\w*\).*/\1/' | sed 's/\(current\)//g' | awk '{ print $1 }' )

if [[ $width > "1600" ]]; then
  polybar Polybar &
  polybar PolybarBot &
else
  polybar PolybarSmall &
  polybar PolybarBotSmall &
fi

echo "Polybar launched..."
