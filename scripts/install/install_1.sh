#!/usr/bin/env bash

sh ../system_dependencies.sh
echo "Installed system dependencies"

sh ../i3_install.sh
echo "Installed i3"

sh ../i3_gaps_install.sh
echo "Installed i3 gaps"

echo "Please reboot and login using i3. Then run ./install_2.sh"
