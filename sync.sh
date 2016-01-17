#!/bin/bash

echo "Installing symlinks"
FILES=('bash_aliases' 'bash_profile' 'tmux.conf' 'vimrc' 'vim' 'gitconfig' 'zshrc' 'eslintrc')

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
