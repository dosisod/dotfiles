#!/bin/bash

cp {~/,}.config/nvim/init.vim
cp {~/,}.config/git/ignore
cp {~/,}.config/gtk-3.0/settings.ini
cp {~/,}.config/Code\ -\ OSS/User/settings.json
cp {~/,}.config/Code/User/settings.json
cp {~/,}.config/python/pythonrc
cp {~/,}.config/ptpython/config.py
cp {~/,}.bashrc
cp {~/,}.xinitrc
cp {~/,}.local/share/gnupg/gpg-agent.conf

command -v code > /dev/null && code --list-extensions > vscode-extentions || true

flameshot_config=.config/flameshot/flameshot.ini
cp {~/,}$flameshot_config
sed -i 's|savePath=.*|savePath=HOME/Pictures|' $flameshot_config
