#!/bin/bash

PS4=""
set -x

mkdir -p \
	~/.config/nvim \
	~/.config/git \
	~/.config/gtk-3.0 \
	~/.config/Code/User

cp {,~/}.config/nvim/init.vim
cp {,~/}.config/git/ignore
cp {,~/}.config/gtk-3.0/settings.ini
cp {,~/}.config/Code/User/settings.json
cp {,~/}.bashrc
cp {,~/}.xinitrc

cat ./vscode-extentions | xargs -L 1 code --install-extension

npm config set cache ~/.cache/npm
