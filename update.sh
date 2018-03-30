#!/bin/bash

DOTFILES_DIR=~/dotfiles   # dotfiles directory
BACKUP_DIR=~/dotfiles_old # old dotfiles backup directory
USERNAME=$(echo $USER)

ORANGE='\033[0;33m'
NC='\033[0m'

# list of files to symlink
FILES=(
  # files to symlink
  .bashrc
  .bash_aliases
  .bash_functions
  .bash_profile
  .vimrc
  .xinitrc
  .Xresources
  .config/gtk-3.0/gtk.css
  .config/i3/config
  .config/i3/statusbar.conf
  .config/termite/config
  .weechat/weechat.conf
  .weechat/buffers.conf
  .mpd/mpd.conf
  .ncmpcpp/config
  .ssh/config
  .ssh/id_rsa.pub
  .config/mpv/mpv.conf
  .npmrc
  .gitconfig

  # directories to symlink
  .vim/
  .screenlayout/
)

# files that must exist
TOUCH_FILES=(
  .mpd/mpdstate
  .mpd/mpd.pid
  .mpd/mpd.db
  .mpd/mpd.log
)

# directories that must exist
TOUCH_DIRS=(
  .ssh/
  .weechat/
  .ncmpcpp/
  .mpd/playlists/
  .config/mpv/
  .config/gtk-3.0/
  .config/i3/
  .config/termite/
)

# :: SETUP PROCESS

# re-create dotfiles_old in homedir if necessary
echo "[Setup] Creating $BACKUP_DIR to backup any existing dotfiles in /home/$USERNAME"
rm -rf $BACKUP_DIR > /dev/null 2>&1 && mkdir $BACKUP_DIR

# copy any existing dotfiles to backup folder
for file in "${FILES[@]}"; do
  symlink_file=${file%/} # removes trailing slash
  if [[ -L ~/$symlink_file ]]; then
    rm -f ~/$symlink_file
  elif [[ -e ~/$symlink_file ]]; then
    mv ~/$file $BACKUP_DIR
  fi
done

# touch directories
for directory in "${TOUCH_DIRS[@]}"; do
  if [[ ! -d ~/$directory ]]; then
    printf "[Setup] touching directory: ${ORANGE}~/$directory${NC}\n"
    mkdir -p ~/$directory
  fi
done

# touch files
for file in "${TOUCH_FILES[@]}"; do
  if [[ ! -e ~/$file ]]; then
    printf "[Setup] touching file: ${ORANGE}$file${NC}\n"
    touch ~/$file
  fi
done

# symlink everything from the new dotfiles directory.
for file in "${FILES[@]}"; do
  symlink_file=${file%/} # removes trailing slash
  printf "[Setup] Creating symlink to ${ORANGE}~/$symlink_file${NC} in home directory.\n"
  ln -s $DOTFILES_DIR/$symlink_file ~/$symlink_file
done

# permissions
chmod 400 ~/.ssh/id_rsa

echo "[Setup] done."
