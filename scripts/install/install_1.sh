#!/usr/bin/env bash
#
# This file is used to install the system dependencies along with i3 and i3 gaps.

sh ../system_dependencies.sh
echo "Installed system dependencies"

sh ../i3_install.sh
echo "Installed i3"

sh ../i3_gaps_install.sh
echo "Installed i3 gaps"

echo "Please reboot and login using i3. Then run ./install_2.sh"
