# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions z)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='mvim'

# ~/bin
export PATH=$HOME/bin:$PATH

# rbenv
eval "$(rbenv init -)"
export PATH="$PATH:$HOME/.rbenv/versions/2.7.6/bin/"

# rmm
function rmm () {
  # Step 1: move all node_modules folder (recurrsively) to node_modules_rm
  find . -name "${1:=node_modules}" -type d -prune -exec mv '{}' '{}_rm' ";"
  # Step 2: remove all node_modules_rm folders
  find . -name "${1:=node_modules}_rm" -type d -prune -exec rm -rf '{}' + &
}

function fv() {
  cd "$(find $HOME/Projects -type d | fzf)"
  nvim
}

function ff() {
  cd "$(find $HOME/Projects -type d | fzf)"
}
