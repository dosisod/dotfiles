#!/bin/bash

PS4=""
set -x

mkdir -p \
	~/.config/nvim \
	~/.config/git \
	~/.config/gtk-3.0 \
	~/.config/Code/User \
	~/.config/.gimp-2.8

cp {,~/}.config/nvim/init.vim
cp {,~/}.config/git/ignore
cp {,~/}.config/gtk-3.0/settings.ini
cp {,~/}.config/Code/User/settings.json
cp {,~/}.config/flameshot/flameshot.ini
cp {,~/}.bashrc
cp {,~/}.xinitrc

VSCODE_CONFIG=".config/Code - OSS/User/settings.json"
cp -f "./$VSCODE_CONFIG" ~/"$VSCODE_CONFIG"
cp -f "$VSCODE_CONFIG" ~/.config/Code/User/settings.json

cat ./vscode-extentions | xargs -L 1 code --install-extension

npm config set cache ~/.cache/npm

mkdir -p ~/.config/npm && npm completion > ~/.config/npm/completion.bash
