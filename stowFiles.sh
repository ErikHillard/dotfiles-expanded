#!/bin/bash

SOURCE_PATH="${BASH_SOURCE[0]}"
DIRECTORY="$(dirname ${SOURCE_PATH})"
SEPERATOR="###########################"

pushd "${DIRECTORY}/home" &> /dev/null
echo "${SEPERATOR}"
echo "Linking home"
echo "${SEPERATOR}"
stow -Rv -t ~/ .
echo "${SEPERATOR}"
popd &> /dev/null

if [[ ! -d ~/.config ]]; then
  echo "Making ~/.config since it does not exist"
  mkdir -p ~/.config
fi
pushd "${DIRECTORY}/config" &> /dev/null
echo "${SEPERATOR}"
echo "Linking config"
echo "${SEPERATOR}"
stow -Rv -t ~/.config .
echo "${SEPERATOR}"
popd &> /dev/null
