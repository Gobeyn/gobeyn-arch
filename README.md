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
```bash
iwctl device list
```
If the device and/or its corresponding adapter is turned off, you will 
first need to turn it on:
```bash
iwctl device NAME set-property Powered on
iwctl device ADAPTER set-property Powered on
```
Typically `NAME` is `wlan0` and `ADAPTER` is `phy0`, though this may 
differ and the names listed previously should be used. Next, we scan 
for networks with the Wi-Fi device:
```bash
iwctl station NAME scan
```
and list all the available networks:
```bash
iwctl station NAME get-networks
```
Finally, if the network you want to connect to is listed, we can 
connect to it:
```bash
iwctl station NAME connect SSID password PASSWORD
```

You can check if your Wi-Fi or ethernet connection 
is functional by running:
```bash
ping www.example.com
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
```bash
nmcli device wifi list
```
and to connect to a network:
```bash
nmcli device wifi connect SSID password PASSWORD
```

## Configuring the install
 
### Cloning the GitHub repository

In order to access the installation and configuration scripts in the 
repository, it will need to be cloned. By default, `git` will not be 
installed, so install it first with the `pacman` package manager:
```bash
sudo pacman -S git
```
Then, clone the repository:
```bash
git clone https://github.com/Gobeyn/gobeyn-arch.git
```

### Installing packages and Symlinking dotfiles

First, `cd` into the cloned GitHub repository, then we install and 
set everything up with:
```bash
./installer.sh
```
This installation script does a few things:

- Back-up any existing configuration files/directories with the same
    name by adding `.bak` at the end.
- Install all the `pacman` installable packages required.
- Install the `yay` AUR-helper.
- Install all the `aur` packages we need with `yay`.
- Install personal projects [`crust`](https://github.com/Gobeyn/crust) and [`dumpling`](https://github.com/Gobeyn/dumpling).
- Setup directories and files for certain packages used by the installation. For instance, 
    files need to be copied to root directories for `sddm` to look like we want it too and 
    a line needs to be added to a root access file for `spotify-launcher` to load correctly in
    `wayland`.
- Symlink the configuration dotfiles with `stow`. This is the reason 
    we needed to backup any existing ones, so conflict is avoided.

## Notes

There are a few things that are not done during with the `installer.sh` 
script as they are either account or machine dependent and are not known 
beforehand.

### GPU acceleration

If you have a dedicated GPU, we highly advice making sure that it is functional 
before running the installation script.

Depending on your GPU, the right drivers may or may not have been 
installed and your GPU may or may not be functional. You will need to 
look this up online for your particular use case. The following contains
a list of files/programs that can benefit from GPU acceleration:

- Hyprland: See: ./hypr/.config/hypr/hypr-configs/hypr_general.conf and 
    Hyprland documentation. We encountered issues when using the integrated 
    GPU with a second monitor. The current configuration uses the integrated GPU 
    by default, but if that doesn't work, falls back on the dedicated Nvidia GPU.
    However, we noticed that if we boot the laptop without the second monitor attached, 
    then it does not render properly, but if we boot with the second monitor already 
    plugged in, then it works as expected. We think this has to do with the GPU fallback,
    but we're not sure.
- Video rendering, for instance in your browser.
- Ollama: In order to run LLM's locally, GPU acceleration is advised.
### Direct paths in configurations

Certain files, mainly `.css` files, need direct file paths and do not 
benefit from certain abstractions like `~` or `$HOME`. The following is 
a list of configuration files where you will manually need to change 
file paths:

- Waybar: See ./waybar/.config/waybar/style.css
- Wlogout: See ./wlogout/.config/wlogout/style.css, in this file there 
    are multiple direct file paths to icons and background.

### Sddm themes

The available `sddm` themes on your system are listed in `/usr/share/sddm/themes/`, to test a particular theme run
```bash
sddm-greeter --test-theme --theme /usr/share/sddm/themes/THEME
```
During the install `sugar-dark` was installed, so you should be able to test it out by replacing `THEME` with `sugar-dark`.
At the same time you will be able to check that the install for the greeter ran correctly. To change the default wallpaper of 
Espeon, you will need to go to the `/usr/share/sddm/themes/sugar-dark/theme.conf` file and change the `espeon.jpg` with your 
desired wallpaper. Note, however, that the image must be locally located in the `/usr/share/sddm/themes/sugar-dark` directory.

### Wayland

The `hyprland` window manager is a `wayland` compositor. Many programs 
still use the older `X11` compositor. Keep this in mind when installing
programs, it may occasionally be required to add additional flags 
for the programs to render correctly.

### Symlink issues

If something went wrong during the creation of symlinks with `stow`, you can run the `unstow.sh` script to undo the symlinks executed by 
`stow-dotfiles.sh`

### Connecting to Bluetooth devices

We have not used this yet, so we'll refer to the 
[Arch wiki](https://wiki.archlinux.org/title/Bluetooth).

### Mounting external storage devices

In order to move files from and to a USB device, external hard drive, etc.
we need to mount the device first. The tool we use for this is 
`udisksctl`, see the [Arch wiki](https://wiki.archlinux.org/title/Udisks).
To mount the device we run:
```bash
udisksctl mount -b /dev/sdxy
```
where `sdxy` is the typical format for an external storage device where 
`xy` will vary. To find what we should fill in exactly, we can use 
`lsblk`, which will list the available storage devices. Once the device 
is mounted, a file path will be shown where the contents of the 
storage device can be accessed and information can be written to. When 
you are finished using the device, it is important that you unmount it 
first with:
```bash
udisksctl unmount -b /dev/sdxy
```

### Firefox plugins

For a better experience with `firefox` we suggest installing some plugins. The most important one being `uBlock` which blocks adds, including 
add on `YouTube`. We also recommend using `Dark Reader` which will turn any page into dark mode. Lastly, because we are using `pipewire`, we also 
need the `Pipewire Screenaudio` extension so apps like `discord` can be used properly from the browser. You can also change the theme of Firefox, see the 
settings for a link to a URL with various themes. We are using the `praise the sun` theme.

