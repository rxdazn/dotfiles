HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd nomatch
setopt completealiases

bindkey -e
autoload -U colors && colors

# git autocompletion
autoload -Uz compinit && compinit

case "$OSTYPE" in
  darwin*)
    # ls --F enables color output
    # BSD ls --G enables color output
    alias ls='ls -FG'
  ;;
  linux*)
    # GNU ls --G omits group names from -l output which is unwanted
    alias ls='ls -F --color'
  ;;
esac
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
    export JPROMPT="${HLCOLOR}(${SGR_RST}%B%?%b|%j${HLCOLOR})(${SGR_RST}${timer_show}s${HLCOLOR})(${SGR_RST}%*${HLCOLOR})${SGR_RST}"
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

case "$OSTYPE" in
  darwin*)
    HLCOLOR=$GREEN
  ;;
  linux*)
    HLCOLOR=$RED
  ;;
esac

PROMPT="${HLCOLOR}[${SGR_RST}%40<...<%~%<<${HLCOLOR}]${SGR_RST}${HLCOLOR}\$${SGR_RST} "
PPROMPT="${HLCOLOR}[${SGR_RST}%40<...<%~%<<${HLCOLOR}]${SGR_RST}"
RPROMPT="${JPROMPT}"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
