shopt -s expand_aliases

# GENERAL
alias dsize='du -hs'
alias mkdir='mkdir -pv'
alias vi='vim'
alias ls='ls -l --color=auto'
alias sl='ls'
alias tree='tree -C'
alias pcinfo='inxi -Fx'
alias calc='bc -l'
alias cb="xclip -selection clipboard"
alias yt-dl='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias make-tar='tar -czvf'

alias hibernate='sudo pm-hibernate'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'

# NETWORK
alias xip='curl icanhazip.com'
alias lip="ifconfig | grep -A 1 'wlp3s0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1"
alias listports="ss -tln | awk '{print $4}'"

# DOTFILES
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias Xresources='vim ~/.Xresources'
alias reload='source ~/.bashrc'
alias xmerge='xrdb -merge ~/.Xresources'

# PASTEBINS
alias ix="curl -s -F 'f:1=<-' ix.io"
alias pb="curl -s -F c=@- https://ptpb.pw/ | grep url"

# FIREWALL
alias httpon='sudo ufw allow http'
alias httpoff='sudo ufw delete allow http'

# DOCKER
function ddrush {
  # If we don't receive any version, we can assume this project is drupal 8 that
  # uses drupal lightning skeleton, so we change directory in docroot/ and run
  # drush from there.
  drupal_version=$(docker-compose exec php drush st --format=list drupal_version | cut -d '.' -f 1)

  if [[ "$drupal_version" -eq "" ]] || [[ "${drupal_version:0:1}" -eq "8" ]]; then
    docker-compose exec php bash -c "cd docroot && drush ${@}"
  else
    docker-compose exec php drush ${@}
  fi
}

function ddrush-sqldump {
  # If we don't receive any version, we can assume this project is drupal 8 that
  # uses drupal lightning skeleton, so we change directory in docroot/ and run
  # an "drush sql-dump" from there.
  drupal_version=$(docker-compose exec php drush st --format=list drupal_version | cut -d '.' -f 1)

  if [[ "$drupal_version" -eq "" ]] || [[ "${drupal_version:0:1}" -eq "8" ]]; then
    docker-compose exec php bash -c "cd docroot && drush sql-dump --result-file --gzip --structure-tables-key=common"
  else
    docker-compose exec php drush sql-dump --result-file --gzip --structure-tables-key=common
  fi
}
