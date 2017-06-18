# Dotfiles

These are my dotfiles for ubuntu using i3 on a macbook air.<br/>
Below are some bug fixes and an installation guide for setting everything up.

# Installation

Start off by cloning:

```
$ git clone git@github.com:kkoomen/dotfiles.git
$ cd dotfiles/
```

Run the following scripts:

- `sh ./scripts/install/install_1.sh` (setting up i3)
  - Reboot and login using i3
- `sh ./scripts/install/install_2.sh` (setting up env)
- `sh ./scripts/install/install_3.sh` (apache2, docker etc)

You can update symbolic links with the `./update.sh` script.

##### Disable lightdm

This is so that you get a tty login instead the default ubuntu login. You have to
do this to run ~/.xinitrc and other files on startup.

1. `sudo vim /etc/default/grub`
2. change `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"` to `GRUB_CMDLINE_LINUX_DEFAULT="text"`.
3. run `sudo update-grub`.
4. `sudo systemctl enable multi-user.target --force`
5. `sudo systemctl set-default multi-user.target`

##### Set correct DPI

Add the following to `/etc/profile.d/qt-hidpi.sh` **ONLY** if you disabled lightdm

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

# Troubleshooting

- GPG error: The following signatures couldn't be verified because the public key
is not available

Replace `<key>` with the key you got in the error.
`
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys <key>
$ sudo apt-get update
`
