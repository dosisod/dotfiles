#!/bin/sh

songs=$(select_song.sh)

[ $? = 0 ] || exit 1
[ "$songs" = "" ] && exit 1

tmp=$(mktemp)
echo "$songs" | cat - /tmp/song_queue 2>/dev/null > $tmp
mv $tmp /tmp/song_queue;

next_song.sh
