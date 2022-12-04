#!/bin/sh

stopwatch_file=/tmp/stopwatch

stopwatch_start_pause() {
	[ "$(pgrep "stopwatch.sh" -c)" -gt 1 ] && {
		killall -9 stopwatch.sh
		exit 0
	}

	_run_stopwatch
}

_run_stopwatch() {
	offset=0

	[ -f "$stopwatch_file" ] && offset="$(expr "$(cat "$stopwatch_file")" + 1)"

	while true; do
		echo "$offset" > "$stopwatch_file"

		offset=$(expr "$offset" + 1)

		sleep 1
	done
}

stopwatch_reset() {
	pid=$$
	kill -9 $(pgrep "stopwatch.sh" | grep -v "$pid") 2>&1 >/dev/null
	rm -f "$stopwatch_file"

	_run_stopwatch
}

stopwatch_stop() {
	rm -f "$stopwatch_file"
	killall -9 stopwatch.sh
}

stopwatch_lap() {
	echo "" | dmenu -p "To be implemented"
}


mode="$(echo -e "start/pause\nreset\nstop\nlap" | dmenu -i -l -1)"

case "$mode" in
	"start/pause") stopwatch_start_pause ;;
	reset) stopwatch_reset ;;
	stop) stopwatch_stop ;;
	lap) stopwatch_lap ;;
	*) exit 1 ;;
esac
