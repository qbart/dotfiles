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
