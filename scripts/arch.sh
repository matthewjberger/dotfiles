# Arch Linux bootstrap configuration

# Bring Arch up to date
sudo pacman -Syuw --noconfirm
sudo pacman -S --noconfirm archlinux-keyring
sudo rm /etc/ssl/certs/ca-certificates.crt
sudo pacman -Su --noconfirm
sudo pacman -S --noconfirm ca-certificates ca-certificates-utils

# Install packages
sudo pacman -S --noconfirm \
xorg-server xorg-xinit i3 feh dos2unix \
xrandr lxrandr dmenu conky mesa mesa-demos \
fasd git termite zsh xorg-twm python3 \
i3blocks cmake bash zsh ttf-hack emacs neovim

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
yaourt -S --noconfirm python2-neovim
yaourt -S --noconfirm python-neovim
