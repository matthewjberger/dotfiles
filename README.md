# Matthew Berger's Dotfiles

These are my personal dotfiles for Arch Linux.

![Desktop GIF](gifs/Desktop.gif)

## Installation Instructions

```bash
git clone https://github.com/matthewjberger/DotFiles dotfiles
cd dotfiles
sudo ./install
```

## Bootstrapper

`bootstrap.sh` is a script for setting up this environment from the Arch ISO command line.

```
wget https://git.io/fjYxm -O bootstrap.sh && chmod +x bootstrap.sh
./bootstrap.sh 
```

then after booting and logging in, open `konsole` and run:

```
wget https://git.io/fjYxO -O post-bootstrap.sh && chmod +x post-bootstrap.sh
./post-bootstrap.sh
```

and remember to update the root and user passwords.

### Choosing video drivers

Uncomment the proper line for the desired graphics driver in `bootstrap.sh`:

```
vulkan-radeon # default
# vulkan-intel
# nvidia 
```

### KDE Changes

#### Disable Desktop Toolbox

Right click on the desktop -> `Configure Desktop` -> `Tweaks` -> Disable `Show Desktop Toolbox`

#### Disable Wallpaper Change Messages

`Notifications` -> `Local System Message Service` -> Disable `Show Message in a Popup` and `Play a Sound`

### Lenovo Ideapad 330s

To get Arch Linux working on the Lenovo Ideapad 330s, some extra steps are required.

#### Arch ISO

To get the Arch ISO to boot, press 'e' when the Arch ISO live usb menu comes up, and add the following kernel command line argument:

```
ivrs_ioapic[32]=00:14.0
```

#### Installing a WiFi Driver

The wifi driver necessary for using the wireless chip on the Lenovo Ideapad 330s is not present on the Arch ISO by default.
Connect to the internet via ethernet using a usb to ethernet adapter or a tethered android phone. Then after you've installed and booted into the system, run:

```
git clone https://github.com/tomaspinho/rtl8821ce
cd rtl8821ce
make all
make install
modprobe 8821ce
```

This allows the touchpad to work and allows the computer to boot.

#### Video Drivers

The `xf86-video-amdgpu` package contains the video drivers necessary for the Lenovo Ideapad 330s.

#### Tapping Touchpad

Find your touchpad id:

```
xinput list
```

List Properties:

```
xinput list-props id
```

Set Tapping enabled (assuming touchpad id is `11` property id is `280`):

```
xinput set-prop 11 280 1
```
