set-wallpaper() {
	wal -n -i "$@"
	nitrogen --set-zoom-fill "$(< "${HOME}/.cache/wal/wal")"
}

set-random-wallpaper() {
	wallpaper=$(ls $HOME/.dotfiles/wallpapers | shuf -n 1)
	set-wallpaper "$HOME/.dotfiles/wallpapers/$wallpaper"
}
