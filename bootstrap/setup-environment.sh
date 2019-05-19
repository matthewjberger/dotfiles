# Install an aur helper
command -v yay >/dev/null 2>&1 || {
	cd $HOME
	git clone https://aur.archlinux.org/yay.git
	cd yay
	yes | makepkg -sri
}

# Install dotfiles
if [ ! -d "$HOME/code/dotfiles" ]; then
	echo "Installing dotfiles..."
	mkdir -p $HOME/code
	git clone https://github.com/matthewjberger/dotfiles $HOME/code/dotfiles --recursive
	cd $HOME/code/dotfiles
	./install
fi

# Install AUR packages
yay -S --noconfirm \
    arch-wiki-man \
    brogue \
    browsh \
    dfhack-twbt-bin \
    dwarftherapist \
    fisher \
    fortune-mod-firefly \
    imgur-screenshot-git \
    nerd-fonts-hack \
    nerd-fonts-noto-sans-mono \
    polybar \
    pulseaudio-ctl \
    s \
    siji-git \
    tome4-git \

# Install spacemacs
if [ ! -d "$HOME/.emacs.d" ]; then
	git clone https://github.com/syl20bnr/spacemacs -b develop $HOME/.emacs.d
fi

systemctl --user enable --now emacs

