#!/bin/bash

#Terminate on error
set -e

USER_NAME=$(whoami)
USER_HOME=/home/$USER_NAME
USER_SOURCES=$USER_HOME/Documents/sources
INSTALLED=$USER_HOME/.installed

cd $USER_HOME

if [ -e $INSTALLED/tmux-2.7 ];
then
	echo "TMUX already installed."
else
  sudo apt-get install libevent-dev libncurses5-dev xclip automake build-essential pkg-config -y
  cd $USER_SOURCES

  wget -O tmux-2.7.tar.gz https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
  tar -xzvf tmux-2.7.tar.gz

  cd tmux-2.7

  ./configure && make

  sudo make install

  gem install --user-install tmuxinator
  echo "Ensure that gem bin ('~/.gem/ruby/2.3.1/bin') is in the path"

  echo "installed TMUX successfully."
  touch $INSTALLED/tmux-2.7
fi

