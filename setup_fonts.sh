#!/bin/bash

cd /tmp

wget -O hack.zip "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip"
ex hack.zip

gksu mv ttf /usr/share/fonts/Hack
gksu fc-cache -v
