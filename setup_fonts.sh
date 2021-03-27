#!/bin/bash

cd /tmp

wget -O fa.zip https://use.fontawesome.com/releases/v5.13.0/fontawesome-free-5.13.0-desktop.zip
ex fa.zip

gksu fc-cache -v
