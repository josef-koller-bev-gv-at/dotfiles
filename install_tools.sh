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
sudo apt-get install libc-dev-bin libc6 libc6:i386 libc6-dev libglademm-2.4-1v5 libgtkmm-2.4-1v5 cmake g++ build-essential glibc-doc glibc-doc valgrind locales python-dev libboost-all-dev curl -y

#GIT

readonly GIT_VERSION="2.27.0"
readonly git_contrib_dir=$(readlink -f $USER_SOURCES/git-$GIT_VERSION/contrib)

if [ -e $INSTALLED/git-$GIT_VERSION ]; then
  echo "GIT already installed."
else
  #Prerequisites
  sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev autoconf libsecret-1-dev -y

  #load source and install
  cd $USER_SOURCES
  wget https://github.com/git/git/archive/v$GIT_VERSION.tar.gz
  tar -xf v$GIT_VERSION.tar.gz
  cd git-$GIT_VERSION
  make configure
  ./configure
  make
  sudo make install

  function install_git_bin() {
    local git_binary_dir=$git_contrib_dir/$1
    local git_binary_path=$git_binary_dir/$2
    rm -f $git_binary_path
    make -C $git_binary_dir
    sudo cp $git_binary_path /usr/local/bin
  }

  function install_git_contrib() {
    install_git_bin $1 $1
  }


  function install_git_credential() {
    install_git_bin "credential/$1" "git-credential-$1"
  }

  install_git_contrib diff-highlight
  install_git_credential libsecret

  echo "installed GIT successfully"
  touch $INSTALLED/git-$GIT_VERSION
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

#ZSH
if [ -e $INSTALLED/zsh ];
then
  echo "ZSH already installed."
else
  sudo apt-get install zsh -y
  chsh -s $(which zsh) $USER_NAME

  echo "installed ZSH successfully"
  touch $INSTALLED/zsh
fi

#oh-my-zsh
if [ -e $INSTALLED/oh-my-zsh ];
then
  echo "oh-my-zsh already installed."
else
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  zsh -i -c 'git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions'

  echo "installed ZSH successfully"
  touch $INSTALLED/oh-my-zsh
fi

#Dotfiles
if [ -e $INSTALLED/dotfiles ];
then
  echo "Dotfiles already installed."
else
  sudo apt-get install libclang-dev clang-format -y
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

#VCPKG
if [ -e $USER_SOURCES/vcpkg ];
then
  echo "Vcpkg already installed."
else
  cd $USER_SOURCES

  while true; do
    read -p "Do you want to install vcpkg?[y/n]" yn
    case $yn in
      [Yy]* ) $USER_SOURCES/dotfiles/install_vcpkg.sh; break;;
      [Nn]* ) exit;;
    esac
  done

  echo "installed vcpkg successfully."
fi
