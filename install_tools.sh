#!/bin/bash

#Terminate on error
set -e

USER_NAME=$USERNAME
USER_HOME=/home/$USER_NAME
USER_SOURCES=$USER_HOME/Documents/sources
INSTALLED=$USER_HOME/.installed

#### INSTALL TOOLS
cd $USER_HOME

#update rep list
sudo apt-get update

#init directory structure
mkdir $USER_SOURCES -p
mkdir $INSTALLED -p

cd $USER_HOME

#G++ build
sudo apt-get install libc-dev-bin libc6 libc6:i386 libc6-dev libcurl3 libglademm-2.4-1c2a libgtkmm-2.4-1c2a cmake g++-4.7 build-essential glibc-doc glibc-doc valgrind locales python-dev -y

#GIT
if [ -e $INSTALLED/git-2.3.1 ];
then
	echo "GIT already installed."
else
	#Prerequisites
	sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev -y

	#load source and install
	cd $USER_SOURCES
  wget https://github.com/git/git/archive/v2.3.1.tar.gz
  tar -xf v2.3.1.tar.gz
  cd git-2.3.1
  ./configure
  make
  sudo make install

  echo "installed GIT successfully"
  touch $INSTALLED/git-2.3.1
fi

#ZSH
if [ -e $INSTALLED/oh-my-zsh ];
then
  echo "ZSH already installed."
else
  sudo apt-get install zsh -y
  chsh -s /bin/zsh $USER_NAME
  sudo apt-get install curl -y
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

  echo "installed ZSH successfully"
  touch $INSTALLED/oh-my-zsh
fi

#VIM
if [ -e $INSTALLED/vim ];
then
  echo "VIM already installed."
else
  cd $USER_SOURCES
  git clone --depth 1 https://github.com/b4winckler/vim.git
  sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev exuberant-ctags ack-grep libpython2.7-dev -y
  cd vim
  cd src
  make distclean
  ./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp
  make -j 12
  sudo make install

  echo "installed VIM successfully"
  touch $INSTALLED/vim
fi

#Dotfiles
if [ -e $INSTALLED/dotfiles ];
then
  echo "Dotfiles already installed."
else
  sudo apt-get install libclang-3.5-dev clang-format-3.5 -y
  cd $USER_SOURCES
  git clone https://github.com/Christof/dotfiles
  cd dotfiles
  ./install.sh
  #TODO user specific files

  echo "installed Dotfiles successfully."
  touch $INSTALLED/dotfiles
fi
