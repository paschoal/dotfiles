export PATH="$PATH:$HOME/bin:$HOME/.rvm/bin"
export XDG_CONFIG_HOME="$HOME/.config"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Alias
alias ls='ls --color'
alias off='shutdown -h now'
alias rbt='shutdown -r now'
alias chrome="google-chrome-stable"

source "/data/repositories/zgen/zgen.zsh"
if ! zgen saved; then
  zgen oh-my-zsh
  zgen load zsh-users/zsh-syntax-highlighting
  zgen save
fi

# WTF?
eval $(thefuck --alias)
