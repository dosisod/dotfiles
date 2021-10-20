#!/bin/sh

key_timeout_ms=300
key_repeat_delay_ms=25

screensaver_idle_seconds=300

export GTK_THEME=Adwaita:dark

xset r rate $key_timeout_ms $key_repeat_delay_ms
xcompmgr &
xbanish -i shift -i control -i mod1 -i mod4 &

feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers

$(/home/noot/git/dwm/scripts/bar.sh) &

old_sha=$(sha1sum $(which dwm))
new_sha=""

xset s $screensaver_idle_seconds
/home/noot/git/xssstate/xsidle.sh slock &

while true; do
	if [ "$old_sha" != "$new_sha" ]
	then
		new_sha=$old_sha
		dwm
	else
		exit 0
	fi
	old_sha=$(sha1sum $(which dwm))
done
