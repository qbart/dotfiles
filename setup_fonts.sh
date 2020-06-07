#!/bin/bash

cd /tmp

wget -O hack.zip "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip"
wget -O fa.zip https://use.fontawesome.com/releases/v5.13.0/fontawesome-free-5.13.0-desktop.zip
ex hack.zip
ex fa.zip

gksu mv ttf /usr/share/fonts/Hack
gksu fc-cache -v
