#!/bin/bash

cd /tmp
git clone git@github.com:qbart/xcwd.git
cd xcwd/
make
make install

cd /tmp
git clone git@github.com:qbart/dragon.git
make
make install

go get -u github.com/hetznercloud/cli/cmd/hcloud
go get golang.org/x/tools/cmd/godoc

git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
