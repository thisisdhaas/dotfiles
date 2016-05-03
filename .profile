shopt -s globstar
shopt -s extglob

# play with my path.
export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/texbin:$PATH

# set editor to avoid the dreaded vim
export EDITOR='emacs -nw'

# set up virtualenv
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

# Highlighting the way I like it
export GREP_OPTIONS='--color=auto'
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Aliases to fix airplay when it goes nuts.
alias fixairplay="sudo launchctl unload /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist; sudo launchctl load /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"
alias fixairplayaudio="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"

# Aliases to control databases on OSX because I always forget
alias pg_start="pg_ctl -D /usr/local/var/postgres/ -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres/ -l /usr/local/var/postgres/server.log stop"
alias pg_status="pg_ctl -D /usr/local/var/postgres/ status"
alias mysql_start="mysql.server start"
alias mysql_stop="mysql.server stop"
alias mysql_status="mysql.server status"

# Eliminate evil java SCDynamicStore warnings
export _JAVA_OPTIONS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc= -Djava.security.krb5.conf=/dev/null"


# git autocomplete
source ~/.git-completion.bash

# use sublime to edit git commit messages/rebases/etc.
export GIT_EDITOR="subl --wait --new-window"

# Add some helpful aliases
alias em='emacs -nw'
alias split='gsplit'
alias gst='git status'
alias gcm='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gb='git branch'

# rsync made easy because I'll never remember otherwise.
function rs() {
rsync --verbose --progress --stats --compress --rsh=/usr/bin/ssh --recursive --times --perms --links --delete ${@:3} $1 $2
}

# alias for opening files quickly
function osf() {
  em **/"$*"*.@(java|scala|cpp|hpp|cc|h)
}

# alias for ssh'ing with pki efficiently to my ec2 machines
function sshi() {
    ssh -i "$HOME/.ssh/aws/experiments/$1.pem" $2@$3
}

# Convenience function for running long background jobs
function runlong() {
    nargs=`expr "$#" - 1`
    for last; do : ; done
    nohup stdbuf -oL "${@:1:$nargs}" 2>&1 >"${last}" &
}

# Run autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Make bash history reasonable
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth

# Make sure ssh-agent is running
# SSH_ENV="$HOME/.ssh/environment"

# function start_agent {
#      echo "Initialising new SSH agent..."
#      /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#      echo succeeded
#      chmod 600 "${SSH_ENV}"
#      . "${SSH_ENV}" > /dev/null
#      /usr/bin/ssh-add;
# }

# # Source SSH settings, if applicable

# if [ -f "${SSH_ENV}" ]; then
#      . "${SSH_ENV}" > /dev/null
#      #ps ${SSH_AGENT_PID} doesn't work under cywgin
#      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#          start_agent;
#      }
# else
#      start_agent;
# fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Docker setup
eval "$(docker-machine env ul-vm)"
