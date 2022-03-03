#!/bin/bash

cp {~/,}.config/nvim/init.vim
cp {~/,}.config/git/ignore
cp {~/,}.config/gtk-3.0/settings.ini
cp {~/,}.config/Code\ -\ OSS/User/settings.json
cp {~/,}.config/Code/User/settings.json
cp {~/,}.config/ptpython/config.py
cp {~/,}.bashrc
cp {~/,}.xinitrc

command -v code > /dev/null && code --list-extensions > vscode-extentions || true

flameshot_config=.config/flameshot/flameshot.ini
cp {~/,}$flameshot_config
sed -i 's|savePath=.*|savePath=HOME/Pictures|' $flameshot_config
