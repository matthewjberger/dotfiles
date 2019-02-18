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
wget https://git.io/fh5b3 -O bootstrap.sh && chmod +x bootstrap.sh

./bootstrap.sh hostname root_password user_name user_password additional_kernel_parameters using_virtualbox

# bootstrap.sh odinsbeard somerootpassword odin somepassword "amdgpu.dc=0 nosplash" false
```

### Choosing video drivers

Uncomment the proper line for the desired graphics driver in `bootstrap.sh`:

```
vulkan-radeon # default
# vulkan-intel
# nvidia 
```