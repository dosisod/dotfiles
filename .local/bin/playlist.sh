#!/bin/sh

mkdir -p "$MUSIC_DIR/playlist"

msg() {
	printf "" | dmenu -p "$1"
}

playlist_select() {
	echo "$(find "$MUSIC_DIR/playlist" -type f -printf '%f\n' | LC_ALL=C sort | dmenu -i -l 25)"
}

playlist_stop() {
	rm -f /tmp/current_playlist
	rm -f /tmp/repeat_song
}

playlist_play() {
	playlist="$(playlist_select)"

	[ -z "$playlist" ] && {
		main
		exit 0
	}

	echo "$MUSIC_DIR/playlist/$playlist" > /tmp/current_playlist

	next_song.sh
}

playlist_add() {
	playlist="$(playlist_select)"

	[ -z "$playlist" ] && {
		main
		exit 0
	}

	playlist_file=$MUSIC_DIR/playlist/$playlist

	select_song.sh >> "$playlist_file"
	sort -u -o "$playlist_file" "$playlist_file"

}

playlist_trim() {
	playlist="$(playlist_select)"

	[ -z "$playlist" ] && {
		main
		exit 0
	}

	playlist_file=$MUSIC_DIR/playlist/$playlist

	to_remove="$(mktemp)"
	new_playlist="$(mktemp)"

	cat "$playlist_file" | dmenu -c -bw 1 -i -l 25 > "$to_remove"

	sort -u -o "$to_remove" "$to_remove"
	comm -23 "$playlist_file" "$to_remove" > "$new_playlist"

	mv "$new_playlist" "$playlist_file"
	rm "$to_remove"
}

playlist_new() {
	name=$(printf "" | dmenu -p "playlist name")

	touch "$MUSIC_DIR/playlist/$name"

	main
	exit 0
}

playlist_delete() {
	playlist="$(playlist_select)"

	[ "$playlist" = "" ] && {
		main
		exit 0
	}

	rm "$MUSIC_DIR/playlist/$playlist" 2> /dev/null
	err=$?

	[ "$err" = "0" ] && msg "Successfully removed playlist \"$playlist\""
	[ "$err" = "1" ] && msg "Playlist \"$playlist\" doesnt exist"
}

playlist_repeat() {
	touch /tmp/repeat_song
}

main() {
	action="$(printf "play\nstop\nadd song(s)\nremove song(s)\nnew\ndelete\nrepeat current" | dmenu -i -l -1 -p "playlist")"
	[ -z "$action" ] && exit 0

	case "$action" in
		stop) playlist_stop ;;
		play) playlist_play ;;
		"add song(s)") playlist_add ;;
		"remove song(s)") playlist_trim ;;
		new) playlist_new ;;
		delete) playlist_delete ;;
		"repeat current") playlist_repeat ;;
		*) msg "Invalid option" ; exit 1 ;;
	esac
}

main
