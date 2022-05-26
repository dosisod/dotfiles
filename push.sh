#!/bin/bash

PS4=""
set -x

mkdir -p \
	~/.config/nvim \
	~/.config/git \
	~/.config/gtk-3.0 \
	~/.config/Code/User \
	~/.config/.gimp-2.8 \
	~/.config/ptpython \
	~/.config/python \
	~/.local/share/gnupg

cp {,~/}.config/nvim/init.vim
cp {,~/}.config/git/ignore
cp {,~/}.config/gtk-3.0/settings.ini
cp {,~/}.config/Code/User/settings.json
cp {,~/}.config/ptpython/config.py
cp {,~/}.config/python/pythonrc
cp {,~/}.bashrc
cp {,~/}.xinitrc
cp {,~/}.local/share/gnupg/gpg-agent.conf

[ -z "$(command -v code)" ] || {
	VSCODE_CONFIG=".config/Code - OSS/User/settings.json"
	cp -f "./$VSCODE_CONFIG" ~/"$VSCODE_CONFIG"
	cp -f "$VSCODE_CONFIG" ~/.config/Code/User/settings.json
	cat ./vscode-extentions | xargs -L 1 code --install-extension
}

[ -z "$(command -v npm)" ] || {
	mkdir -p ~/.config/npm && npm completion > ~/.config/npm/completion.bash
}

[ -z "$(command -v flameshot)" ] || {
	flameshot_config=.config/flameshot/flameshot.ini
	sed "s|HOME|$HOME|" $flameshot_config > ~/$flameshot_config
}
