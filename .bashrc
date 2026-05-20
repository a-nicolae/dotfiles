# ~/.bashrc — personal dotfiles

export EDITOR=vim
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups

# Coloured prompt: user@host:dir $
PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '

# Aliases
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -20'
alias k='kubectl'
alias kns='kubectl config set-context --current --namespace'

# Switch namespace: kuns <namespace>
kuns() { kubectl config set-context --current --namespace="$1"; }

# Load bash completions if available
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
