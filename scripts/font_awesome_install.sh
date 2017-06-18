#!/usr/bin/env bash

wget http://fontawesome.io/assets/font-awesome-4.7.0.zip
unzip font-awesome-4.7.0.zip
sudo cp font-awesome-4.7.0/fonts/FontAwesome.otf /usr/share/fonts/opentype
rm -rf font-awesome-4.7.0/ font-awesome-4.7.0.zip
