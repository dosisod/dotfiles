#!/bin/sh

QUEUE_FILE="/tmp/song_queue"

song=$(head -n 1 "$QUEUE_FILE")
sed -i '1d' "$QUEUE_FILE" > /dev/null

playlist=$(cat /tmp/current_playlist 2> /dev/null)
[ "$song" = "" ] && [ "$playlist" != "" ] && song="$(shuf -n1 "$playlist")"

[ "$song" = "" ] && song="$(random_song.sh)"

[ -f /tmp/repeat_song ] && song="$(cat /tmp/current_song)"

song.sh "$song" &
