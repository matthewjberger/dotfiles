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

# Add reflector service to update the mirrorlist every time the computer boots
echo "Adding reflector service..."
cat << REFLECTOR > reflector.service
[Unit]
Description=Pacman mirrorlist update
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/bin/reflector --country US --protocol https --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist

[Install]
RequiredBy=multi-user.target
REFLECTOR
sudo mv reflector.service /etc/systemd/system/

sudo systemctl enable reflector.service

sudo pacman-key --populate archlinux

# Install tools
sudo pacman --noconfirm -S alacritty \
                      arm-none-eabi-gcc \
                      bat \
                      bspwm \
                      cataclysm-dda \
                      cataclysm-dda-tiles \
                      cmake \
                      code \
                      compton \
                      conky \
                      dialog \
                      dotnet-sdk \
                      dunst \
                      dwarffortress \
                      emacs \
                      evince \
                      feh \
                      fish \
                      firefox \
                      fzf \
                      glslang \
                      hub \
                      irssi \
                      kakoune \
                      libnotify \
                      neofetch \
                      neovim \
                      net-tools \
                      nethack \
                      network-manager-applet \
                      nodejs \
                      npm \
                      openssh \
                      playerctl \
                      python \
                      python-neovim \
                      python-pip \
                      python-pywal \
                      qemu \
                      qemu-arch-extra \
                      ranger \
                      redshift \
                      reflector \
                      ripgrep \
                      rofi \
                      rtv \
                      ruby \
                      rust-racer \
                      rustup \
                      strace \
                      stone-soup \
                      sxhkd \
                      tmux \
                      ttf-font-awesome \
                      ttf-hack \
                      unzip \
                      vim \
                      vulkan-icd-loader \
                      vulkan-devel \
                      vim \
                      xclip \
                      xorg-xinput \
                      xsel \
                      wabt \
                      wpa_supplicant \
                      vulkan-radeon \
                      xorg-xev \
                      # vulkan-intel \
                      # nvidia \

# Setup rust
rustup default stable
rustup update
rustup update nightly
rustup component add rls-preview rust-analysis rust-src clippy-preview rustfmt

rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo cargo-watch cargo-edit

# Install rust-analyzer
git clone https://github.com/rust-analyzer/rust-analyzer $HOME/code/rust-analyzer
cd $HOME/code/rust-analyzer
cargo install-ra --server

# Install AUR packages
yay -S --noconfirm \
    arch-wiki-man \
    brogue \
    browsh \
    fisher \
    flatpak \
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
sudo systemctl --user enable --now emacs

# Setup ruby
sudo gem install bundler jekyll

