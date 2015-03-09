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

  wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
  tar -xzvf ruby-install-0.5.0.tar.gz
  cd ruby-install-0.5.0/
  sudo make install

  sudo -E ruby-install -i /usr/local/ ruby 2.2.1

  echo "installed Ruby successfully."
  touch $INSTALLED/ruby-2.2.1
fi

if [ -e $INSTALLED/tmux-1.9a ];
then
	echo "TMUX already installed."
else
  sudo apt-get install libevent-dev xclip -y
  cd $USER_SOURCES
  wget http://netcologne.dl.sourceforge.net/project/tmux/tmux/tmux-1.9/tmux-1.9a.tar.gz
  tar -xvf tmux-1.9a.tar.gz

  cd tmux-1.9a
  ./configure
  make -j 12
  sudo make install

  gem install --user-install tmuxinator
  echo "Ensure that gem bin ('~/.gem/ruby/2.2.1/bin') is in the path"

  echo "installed TMUX successfully."
  touch $INSTALLED/tmux-1.9a
fi

