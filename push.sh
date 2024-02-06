#!/bin/bash

set -e
set -x
PS4=""

mkdir -p \
	~/.config/nvim \
	~/.config/git \
	~/.config/gtk-3.0 \
	~/.config/VSCodium/User \
	~/.config/.gimp-2.8 \
	~/.config/ptpython \
	~/.config/python \
	~/.config/sqlite3 \
	~/.config/gdb \
	~/.local/share/gnupg \
	~/.local/bin \
	~/.cache/bash

cp -r .config/nvim/* ~/.config/nvim
cp {,~/}.config/git/ignore
cp {,~/}.config/gtk-3.0/settings.ini
cp {,~/}.config/VSCodium/User/settings.json
cp {,~/}.config/ptpython/config.py
cp {,~/}.config/python/pythonrc
cp {,~/}.config/gdb/gdbinit
cp {,~/}.config/sqlite3/sqliterc
cp {,~/}.bashrc
cp {,~/}.xinitrc
cp {,~/}.local/share/gnupg/gpg-agent.conf
cp .local/bin/*.sh ~/.local/bin
cp .local/bin/json_min ~/.local/bin/json_min

[ -z "$(command -v vscodium)" ] || {
	VSCODIUM_DIR=".config/VSCodium/User"
	VSCODIUM_CONFIG="$VSCODIUM_DIR/settings.json"
	mkdir -p ~/"$VSCODIUM_DIR"
	cp -f "$VSCODIUM_CONFIG" ~/"$VSCODIUM_CONFIG"
	set +e
	cat ./vscodium-extentions | xargs -L 1 vscodium --install-extension
	set -e
}

[ -z "$(command -v npm)" ] || {
	mkdir -p ~/.config/npm && npm completion > ~/.config/npm/completion.bash
}

[ -z "$(command -v flameshot)" ] || {
	flameshot_config=.config/flameshot/flameshot.ini
	mkdir -p ~/.config/flameshot
	mkdir -p ~/Pictures
	sed "s|HOME|$HOME|" $flameshot_config > ~/$flameshot_config
}

[ -f patch.sh ] && ./patch.sh
