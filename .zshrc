function ls_all() {
  ls -la
  zle reset-prompt
}
zle -N ls_all

bindkey "^l" ls_all

# ZSH scripts

# GIT scripts
alias gib="git branch"
alias gichm="git checkout main"
alias gich='(){ git checkout $1 ;}'
alias gichb='(){ git checkout -b $1 ;}'
alias gichbf='(){ git checkout -b feature-$1 ;}'

alias gium="git checkout main && git pull"

alias girm="git rebase main"

#NPM scripts
alias nrd="npm run dev"
