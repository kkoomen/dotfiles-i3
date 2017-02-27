# Getting started

- `$ git clone --recursive git@github.com:muts/dotfiles-i3.git`
- `$ cd dotfiles`
- `$ ./setup.sh`

# System Installation

packages needed: `sudo apt-get install termite curl wget vim vim-gtk network-manager py3status python-pip mpv pavucontrol`

python packages needed:

- `python-mp2` (required by mpd_status from py3status)

### Install i3

```
$ sudo su -c "echo 'deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe' >> /etc/apt/sources.list"
$ sudo apt-get update
$ sudo apt-get --allow-unauthenticated install sur5r-keyring
$ sudo apt-get update
$ sudo apt-get install i3
```

### Install arc theme
- `sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"`
- `sudo apt-get update && sudo apt-get install arc-theme`

You’ll also need to import the repo’s key to quieten any command-line errors:
- `wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key`
- `sudo apt-key add - < Release.key && rm Release.key`

Installing the icons:
- `git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme`
- `./autogen.sh --prefix=/usr`
- `sudo make install`

Now open `lxappearance` and set the theme.

# Bug fixes

### Nautilus

Nautilus opens on default two windows. The nautilus window and a second desktop window (wtf?) so get rid of
the desktop window with the following command:

`$ gsettings set org.gnome.desktop.background show-desktop-icons false`

### Disable lightdm

This is so that you get a tty login instead the default ubuntu login

1. `sudo vim /etc/default/grub`
2. change `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"` to `GRUB_CMDLINE_LINUX_DEFAULT="text"`.
3. run `sudo update-grub`.
4. `sudo systemctl enable multi-user.target --force`
5. `sudo systemctl set-default multi-user.target`

### Set scaling

Add the following to `/etc/profile.d/qt-hidpi.sh`

```
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1.8
export GDK_SCALE=1.8
export GDK_DPI_SCALE=1.8
```

Don't forget to add `xrandr --dpi 180` to your `~/.xinitrc`.
