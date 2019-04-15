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
    nerd-fonts-hack \
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

rustup self update
rustup update
rustup update nightly
rustup component add rls-preview rust-analysis rust-src clippy-preview rustfmt

rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo
cargo +nightly install racer

# Install dictionary for sdcv
wget http://download.huzheng.org/dict.org/stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2
tar -xjvf stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
rm stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2

# Change shell
chsh odin -s /usr/bin/fish