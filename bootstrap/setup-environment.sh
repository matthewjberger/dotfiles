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
cat << REFLECTOR > /etc/systemd/system/reflector.service
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

systemctl enable reflector.service

# Install tools
pacman --noconfirm -S alacritty \
                      arm-none-eabi-gcc \
                      bat \
                      brave \
                      bspwm \
                      cataclysm-dda \
                      cataclysm-dda-tiles \
                      cmake \
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
                      net-tools \
                      nethack \
                      network-manager-applet \
                      nodejs \
                      npm \
                      openssh \
                      playerctl \
                      python \
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
                      sdcv \
                      strace \
                      stone-soup \
                      sxhkd \
                      tmux \
                      ttf-font-awesome \
                      ttf-hack \
                      vim \
                      vulkan-icd-loader \
                      vulkan-devel \
                      vim \
                      xorg-xinput \
                      wabt \
                      wpa_supplicant \
                      vulkan-radeon \
                      # vulkan-intel \
                      # nvidia \

# Install dictionary for sdcv
wget http://download.huzheng.org/dict.org/stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2
mkdir -p /usr/share/stardict/dic/
tar -xjvf stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
rm stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2

# Setup rust
rustup default stable
rustup update
rustup update nightly
rustup component add rls-preview rust-analysis rust-src clippy-preview rustfmt

rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo cargo-watch cargo-edit

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

# Setup ruby
gem install bundler jekyll
