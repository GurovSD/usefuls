#-------------------------#
#ZSH settings and hotkeys #
#-------------------------#
function ls_all() {
  ls -la
  zle reset-prompt
}
zle -N ls_all
bindkey "^l" ls_all
#--------------------#


#-------------#
# NPM scripts #
#-------------#
alias nrd="npm run dev"
. "$HOME/.local/bin/env"
#--------------------#

#--------------#
# infra srcips #
#--------------#
alias colim="colima start --arch aarch64 --cpu 4 --memory 8"
alias colii="colima start --arch x86_64 --cpu 4 --memory 8"
#--------------------#

#------------------#
# base GIT scripts #
#------------------#
alias gib="git branch"
alias gichm="git checkout main"
alias gich='(){ git checkout $1 ;}'

alias gichb='(){ git checkout -b $1 ;}'
alias gichbf='(){ git checkout -b feature-$1 ;}'
alias gichbmf='(){ git checkout main; git pull; git checkout -b feature-$1 ;}'

alias gium="git checkout main && git pull"
alias girm="git rebase main"

alias giadc='(){ git add . && git commit -m $1 ;}'

alias gicam="git commit --amend"
alias gips="git push"

alias gibrdl='git_delete_branches_from_list'
alias giurm='git_update_main_and_rebase'
#--------------------#


#---------------#
# GIT functions #
#---------------#
git_delete_branches_from_list() {
  echo "Paste branch names, one per line, then press Ctrl+D when done:"
  while IFS= read -r line; do
    # trim whitespace
    local branch="${line#"${line%%[![:space:]]*}"}"
    branch="${branch%"${branch##*[![:space:]]}"}"

    [[ -z "$branch" ]] && continue

    git branch -d "$branch" 2>/dev/null || git branch -D "$branch"
  done
}

git_update_main_and_rebase() {
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
  git checkout main;
  git pull;
  git checkout $BRANCH_NAME;
  git rebase main;
}
#--------------------#
