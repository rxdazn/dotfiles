HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd nomatch
setopt completealiases

# rxvt
bindkey "\e[3~" delete-char         # Delete
bindkey "^[[7~" beginning-of-line   # Home
bindkey "^[[8~" end-of-line         # End

bindkey -e
zstyle :compinstall filename '/home/rxdazn/.zshrc'
autoload -Uz compinit
autoload -U colors && colors
compinit

# environment variables
export EDITOR=vim
export PS1="%n@%B%m%b%:%~$"
# - python
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
source /usr/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME # Tell pip to create its virtualenvs in $WORKON_HOME.
export PIP_RESPECT_VIRTUALENV=true # Tell pip to automatically use the currently active virtualenv.

alias ls='ls --color=auto -F'
alias la='ls -la'
alias ll='ls -l'
alias emacs='emacs -nw'
alias feh='feh -q'
alias scrot='scrot -d 5 -c'
