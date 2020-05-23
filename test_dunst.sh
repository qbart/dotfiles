#!/bin/sh

systemctl --user restart dunst
notify-send 'Hello world!' 'This is an example ssdnotification.' --icon=dialog-information -u low
notify-send 'Hello world!' 'This is an example ssdnotification.' --icon=dialog-information -u normal
notify-send 'Hello world!' 'This is an example ssdnotification.' --icon=dialog-information -u critical
