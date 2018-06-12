#!/bin/zsh

#Terminate on error
set -e

USER_NAME=$(whoami)
USER_HOME=/home/$USER_NAME
USER_SOURCES=$USER_HOME/Documents/sources
INSTALLED=$USER_HOME/.installed

#oh-my-zsh
if [ -e $INSTALLED/oh-my-zsh ];
then
  echo "oh-my-zsh already installed."
else
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  source ~/.oh-my-zsh/oh-my-zsh.sh
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

  echo "installed ZSH successfully"
  touch $INSTALLED/oh-my-zsh
fi
