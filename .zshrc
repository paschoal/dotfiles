export XDG_DESKTOP_DIR="$HOME"
export XDG_DOWNLOAD_DIR="$HOME/download"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH:$HOME/bin"
export DOT_FILES="/data/repositories/dotfiles"

export JVM_ARGS="$JVM_ARGS -Dawt.useSystemAAFontSettings=lcd"
export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.controlFont=Hack-13"
export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.systemFont=Hack-13"
export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.userFont=Hack-13"
export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.smallFont=Hack-13"
export JVM_ARGS="$JVM_ARGS -Djsyntaxtextarea.font.family=Hack"

#
# Default new install configurations
#
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep

#
# Disable capslock
#
setxkbmap -option caps:none

#
# Alias
#
alias cat='bat'
alias ls='ls --color'
alias off='shutdown -h now'
alias rbt='shutdown -r now'
alias vim='nvim'
alias dps='docker ps -a --format "{{.ID}}  {{.Names}}|{{.Image}}   →   {{.Status}}"'
alias dpi='docker images'
alias dex='docker exec -it'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias kcat='kafkacat'
alias screenshot='flameshot gui -p ~/downloads'
alias notes='vim ~/.notes'
alias copy='wl-copy'
alias paste='wl-paste'

#
# Zsh using Vim keybinds / behaviour
#
bindkey -v
export KEYTIMEOUT=1

#
# Load Zgen
# 
[[ $- = *i* ]] && source $DOT_FILES/.zgen/zgen.zsh
if ! zgen saved; then
  zgen oh-my-zsh
  zgen load zsh-users/zsh-syntax-highlighting
  zgen save
fi
#
# Load Liquid Prompt
#
[[ $- = *i* ]] && source $DOT_FILES/.liquidprompt/liquidprompt

#
# Time with Memory
#
TIMEFMT="%J -- %U user | %S system | %P cpu | %*E total | memory %M MB"

#
# SSH-Agent
#
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > ~/.ssh-agent
fi

if [[ "$SSH_AGENT_PID" == "" ]]; then
  eval "$(<~/.ssh-agent)"
  ssh-add ~/.ssh/id_rsa.videri > /dev/null
fi
