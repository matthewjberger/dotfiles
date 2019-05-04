# Install an aur helper
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -sri

# Install dotfiles
echo "Installing dotfiles..."
mkdir -p $HOME/code
git clone https://github.com/matthewjberger/dotfiles $HOME/code/dotfiles --recursive
cd $HOME/code/dotfiles
./install

# Install AUR packages
yay -S --noconfirm \
    arch-wiki-man \
    fisher \
    fortune-mod-calvin \
    fortune-mod-firefly \
    imgur-screenshot-git \
    nerd-fonts-hack \
    nerd-fonts-noto-sans-mono \
    polybar \
    pulseaudio-ctl \
    s \
    siji-git

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs -b develop $HOME/.emacs.d

systemctl --user enable --now emacs

# Setup blackarch repo and package manager for pentesting tools
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
rm strap.sh
yay -S blackman

