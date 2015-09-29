#!/bin/bash

check_process(){
    #PROCESS_NUM => get the process number regarding the given thread name
    PROCESS_NUM=$(ps -ef | grep "$1" | grep -v "grep" | wc -l)
    if [ $PROCESS_NUM -eq 0 ];
    then
       $1 &
    fi
}
xflux -z 45036
( /home/jonathan/.screenlayout/default.sh) &
## Set root window colour
(/home/jonathan/bin/auto-rotate-wallpaper) &
rm $HOME/.session-active &
check_process urxvtd
xset -dpms; xset s off &
## Volume keys daemon
#check_process xfce4-volumed

## Enable power management
#xfce4-power-manager &
(sleep 1s && check_process compton) &
(sleep 1s && /usr/bin/xscreensaver -no-splash) &

(sleep 3s && check_process conky) &
(sleep 3s && check_process volumeicon) &
(sleep 4s && check_process nm-applet) &

## Start Clipboard manager
#(sleep 5s && check_process clipit) &

## Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
## Adjust the values according to your preferances.
xset r rate 250 25 &

## Turn on/off system beep
xset b off &
#(sleep 2s && check_process tint2) &
(sleep 5s && check_process /home/jonathan/bin/updatenotifyd) &
# Autostart the Dropbox deamon
(sleep 10s && ~/.dropbox-dist/dropboxd) &
(sleep 3s && gksu ~/.mountdrive.sh) &
exit
