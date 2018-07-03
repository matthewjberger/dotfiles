#!/bin/bash

wallpaper_dir=$HOME/unsplash
wallpaper_name=wallpaper.jpg
mkdir -p $wallpaper_dir
resolution=1920x1080

set-wallpaper() {
	wal -i "$@"
	. ~/.dotfiles/bspwmrc > /dev/null
}

set-random-wallpaper() {
	wallpaper=$(ls $HOME/.dotfiles/wallpapers | shuf -n 1)
	set-wallpaper "$HOME/.dotfiles/wallpapers/$wallpaper"
	. ~/.dotfiles/bspwmrc > /dev/null
}

set-unsplash-wallpaper-search() {
	wget "https://source.unsplash.com/$resolution/?$@" -O $wallpaper_dir/$wallpaper_name
	set-wallpaper $wallpaper_dir/$wallpaper_name
}

set-random-unsplash-wallpaper() {
	wget "https://source.unsplash.com/random/$resolution" -O $wallpaper_dir/$wallpaper_name
	set-wallpaper $wallpaper_dir/$wallpaper_name
}

save-unsplash-wallpaper() {
	[ -f $HOME/unsplash/wallpaper.jpg ] && cp --backup=numbered $HOME/unsplash/wallpaper.jpg $HOME/.dotfiles/wallpapers
}
