# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set prompt to 'CWD$ '
PS1='\w\$ '

# Use colors for prompt
case "$TERM" in xterm-color|*-256color)
    PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export DISPLAY=:0

# Default Editor
if which nvim &> /dev/null; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:/home/ubuntu/.foundry/bin"
alias gg='go run scripts/scratch.go'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ubuntu/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ubuntu/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/ubuntu/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ubuntu/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/ubuntu/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/ubuntu/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

