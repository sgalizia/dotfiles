#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/workspace/dotfiles

# == Variables ==

# dotfiles directory
dir=~/workspace/dotfiles

# backup of old dotfiles
olddir=~/dotfiles_old

# list of files/folders to symlink in the home directory
files=".zshrc .config .gitconfig .tmux.conf"

# ==================

# create dotfiles_old dir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/workspace/dotfiles directory
# specified in $files
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory"
  ln -s $dir/$file ~/$file
done
