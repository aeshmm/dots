# sets wallpaper using feh
bash $HOME/.dwm/.fehbg &

# start hotkey daemon
sxhkd -c $HOME/.dwm/sxhkdrc &

# Launch notification daemon
dunst -config $HOME/.dwm/dunstrc &

# start compositor and power manager
# xfce4-power-manager &

while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.dwm/picom.conf &

# start polkit
if [[ ! `pidof polkit-gnome` ]]; then
    /usr/lib64/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

# start udiskie
udiskie &

# dwmblocks
~/.dwm/bar.sh &
