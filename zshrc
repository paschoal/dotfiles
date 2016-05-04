export PATH="$PATH:$HOME/bin:$HOME/.rvm/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export DOT_FILES="/data/repositories/dotfiles"

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
alias ls='ls --color'
alias off='shutdown -h now'
alias rbt='shutdown -r now'
alias vim='nvim'

#
# Zsh using Vim keybinds / behaviour
#
bindkey -v
export KEYTIMEOUT=1

#
# Load Zgen
# 
[[ $- = *i* ]] && source $DOT_FILES/zgen/zgen.zsh
if ! zgen saved; then
  zgen oh-my-zsh
  zgen load zsh-users/zsh-syntax-highlighting
  zgen save
fi
#
# Load Liquid Prompt
#
[[ $- = *i* ]] && source $DOT_FILES/liquidprompt/liquidprompt
