# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -lah --color=auto'
alias v='vim'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export GPG_TTY=$(tty)
export EDITOR=vim
export TZ=":America/Los_Angeles"
