#!/bin/bash

entries=" Exit\n Lock\n Shutdown\n Logout\n Suspend\n Reboot"

selected=$(echo -e $entries|wofi --width 250 --height 330 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  exit)
    riverctl exit;;
  lock)
    bash ~/.config/river/scripts/lock.sh;;
  logout)
    loginctl terminate-user $USER;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
