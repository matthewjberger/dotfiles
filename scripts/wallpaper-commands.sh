set-wallpaper() {
	wal -i "$@"
	. ~/.dotfiles/bspwmrc > /dev/null
}

set-random-wallpaper() {
	wallpaper=$(ls $HOME/.dotfiles/wallpapers | shuf -n 1)
	set-wallpaper "$HOME/.dotfiles/wallpapers/$wallpaper"
	. ~/.dotfiles/bspwmrc > /dev/null
}
