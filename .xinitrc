export GTK_THEME=Adwaita:dark

xset r rate 300 25
xcompmgr &

feh --no-fehbg --bg-scale ~/Downloads/BG.png

$(/home/noot/git/dwm-stuff/bar.sh) &

old_sha=$(sha1sum $(which dwm))
new_sha=""

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

