#!/bin/bash

readonly current_dir=$(dirname $(readlink -f $0))
readonly sources_dir=$(readlink -f $current_dir/..)
readonly vcpkg_dir=$sources_dir/vcpkg
readonly zshrc_path=$(readlink -f ~/.zshrc.user)

git clone https://github.com/Microsoft/vcpkg.git $vcpkg_dir

cd $vcpkg_dir
./bootstrap-vcpkg.sh
./vcpkg integrate install

echo "export VCPKG_ROOT=$vcpkg_dir" >> $zshrc_path
echo "export VCPKG_INSTALLED_DIR=$vcpkg_dir/installed/x64-linux" >> $zshrc_path
echo "export PATH=$PATH:$vcpkg_dir" >> $zshrc_path
