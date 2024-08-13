# Fresh Arch installation

This repository contains installation and configuration scripts for a fresh Arch installation with personal preferences.

## Installing Arch

### Bootable USB drive

To install Arch on your machine, a bootable USB drive with containing an Arch image is required. You will need to download the 
[Arch ISO file](https://archlinux.org/download/) and make the USB bootable. To make a USB bootable with a Windows machine, 
we recommend using [rufus](https://rufus.ie/en/), for Linux we recommend using basic command line utilities following the 
[Arch wiki](https://wiki.archlinux.org/title/USB_flash_installation_medium).

### Booting into Arch Linux

Insert the bootable USB drive into the machine you want to install Arch on, and enter the bootloader. Depending on your operating system and 
computer model, the way to enter the bootloader may vary so we suggest searching how to do so for your particular machine. Note that it may be 
necessary to disable safe boot.

### Network access

When you've managed to boot into Arch Linux for the first time, it is 
time to set up the installation. However, network access will be 
required to download the necessary packages. The quickest and easiest 
way is to simply plug in an ethernet cable. If this is not an option,
`iwd` and `iwctl` should already be present on your machine and 
can be used to connect to a Wi-Fi network. The Wi-Fi devices on your 
machine can be listed with:
```
$ iwctl device list
```
If the device and/or its corresponding adapter is turned off, you will 
first need to turn it on:
```
$ iwctl device NAME set-property Powered on
$ iwctl device ADAPTER set-property Powered on
```
Typically `NAME` is `wlan0` and `ADAPTER` is `phy0`, though this may 
differ and the names listed previously should be used. Next, we scan 
for networks with the Wi-Fi device:
```
$ iwctl station NAME scan
```
and list all the available networks:
```
$ iwctl station NAME get-networks
```
Finally, if the network you want to connect to is listed, we can 
connect to it:
```
$ iwctl station NAME connect SSID password PASSWORD
```

You can check if your Wi-Fi or ethernet connection 
is functional by running:
```
$ ping www.example.com
```
and seeing that data packets do in fact arrive. To interrupt `ping`, 
press `Ctrl+c`.

### Installation 

The easiest way to install Arch Linux is by running `archinstall`. Simply 
follow the installation steps, and if anything isn't clear, look it up 
online. Only a few things need to be kept in mind for this installation 
repo to function correctly.

- Window manager: During installation, you will be asked to choose a 
    desktop environment/window manager. This installation uses `hyprland`.
- Audio: The assumed audio choice for this install is `pipewire`.
- Network Configuration: To handle Wi-Fi networks once the installation is
    complete, we suggest selecting `NetworkManager`.

Once the installation has finished, run `reboot`. The `sddm` greeter 
should open and you can login with the user you've created during install.

### Connecting to Wi-Fi after install

After the installation and logging into your system, it may be possible 
you do not have Wi-Fi connection again. Fortunately, we installed 
[`NetworkManager`](https://wiki.archlinux.org/title/NetworkManager) during
install, which replaces `iwctl`. To find nearby Wi-Fi networks run:
```
$ nmcli device wifi list
```
and to connect to a network:
```
$ nmcli device wifi connect SSID password PASSWORD
```

## Configuring the install
 
### Cloning the GitHub repository

In order to access the installation and configuration scripts in the 
repository, it will need to be cloned. By default, `git` will not be 
installed, so install it first with the `pacman` package manager:
```
$ sudo pacman -S git
```
Then, clone the repository:
```
$ git clone [...]
```

### Installing packages and Symlinking dotfiles

First, `cd` into the cloned GitHub repository, then we install and 
set everything up with:
```
$ ./installer.sh
```
This installation script does a few things:

- Back-up any existing configuration files/directories with the same
    name by adding `.bak` at the end.
- Install all the `pacman` installable packages required.
- Install the `yay` AUR-helper.
- Install all the `aur` packages we need with `yay`.
- Symlink the configuration dotfiles with `stow`. This is the reason 
    we needed to backup any existing ones, so conflict is avoided.

## Notes

There are a few things that are not done during with the `installer.sh` 
script as they are either account or machine dependent and are not known 
beforehand.

### GPU acceleration

Depending on your GPU, the right drivers may or may not have been 
installed and your GPU may or may not be functional. You will need to 
look this up online for your particular use case. The following contains
a list of files/programs that can benefit from GPU acceleration:

- Hyprland: [...]
- Firefox: [...]

### Direct paths in configurations

Certain files, mainly `.css` files, need direct file paths and do not 
benefit from certain abstractions like `~` or `$HOME`. The following is 
a list of configuration files where you will manually need to change 
file paths:

- Waybar: See ./waybar/.config/waybar/style.css
- Wlogout: See ./wlogout/.config/wlogout/style.css

### Sddm themes

The available `sddm` themes on your system are listed in `/usr/share/sddm/themes/`, to test a particular theme run
```
$ sddm-greeter --test-theme --theme /usr/share/sddm/themes/THEME
```
During the install `sugar-dark` was installed, so you should be able to test it out by replacing `THEME` with `sugar-dark`.
At the same time you will be able to check that the install for the greeter ran correctly. To change the default wallpaper of 
Espeon, you will need to go to the `/usr/share/sddm/themes/sugar-dark/theme.conf` file and change the `espeon.jpg` with your 
desired wallpaper. Note, however, that the image must be locally located in the `/usr/share/sddm/themes/sugar-dark` directory.

### Wayland

The `hyprland` window manager is a `wayland` compositor. Many programs 
still use the older `X11` compositor. Keep this in mind when installing
programs, it may occasionally be required to add additional flags 
for the programs to render correctly (for example `spotify-launcher`).

