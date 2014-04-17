#!/bin/zsh

function create-alias() {
if [ ! -f "$2" ]; then
  ln -s $(pwd -P)/$(dirname "$0")/$1 $2
fi
}

$(create-alias _vim ~/.vim)
git submodule init
git submodule update

$(create-alias _tmux.conf ~/.tmux.conf)
$(create-alias gitconfig ~/.gitconfig)
$(create-alias gitignore ~/.gitignore)
