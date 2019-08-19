# !/bin/bash

# UEFI/GPT Installation
# This is meant to be run from the archiso live media command line

host_name=odinsbeard
root_password=toor
user_name=odin
user_password=password
additional_kernel_parameters="nosplash"
using_virtualbox=false

# Reset the screen
reset

# Check for UEFI
echo "Checking for UEFI..."
efivar -l >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo "ERROR: UEFI not detected, exiting..."
    exit 0
fi
echo "UEFI detected!"

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
pacstrap /mnt base base-devel plasma dolphin konsole refind-efi xorg-server xorg-xinit git pkgfile sddm kdeconnect wget

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
pacman --noconfirm -Rsc netctl
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

# Add to video and games group
gpasswd -a $user_name video
gpasswd -a $user_name games
gpasswd -a $user_name systemd-journal

# Do a full system upgrade
pacman --noconfirm -Syyu

if [ $using_virtualbox ]; then
    pacman --noconfirm -S virtualbox-guest-utils virtualbox-guest-dkms
    systemctl enable vboxservice.service
    echo fs0:\\EFI\\refind\\refind_x64.efi | tee /boot/startup.nsh
fi

reset
EOF

umount -R /mnt
reboot

