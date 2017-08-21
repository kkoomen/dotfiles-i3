#!/usr/bin/env bash

curl -L https://telegram.org/dl/desktop/linux > telegram.tar.xz
extract telegram.tar.xz
sudo mv Telegram /opt/
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram
rm telegram.tar.xz
