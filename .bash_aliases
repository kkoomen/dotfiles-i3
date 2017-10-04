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
alias ddrush='docker-compose exec php drush'

function ddrush-sqldump {
  docker-compose exec php drush sql-dump --result-file --gzip --structure-tables-key=common
}
