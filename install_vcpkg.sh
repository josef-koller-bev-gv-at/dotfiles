#!/bin/bash

git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
./vcpkg integrate install

echo "export VCPKG_ROOT=$USER_DOCUMENTS/vcpkg" >> /home/$USER/.zshrc.user
echo "export PATH=$PATH:$USER_DOCUMENTS/vcpkg" >> /home/$USER/.zshrc.user

