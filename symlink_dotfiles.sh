#!/bin/bash

UNAME="$(uname)"
case "${UNAME}" in
    Linux*)     USER_DIR="/home/$USER";;
    Darwin*)    USER_DIR="/Users/$USER";;
    *)          echo "Unknown Machine Type"; exit 1;;
esac

WORKING_DIR=$(pwd)

# each file to symlink with the path of where to symlink it
FILES_TO_SYMLINK=(
    "$WORKING_DIR/.emacs.d/init.el" "$USER_DIR/.emacs.d/init.el"
    "$WORKING_DIR/.emacs.d/opam-user-setup.el" "$USER_DIR/.emacs.d/opam-user-setup.el"
    "$WORKING_DIR/.tmux.conf" "$USER_DIR/.tmux.conf"
    "$WORKING_DIR/.vimrc" "$USER_DIR/.vimrc"
)

COUNT=${#FILES_TO_SYMLINK[@]}
for ((i=0; i<$COUNT; i+=2))
do
   SOURCE=${FILES_TO_SYMLINK[i]}
   DEST=${FILES_TO_SYMLINK[$((i + 1))]}
   echo Linking $SOURCE - $DEST
   ln -si $SOURCE $DEST
done
