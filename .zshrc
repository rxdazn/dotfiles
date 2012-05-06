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

export EDITOR=vim

export PS1="%n@%B%m%b%:%~$"

alias ls='ls --color=auto -F'
alias la='ls -la'
alias ll='ls -l'
alias emacs='emacs -nw'
alias feh='feh -q'
alias scrot='scrot -q 100 -d 5 -c'
