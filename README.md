# Matthew Berger's Dotfiles

These are my personal dotfiles for Arch Linux.

![Desktop GIF](gifs/Desktop.gif)

> For demonstration of swapping out wallpapers and then regenerating a colorscheme in the gif I'm pressing a reload hotkey set in my `sxhkdrc`.

## Installation Instructions

```bash
git clone https://github.com/matthewjberger/DotFiles dotfiles
cd dotfiles
sudo ./install
```

## Linux Bootstrapper

`bootstrap.sh` is a script for setting up this environment from the Arch ISO command line.

```
curl https://git.io/fjYxm -o bootstrap.sh && chmod +x bootstrap.sh
./bootstrap.sh 
```

then after booting and logging in, open `konsole` and run:

```
curl https://git.io/fjYxO -o setup.sh && chmod +x setup.sh
./setup.sh
```

and remember to update the root and user passwords.

### Choosing video drivers

Uncomment the proper line for the desired graphics driver in `setup-environment.sh`:

```
vulkan-radeon # default
# vulkan-intel
# nvidia 
```

### KDE Changes

#### Disable Desktop Toolbox

Right click on the desktop -> `Configure Desktop` -> `Tweaks` -> Disable `Show Desktop Toolbox`

#### Disable Showing Desktop Icons

Right click on the desktop -> `Configure Desktop` -> `Wallpaper` -> Change Layout to `Desktop`

#### Disable Wallpaper Change Messages

`Notifications` -> `Local System Message Service` -> Disable `Show Message in a Popup` and `Play a Sound`

### Lenovo Ideapad 330s

To get Arch Linux working on the Lenovo Ideapad 330s, some extra steps are required.

#### Arch ISO

To get the Arch ISO to boot, press `e` when the Arch ISO live usb menu comes up, and add the following kernel command line argument:

```
ivrs_ioapic[32]=00:14.0
```

This allows the touchpad to work and allows the computer to boot.

#### Installing a WiFi Driver

The wifi driver necessary for using the wireless chip on the Lenovo Ideapad 330s is not present on the Arch ISO by default.
Connect to the internet via ethernet using a usb to ethernet adapter or a tethered android phone. Then after you've installed and booted into the system, run:

```
git clone https://github.com/tomaspinho/rtl8821ce
cd rtl8821ce
make all
make install
modprobe 8821ce

# OR use yay

yay -S rtl8821ce-dkms-git
```

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

#### Brightness Controls

Using the brightness keys on the keyboard doesn't work for this laptop by default or
with any combination of acpi kernel parameters, so `xrandr` is used for controlling brightness.
The `brightness.sh` script increases or decreases the brightness incrementally using `xrandr`
and is invoked by `sxhkd`.

To prevent the backlight from failing to load (even though it still doesn't work),
add the following kernel parameter:

```
acpi_backlight=vendor
```

## Windows Bootstrapper

Open a powershell terminal (Powershell 5+ required) and run (as admin):

```
Invoke-WebExpression -Uri https://git.io/fj5Vz -OutFile bootstrap.ps1
./bootstrap.ps1
git clone https://github.com/matthewjberger/dotfiles
cd ./bootstrap/windows
./install.ps1
```
