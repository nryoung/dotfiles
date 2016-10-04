#!/bin/bash

echo "Installing symlinks"
FILES=('bash_aliases' 'bash_profile' 'tmux.conf' 'vimrc' 'vim' 'gitconfig' 'zshrc' 'eslintrc' 'tern-project')

for file in "${FILES[@]}"; do
    echo "Creating symlink for $file"
    if [ -e ~/".$file" ]; then
        echo "~/.$file exists already"
    else
        ln -s ~/dotfiles/$file ~/".$file"
    fi
    echo
done

echo "Installing symlinks for neovim"
if [ -e ~/.config/nvim ]; then
    echo "Nvim symlink exists already"
else
    ln -s ~/dotfiles/vim ~/.config/nvim
fi

if [ -e ~/.config/nvim/init.vim ]; then
    echo "Init.vim symlink exists already"
else
    ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
fi

echo "Done"
