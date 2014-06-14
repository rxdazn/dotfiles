HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd nomatch
setopt completealiases

bindkey -e
zstyle :compinstall filename '/home/rxdazn/.zshrc'
autoload -Uz compinit
autoload -U colors && colors
compinit

# environment variables export EDITOR=vim export PS1="%n@%B%m%b%:%~$"
# - python
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME # Tell pip to create its virtualenvs in $WORKON_HOME.
export PIP_RESPECT_VIRTUALENV=true # Tell pip to automatically use the currently active virtualenv.
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# - go
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/.scripts

#- powerline shell
function powerline_precmd() {
  export PS1="$(~/.scripts/powerline-shell.py --mode=flat $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

alias ls='ls -F'
alias la='ls -la'
alias ll='ls -l'
alias emacs='emacs -nw'
alias feh='feh -q'
alias scrot='scrot -d 5 -c'
alias tmux='tmux -2'
alias ack='ack --pager="less -RXF"'
alias init-ixc-django='setup_django_site.py'

export TERM=screen-256color-bce

# fixes sed: RE error: illegal byte sequence on osx
export LC_CTYPE=C 
export LANG=C

# osx clang '-mno-fused-madd' unused argument error fix
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
