#!/bin/bash


cd /tmp
git clone git@github.com:mwh/dragon.git
cd dragon/
make

sudo mv dragon /usr/local/bin

