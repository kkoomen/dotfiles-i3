#!/usr/bin/env bash

version="4.7.0"
filepath="font-awesome-${version}"

wget https://fontawesome.com/v${version}/assets/${filepath}.zip
unzip ${filepath}.zip
sudo cp "${filepath}/fonts/FontAwesome.otf" /usr/share/fonts/opentype
rm -rf ${filepath}/ ${filepath}.zip
