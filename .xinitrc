#!/bin/sh

MUSIC_DIR=$HOME/Music
SCRIPT_DIR=$HOME/git/dwm/scripts

key_timeout_ms=300
key_repeat_delay_ms=25

screensaver_idle_seconds=300

export GTK_THEME=Adwaita:dark
export GIMP2_DIRECTORY=.config/.gimp-2.8

inputplug_tempfile="$(mktemp)"
chmod 700 "$inputplug_tempfile"
echo -e "#!/bin/sh\nxset r rate $key_timeout_ms $key_repeat_delay_ms" > "$inputplug_tempfile"
inputplug -0 -c "$inputplug_tempfile"

xcompmgr &
xbanish -i shift -i control -i mod1 -i mod4 &
dwmblocks &
flameshot &

$HOME/git/dwm/scripts/background.sh

old_sha=$(sha1sum $(which dwm))
new_sha=""

xset s $screensaver_idle_seconds &
$HOME/git/xssstate/xsidle.sh slock &

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

dbus-update-activation-environment --systemd DISPLAY

while true; do
	if [ "$old_sha" != "$new_sha" ]
	then
		new_sha=$old_sha
		MUSIC_DIR=$MUSIC_DIR SCRIPT_DIR=$SCRIPT_DIR dwm
	else
		rm "$inputplug_tempfile"
		exit 0
	fi
	old_sha=$(sha1sum $(which dwm))
done
