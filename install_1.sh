#!/usr/bin/env bash

./scripts/system_dependencies.sh
echo "Installed system dependencies"

./scripts/i3_install.sh
echo "Installed i3"

./scripts/i3_gaps_install.sh
echo "Installed i3 gaps"

echo "Please reboot and login using i3. Then run ./install_2.sh"
