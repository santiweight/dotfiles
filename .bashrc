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
