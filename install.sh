#!/bin/bash

cd "$(dirname "$0")"

function create-alias() {
if [ ! -e "$2" ]; then
  ln -s $(pwd -P)/$(dirname "$0")/$1 $2
else
  read -r -e -p "File '$2' already exists. Would you like to overwrite it with a symbolic link? [y/n] "
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    ln -f -s $(pwd -P)/$(dirname "$0")/$1 $2
  fi
fi
}

$(create-alias vim ~/.vim)
git submodule init
git submodule update

$(create-alias zshrc ~/.zshrc)
$(create-alias tmux.conf ~/.tmux.conf)
$(create-alias gitconfig ~/.gitconfig)
$(create-alias gitignore ~/.gitignore)
$(create-alias vscode-settings.json ~/.config/Code/User/settings.json)
$(create-alias vscode-keybindings.json ~/.config/Code/User/keybindings.json)
$(create-alias vscode-snippets ~/.config/Code/User/snippets)
