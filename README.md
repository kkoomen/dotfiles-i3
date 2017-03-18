# Dotfiles

These are my dotfiles for ubuntu using i3 on a macbook air.<br/>
Below are some bug fixes and an installation guide for setting everything up.

# Getting started

- `$ git clone --recursive git@github.com:kkoomen/dotfiles-i3.git`
- `$ cd dotfiles`
- `$ ./setup.sh`

# System Installation

packages needed: `sudo apt-get install termite curl wget vim network-manager network-manager-openvpn-gnome py3status python-pip python-dev python3-dev mpv pavucontrol build-essential cmake`

python packages needed:

- `python-mp2` (required by mpd_status from py3status)

### Setup vim bundles

##### YouCompleteMe

```
$ cd ~/.vim/bundle/YouCompleteMe
$ git submodule update --init --recursive
$ ./install.py --all
```

### Install i3

```
$ sudo su -c "echo 'deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe' >> /etc/apt/sources.list"
$ sudo apt-get update
$ sudo apt-get --allow-unauthenticated install sur5r-keyring
$ sudo apt-get update
$ sudo apt-get install i3
```

After installing i3, rebooting and enabling i3, install i3-gaps (optional):

- Install dependencies

```
$ sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev
```

- Install i3-gaps itself

```
# clone the repository
$ git clone https://www.github.com/Airblader/i3 i3-gaps
$ cd i3-gaps

# compile & install
$ autoreconf --force --install
$ rm -rf build/
$ mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
$ ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
$ make
$ sudo make install
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

### Disable lightdm

This is so that you get a tty login instead the default ubuntu login

1. `sudo vim /etc/default/grub`
2. change `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"` to `GRUB_CMDLINE_LINUX_DEFAULT="text"`.
3. run `sudo update-grub`.
4. `sudo systemctl enable multi-user.target --force`
5. `sudo systemctl set-default multi-user.target`

### Set correct DPI

Add the following to `/etc/profile.d/qt-hidpi.sh`

```sh
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1.8
export GDK_SCALE=1.8
export GDK_DPI_SCALE=1.8
```

Don't forget to add `xrandr --dpi 180` to your `~/.xinitrc`.

Firefox
- Go to `about:config` in Firefox
- Set `layout.css.devPixelsPerPx` to `1.5`

Thunderbird
- Go to `Edit → Preferences → Advanced → Config editor`
- Set `layout.css.devPixelsPerPx` to `1.5`

# Enable keyboard backlight

- `git clone https://github.com/hobarrera/kbdlight && cd kbdlight`
- `make`
- `sudo make install`

# Bug fixes

### Nautilus

Nautilus opens on default two windows. The nautilus window and a second desktop window (wtf?) so get rid of
the desktop window with the following command:

`$ gsettings set org.gnome.desktop.background show-desktop-icons false`
