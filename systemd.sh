#!/bin/sh

cp systemd/greenclip.service ~/.config/systemd/user/

systemctl enable --user dunst.service
systemctl enable --user greenclip.service
