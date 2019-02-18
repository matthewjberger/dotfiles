# !/bin/bash

# UEFI/GPT Installation
# This is meant to be run from the archiso live media command line

host_name=$1
root_password=$2
user_name=$3
user_password=$4
additional_kernel_parameters=$5
using_virtualbox=$6

# Check for UEFI
echo "Checking for UEFI..."
efivar -l >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo "ERROR: UEFI not detected, exiting..."
    exit 0
fi
echo "UEFI detected!"

# Reset the screen
reset

# Update the system clock
timedatectl set-ntp true

# Zap disk
echo "Zapping disk..."
sgdisk --zap-all /dev/sda

# Set 1 ESP partition and 1 primary ext4 partition
parted /dev/sda -s mklabel gpt
echo "Creating /dev/sda1..."
parted /dev/sda -s mkpart ESP fat32 1MiB 551MiB
parted /dev/sda -s set 1 esp on
echo "Creating /dev/sda2..."
parted /dev/sda -s mkpart primary ext4 551MiB 100%

# Format the ESP partition as fat32
echo "Formatting the ESP partition as fat32..."
mkfs.fat -F32 /dev/sda1

# Format the primary partition as ext4
echo "Formatting the primary partition as ext4..."
mkfs.ext4 /dev/sda2

# Mount the partitions
echo "Mounting partitions..."
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

# Get available mirrors for the US, and then use rankmirrors to sort them
echo "Updating mirrorlist..."
pacman -Sy
pacman -S --noconfirm --needed --noprogressbar --quiet reflector
reflector -l 200 -n 20 -p https --sort rate --save /etc/pacman.d/mirrorlist

# Install the base packages
echo "Installing base packages..."
pacstrap /mnt base base-devel plasma dolphin konsole refind-efi xorg-server xorg-xinit git pkgfile sddm

# Generate the fstab file
echo "Generating fstab..."
genfstab -U /mnt > /mnt/etc/fstab

# Chroot into the system
arch-chroot /mnt /bin/bash <<EOF

# Set the time zone
echo "Setting time zone..."
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

# Setup the hardware clock
echo "Setting up the hardware clock..."
hwclock --systohc

# Setup locale
echo "Setting locale..."
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
export LANG=en_US.UTF-8
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Create the hostname file
echo "Setting hostname..."
echo $host_name > /etc/hostname

echo "Setting up hosts file..."
cat << CONF > /etc/hosts
127.0.0.1 localhost
::1 localhost
127.0.1.1 $host_name.localdomain $host_name
CONF

# Create a new initramfs
echo "Generating initramfs"
mkinitcpio -p linux

# Remove netctl in favor of network manager
netctl stop-all
pacman -Rsc netctl
pacman --noconfirm -S networkmanager network-manager-applet
systemctl enable NetworkManager.service

# Enable the login manager
systemctl enable sddm.service

# Setup a password for the root account
echo "Setting root password..."
echo "root:${root_password}" | chpasswd

# Update pkgfile database
pkgfile --update

# Install linux lts kernel
echo "Installing Linux LTS Kernel..."
pacman --noconfirm -S linux-lts linux-lts-headers

# Set up bootloader
echo "Setting up bootloader..."
refind-install

# Configure bootloader
mkrlconf --force
git clone https://github.com/EvanPurkhiser/refind-minimal /boot/EFI/refind/themes/refind-minimal
mv /boot/EFI/refind/refind.conf /boot/EFI/refind/refind.conf.original
cat << CONF > /boot/EFI/refind/refind.conf
timeout 20

menuentry "Arch Linux LTS" {
    icon /EFI/refind/themes/refind-minimal/icons/os_arch.png
    loader vmlinuz-linux-lts
    initrd initramfs-linux-lts.img
    options = "root=$(blkid | grep sda2 | cut -f 4 -d ' ' | tr -d '"') rw $additional_kernel_parameters"
}

default_selection "Arch Linux LTS"
scanfor manual,external

include themes/refind-minimal/theme.conf
CONF

rm /boot/refind_linux.conf

# Add a non-root user
useradd -m -g users -s /bin/bash $user_name
echo "${user_name}:${user_password}" | chpasswd

# Make the non-root user a sudoer
echo $user_name ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers

# Do a full system upgrade
pacman --noconfirm -Syyu

# Install an aur helper
cd /home/$user_name
git clone https://aur.archlinux.org/yay.git
chown $user_name yay
cd yay
su $user_name -c "yes | makepkg -sri"

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

# Install tools
pacman --noconfirm -S alacritty \
                      dialog \
                      emacs \
                      fish \
                      fzf \
                      hub \
                      irssi \
                      kakoune \
                      neofetch \
                      nodejs \
                      npm \
                      python \
                      python-pip \
                      python-pywal \
                      ranger \
                      reflector \
                      rofi \
                      stone-soup \
                      tmux \
                      ttf-font-awesome \
                      ttf-hack \
                      vim \
                      vulkan-icd-loader \
                      vulkan-devel \
                      vulkan-radeon \
                      # vulkan-intel \
                      # nvidia \
                      vim \
                      wpa_supplicant \
                      wget

# Change shell
chsh $user_name -s $(which fish)

# Install dotfiles
echo "Installing dotfiles..."

if [ $using_virtualbox ]; then
    pacman --noconfirm -S virtualbox-guest-utils virtualbox-guest-dkms
    systemctl enable vboxservice.service
fi

su $user_name << UserCommands
mkdir -p /home/$user_name/code
git clone https://github.com/matthewjberger/dotfiles /home/$user_name/code/dotfiles
cd /home/$user_name/code/dotfiles
./install
UserCommands
systemctl enable reflector.service

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs -b develop $HOME/.emacs.d

# Install rust
su $user_name
curl https://sh.rustup.rs -sSf -o rustup-init.sh
chmod +x rustup-init.sh
./rustup-init.sh -y
source $HOME/.cargo/env

rustup self update
rustup update
rustup update nightly
rustup component add rls-preview rust-analysis rust-src clippy-preview

rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count
cargo +nightly install racer

reset
EOF

umount -R /mnt
reboot