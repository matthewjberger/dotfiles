# Install an aur helper
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -sri

# Install dotfiles
echo "Installing dotfiles..."
mkdir -p $HOME/code
git clone https://github.com/matthewjberger/dotfiles $HOME/code/dotfiles
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

# Install rust
curl https://sh.rustup.rs -sSf -o rustup-init.sh
chmod +x rustup-init.sh
./rustup-init.sh -y
source $HOME/.cargo/env
rm rustup-init.sh

rustup self update
rustup update
rustup update nightly
rustup component add rls-preview rust-analysis rust-src clippy-preview rustfmt

rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo
cargo +nightly install racer

# Change shell
chsh odin -s /usr/bin/fish

