#!/bin/bash

SOURCE_PATH="${BASH_SOURCE[0]}"
DIRECTORY="$(dirname ${SOURCE_PATH})"

pushd "${DIRECTORY}/home" &> /dev/null
stow -Rv -t ~/ .
popd &> /dev/null

if [[ ! -d ~/.config ]]; then
  echo "Making ~/.config since it does not exist"
  mkdir -p ~/.config
fi
pushd "${DIRECTORY}/config" &> /dev/null
stow -Rv -t ~/.config .
popd &> /dev/null
