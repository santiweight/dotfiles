#!/bin/bash
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=/Users/santi/.virtualenvsexport 
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/dotfiles/vim/vimrc.vim'  # Note the . (dot) before vimrc. If that is what you have called it.
PROJECT_HOME=/Users/santi/Develsource /usr/local/bin/virtualenvwrapper.sh

PS1='\w\$ '
[ -z "$PS1" ] && return
function cd {
    builtin cd "$@" && ls -aF
    }
function dc {
    builtin cd "$@"
}

## navigation optimizations ##
alias ..='cd ..'
alias ...='cd ...'

if [[ "$OSTYPE" == "darwin"* ]]; then
    ## Colorize the ls output ##
    alias OS='darwin'
    alias ls='ls -G'
    alias lsa='ls -a'
    alias lsal='ls -la'
    alias ll='ls -la'
    alias l.='ls -d .* -G'
elif [[ "$OSTYPE" == "win32" ]]; then
    alias ls='ls --color=auto'
    alias lsa='ls -a'
    alias lsl='ls -l'
    alias lsal='ls -al'
    alias ll='ls -al'
    alias l.='ls -d .* --color=auto'
fi
    
alias apt-get='sudo apt-get'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias .emacs='~/dotfiles/.emacs.d/init.el'
alias c='clear'

export PATH="/usr/local/sbin:$PATH"
export TERM=xterm-256color
