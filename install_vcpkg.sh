#!/bin/bash

git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
./vcpkg integrate install

echo "export VCPKG_ROOT=/home/$USER/Documents/vcpkg" >> /home/$USER/.zshrc.user
echo "export VCPKG_INSTALLED_DIR=/home/$USER/Documents/vcpkg/installed/x64-linux" >> /home/$USER/.zshrc.user
echo "export PATH=$PATH:/home/$USER/Documents/vcpkg" >> /home/$USER/.zshrc.user
