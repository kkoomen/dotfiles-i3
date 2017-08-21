#!/usr/bin/env bash

git clone https://github.com/hobarrera/kbdlight
cd kbdlight/
make
sudo make install
cd ..
rm -rf kbdlight/
