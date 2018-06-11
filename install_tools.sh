#!/bin/bash

#Terminate on error
set -e

USER_NAME=$(whoami)
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
sudo apt-get install libc-dev-bin libc6 libc6:i386 libc6-dev libcurl3 libglademm-2.4-1v5 libgtkmm-2.4-1v5 cmake g++ build-essential glibc-doc glibc-doc valgrind locales python-dev libboost-all-dev -y

#GIT
if [ -e $INSTALLED/git-2.17.0 ];
then
  echo "GIT already installed."
else
  #Prerequisites
  sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev autoconf -y

  #load source and install
  cd $USER_SOURCES
  wget https://github.com/git/git/archive/v2.17.0.tar.gz
  tar -xf v2.17.0.tar.gz
  cd git-2.17.0
  make configure
  ./configure
  make
  sudo make install
  cd contrib/diff-highlight
  make
  sudo cp diff-highlight /usr/local/bin
  sudo chmod +x /usr/local/bin/diff-highlight

  echo "installed GIT successfully"
  touch $INSTALLED/git-2.17.0
fi

#GIT-LFS
if [ -e $INSTALLED/git-lfs-package ];
then
  echo "GIT already installed."
else
  if [ -e $INSTALLED/git-lfs-1.4.4 ];
  then
    sudo rm -f /usr/local/bin/git-lfs
    rm $INSTALLED/git-lfs-1.4.4
  fi

  #load source and install
  curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo -E bash

  sudo apt-get install git-lfs -y

  git lfs install

  echo "installed GIT-LFS successfully"
  touch $INSTALLED/git-lfs-package
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
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

  echo "installed ZSH successfully"
  touch $INSTALLED/oh-my-zsh
fi

#VIM
if [ -e $INSTALLED/vim ];
then
  echo "VIM already installed."
else
  cd $USER_SOURCES
  git clone --depth 1 https://github.com/vim/vim.git
  sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev exuberant-ctags ack-grep libpython2.7-dev -y
  cd vim
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
  sudo apt-get install libclang-3.8-dev clang-format-3.8 -y
  # Create symbolic link because the vim config expects a clang-format
  if [ ! -f /usr/bin/clang-format ];
  then
    sudo ln -s /usr/bin/clang-format-3.8 /usr/bin/clang-format
  fi

  cd $USER_SOURCES
  git clone https://github.com/Christof/dotfiles
  cd dotfiles
  ./install.sh
  #TODO user specific files

  echo "installed Dotfiles successfully."
  touch $INSTALLED/dotfiles
fi
