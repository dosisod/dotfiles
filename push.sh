#!/bin/bash

cp {,~/}.config/nvim/init.vim
cp {,~/}.config/git/ignore
cp {,~/}.config/gtk-3.0/settings.ini
cp {,~/}.config/Code/User/settings.json
cp {,~/}.bashrc
cp {,~/}.xinitrc

xargs -L 1 echo code --install-extension

npm config set cache ~/.cache/npm
