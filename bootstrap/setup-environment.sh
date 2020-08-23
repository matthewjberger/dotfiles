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
sudo pacman --noconfirm -S \
	alacritty \
	amdvlk \
	arm-none-eabi-gcc \
	bat \
	bspwm \
	cataclysm-dda \
	cataclysm-dda-tiles \
	ccls \
	cmake \
	code \
	conky \
	dialog \
	diff-so-fancy \
	dotnet-sdk \
	dunst \
	dwarffortress \
	emacs \
	evince \
	feh \
	fish \
	firefox \
	frotz-ncurses \
	fzf \
	glslang \
	hub \
	hyperfine \
	irssi \
	kakoune \
	libnotify \
	man \
	ncdu \
	neofetch \
	neovim \
	net-tools \
	nethack \
	network-manager-applet \
	nodejs \
	npm \
	openssh \
	powertop \
	playerctl \
	python \
	python-neovim \
	python-pip \
	python-pywal \
	qemu \
	qemu-arch-extra \
	qt5-tools \
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
	tokei \
	tree \
	ttf-cascadia-code \
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
	w3m \
	wabt \
	wpa_supplicant \
	xorg-xev \
	zathura \
	zathura-pdf-mupdf \
	zip \

# Setup rust
rustup default stable
rustup update
rustup update nightly
rustup component add rls rust-analysis rust-src clippy-preview rustfmt

rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo cargo-watch cargo-edit cargo-expand cargo-tree

# Install AUR packages
yay -S --noconfirm \
    arch-wiki-man \
    bottom-bin \
    brave-bin \
    brogue \
    browsh \
    compton-tryone-git \
    downgrader-git \
    fisher \
    flatpak \
    fortune-mod-firefly \
    frobtads \
    fvim \
    gargoyle \
    glulxe-term \
    imgur-screenshot-git \
    nerd-fonts-hack \
    nodejs-vmd \
    polybar \
    pulseaudio-ctl \
    rust-analyzer \
    s \
    siji-git \
    tome4-git \

# Install spacemacs
if [ ! -d "$HOME/.emacs.d" ]; then
	git clone https://github.com/syl20bnr/spacemacs -b develop $HOME/.emacs.d
fi

systemctl enable --user emacs
systemctl start --user emacs

# Setup ruby
sudo gem install bundler jekyll

# Setup the blackarch unofficial user repository
curl -O https://blackarch.org/strap.sh
sha1sum strap.sh
chmod +x strap.sh
sudo ./strap.sh

# BlackArch Notes
#
# To list all of the available tools, run
# > sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u
#
# To install all of the tools, run
# > sudo pacman -S blackarch
#
# To install a category of tools, run
# > sudo pacman -S blackarch-<category>
#
# To see the blackarch categories, run
# > sudo pacman -Sg | grep blackarch
#
# Note - it maybe be necessary to overwrite certain packages when installing blackarch tools. If
# you experience "failed to commit transaction" errors, use the --needed and --overwrite switches
# For example:
# > sudo pacman -Syyu --needed blackarch --overwrite='*'

# Package manager for blackarch from the blackarch repos
yay -S --noconfirm blackman

