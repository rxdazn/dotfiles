HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd nomatch
setopt completealiases

bindkey -e
autoload -U colors && colors

# git autocompletion
autoload -Uz compinit && compinit

alias ls='ls -F'
alias la='ls -la'
alias ll='ls -l'
alias tmux='tmux -2'
alias ack='ack --pager="less -RXF"'

export TERM=screen

# fixes sed: RE error: illegal byte sequence on osx
#export LC_CTYPE=C 
#export LANG=C

# osx clang '-mno-fused-madd' unused argument error fix
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments


#
# PROMPT
#
 
function preexec() {
  timer=${SECONDS}
}
 
function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export JPROMPT="${GREEN}(${SGR_RST}%B%?%b|%j${GREEN})(${SGR_RST}${timer_show}s${GREEN})(${SGR_RST}%*${GREEN})${SGR_RST}"
    export RPROMPT="${JPROMPT}"
    #export RPROMPT="${JPROMPT}${PPROMPT}"
    unset timer
  fi
}
 
SGR_RST=$'%{\033[00m%}'
if [[ $UID != 0  ]]; then
    SGR_SET=$'%{\033[31m%}'
else
    SGR_SET=$'%{\033[34m%}'
fi
GREEN=$'%{\033[32m%}'
RED=$'%{\033[31m%}'
BLUE=$'%{\033[34m%}'
PROMPT="${GREEN}[${SGR_RST}%40<...<%~%<<${GREEN}]${SGR_RST}${GREEN}\$${SGR_RST} "
PPROMPT="${GREEN}[${SGR_RST}%40<...<%~%<<${GREEN}]${SGR_RST}"
#RPROMPT="${JPROMPT}${PPROMPT}"
RPROMPT="${JPROMPT}"

