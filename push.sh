#!/bin/bash

set -e
set -x
PS4=""

mkdir -p \
	~/.config/nvim \
	~/.config/git \
	~/.config/gtk-3.0 \
	~/.config/Code/User \
	~/.config/.gimp-2.8 \
	~/.config/ptpython \
	~/.config/python \
	~/.config/sqlite3 \
	~/.config/gdb \
	~/.local/share/gnupg \
	~/.local/bin

cp -r {,~/}.config/nvim
cp {,~/}.config/git/ignore
cp {,~/}.config/gtk-3.0/settings.ini
cp {,~/}.config/Code/User/settings.json
cp {,~/}.config/ptpython/config.py
cp {,~/}.config/python/pythonrc
cp {,~/}.config/gdb/gdbinit
cp {,~/}.bashrc
cp {,~/}.xinitrc
cp {,~/}.local/share/gnupg/gpg-agent.conf
cp .local/bin/*.sh ~/.local/bin
cp .local/bin/json_min ~/.local/bin/json_min

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
	mkdir ~/.config/flameshot
	mkdir ~/Pictures
	sed "s|HOME|$HOME|" $flameshot_config > ~/$flameshot_config
}
