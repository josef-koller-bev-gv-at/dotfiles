#!/bin/bash

USER_DOCUMENTS=/home/$USER/Documents
#vcpkg
if [ -e $USER_DOCUMENTS/vcpkg ];
then
  echo "Vcpkg already installed."
else
  cd $USER_DOCUMENTS/Documents
  git clone https://github.com/Microsoft/vcpkg.git
  cd vcpkg
  ./bootstrap-vcpkg.sh
  ./vcpkg integrate install

  echo "installed vcpkg successfully."
fi
