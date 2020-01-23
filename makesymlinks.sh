#!/bin/bash
############################
# .make.sh
# This script creates symlinks from ~/dotfiles to home directory
############################

########## Variables

dotfilesdir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="zshrc tmux.conf"    # list of files/folders to symlink in homedir
nvimdir=~/.config/nvim

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dotfilesdir directory ..."
cd $dotfilesdir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file $olddir
	echo "Creating symlink to $file in home directory."
	ln -s $dotfilesdir/$file ~/.$file
done

# Copying nvim init to .config
echo "Moving old init.vim to dotfiles_old"
mv $nvimdir/init.vim $olddir
echo "Creating init.vim symlink"
ln -s $dotfilesdir/init.vim $nvimdir/init.vim
