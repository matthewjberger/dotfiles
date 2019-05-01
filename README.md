# Matthew Berger's Dotfiles

These are my personal dotfiles for Arch Linux.

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

then after booting and logging in:

```
wget https://git.io/fjYxO -O post-bootstrap.sh && chmod +x post-bootstrap.sh
bax ./post-bootstrap.sh
```

and remember to update the root and user passwords.

### Choosing video drivers

Uncomment the proper line for the desired graphics driver in `bootstrap.sh`:

```
vulkan-radeon # default
# vulkan-intel
# nvidia 
```
