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
[[ $-=*i* ]] && source /home/paschoal/.prompt

# Alias
alias ls='ls --color'
alias off='shutdown -h now'
alias rbt='shutdown -r now'
