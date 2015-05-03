#!/bin/bash

echo "Initializing and updating submodules"
git submodule init && git submodule update

echo "Installing symlinks"
FILES=('bash_aliases' 'bash_profile' 'tmux.conf' 'vimrc' 'vim')

for file in "${FILES[@]}"; do
    echo "Creating symlink for $file"
    if [ -e ~/".$file" ]; then
        echo "~/.$file exists already"
    else
        ln -s ~/dotfiles/$file ~/".$file"
    fi
    echo
done

echo "Done"
