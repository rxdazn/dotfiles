HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd nomatch
setopt completealiases

bindkey -e
autoload -U colors && colors

# git autocompletion
autoload -Uz compinit && compinit

alias ls='ls -FG'
alias la='ls -la'
alias ll='ls -l'
alias tmux='tmux -2'
alias ag='ag --pager="less -RXF"'

export TERM=screen

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
RPROMPT="${JPROMPT}"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
