#!/bin/bash

#Terminate on error
set -e

USER_NAME=$USERNAME
USER_HOME=/home/$USER_NAME
USER_SOURCES=$USER_HOME/Documents/sources
INSTALLED=$USER_HOME/.installed

cd $USER_HOME

if [ -e $INSTALLED/ruby-2.2.1 ];
then
  echo "Ruby already installed."
else
  cd $USER_SOURCES

  wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
  tar -xzvf ruby-install-0.6.0.tar.gz
  cd ruby-install-0.6.0/
  sudo make install

  sudo -E ruby-install -i /usr/local/ ruby 2.2.1

  echo "installed Ruby successfully."
  touch $INSTALLED/ruby-2.2.1
fi

if [ -e $INSTALLED/tmux-2.1 ];
then
	echo "TMUX already installed."
else
  sudo apt-get install libevent-dev xclip -y
  cd $USER_SOURCES
  wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
  tar -xvf tmux-2.1.tar.gz

  cd tmux-*
  ./configure
  make -j 12
  sudo make install

  gem install --user-install tmuxinator
  echo "Ensure that gem bin ('~/.gem/ruby/2.2.1/bin') is in the path"

  echo "installed TMUX successfully."
  touch $INSTALLED/tmux-2.1
fi

