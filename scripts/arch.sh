# Arch Linux bootstrap configuration

# Bring Arch up to date
sudo pacman -Syuw --noconfirm
sudo rm /etc/ssl/certs/ca-certiicates.certiicates
sudo pacman -Su --noconfirm

# Install packages
sudo pacman -S --noconfirm \
xorg-server xorg-xinit i3 feh \
dmenu conky mesa mesa-demos \
git termite zsh xorg-twm python3 \
cmake bash zsh ttf-hack emacs neovim

# Install yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
rm -rf package-query
rm -rf yaourt

# Install AUR packages
yaourt -S --noconfirm google-chrome
yaourt -S --noconfirm neofetch