#!/bin/bash

set -e

cp -r ~/.config/nvim/* .config/nvim
cp {~/,}.config/git/ignore
cp {~/,}.config/gtk-3.0/settings.ini
cp {~/,}.config/VSCodium/User/settings.json
cp {~/,}.config/python/pythonrc
cp {~/,}.config/ptpython/config.py
cp {~/,}.config/gdb/gdbinit
cp {~/,}.config/sqlite3/sqliterc
cp {~/,}.bashrc
cp {~/,}.xinitrc
cp {~/,}.local/share/gnupg/gpg-agent.conf
cp ~/.local/bin/*.sh .local/bin
cp ~/.local/bin/json_min .local/bin

command -v vscodium > /dev/null && vscodium --list-extensions > vscodium-extentions || true

flameshot_config=.config/flameshot/flameshot.ini
cp {~/,}$flameshot_config
sed -i 's|savePath=.*|savePath=HOME/Pictures|' $flameshot_config
