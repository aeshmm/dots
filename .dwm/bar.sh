#!/bin/dash

interval=0

# load colors

black=#282828
gray=#d4be98
white=#ddc7a1
red=#ea6962
orange=#e78a4e
yellow=#d8a657
green=#a9b665
aqua=#89b482
blue=#7daea3
darkblue=#266b79
purple=#d3869b

battery() {
	get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
	printf "^c$black^ ^b$green^  "
	echo "^c$white^ ^b$black^ $get_capacity%"
}
wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$purple^ 󰤨 ^d^%s" " ^c$white^Connected" ;;
	down) printf "^c$black^ ^b$purple^ 󰤭 ^d^%s" " ^c$white^Disconnected" ;;
	esac
}
clock() {
	printf "^c$black^ ^b$blue^ 󱑆 "
	printf "^c$white^^b$black^ $(date '+%I:%M %p')"
}
while true; do

	[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
	interval=$((interval + 1))

	sleep 1 && xsetroot -name "$(battery) $(wlan) $(clock)"
done
