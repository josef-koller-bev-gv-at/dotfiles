#!/bin/zsh
ln -s $(pwd -P)/$(dirname "$0")/_vim ~/.vim
git submodule init
git submodule update
