export PATH="$PATH:$HOME/bin:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/paschoal/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Liquid Prompt Call
[[ $-=*i* ]] && source $HOME/.prompt

# Alias
alias ls='ls --color'
alias off='shutdown -h now'
alias rbt='shutdown -r now'

source "/data/repos/zgen/zgen.zsh"
if ! zgen saved; then
  zgen oh-my-zsh
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen save
fi
