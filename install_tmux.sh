#!/bin/bash

#Terminate on error
set -e

USER_NAME=$(whoami)
USER_HOME=/home/$USER_NAME
USER_SOURCES=$USER_HOME/Documents/sources
INSTALLED=$USER_HOME/.installed

readonly TMUX_VERSION="3.2"

cd $USER_HOME

if [ -e $INSTALLED/tmux-$TMUX_VERSION ];
then
	echo "TMUX already installed."
else
  sudo apt-get install libevent-dev libncurses-dev xclip build-essential bison pkg-config ruby -y
  cd $USER_SOURCES

  wget -O tmux-$TMUX_VERSION.tar.gz https://github.com/tmux/tmux/releases/download/$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz
  tar -xzvf tmux-$TMUX_VERSION.tar.gz

  cd tmux-$TMUX_VERSION

  ./configure && make

  sudo make install

  gem install --user-install tmuxinator
  echo "Ensure that gem bin ('~/.gem/ruby/2.7.0/bin') is in the path"
  echo "PATH=\"\${PATH}:${HOME}/.gem/ruby/2.7.0/bin\""

  echo "installed TMUX successfully."
  touch $INSTALLED/tmux-$TMUX_VERSION
fi
