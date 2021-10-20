#!/bin/bash

cp {~/,}.config/nvim/init.vim
cp {~/,}.config/git/ignore
cp {~/,}.config/gtk-3.0/settings.ini
cp {~/,}.config/Code/User/settings.json
cp {~/,}.bashrc
cp {~/,}.xinitrc

code --list-extensions > vscode-extentions
