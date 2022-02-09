#!/usr/bin/env bash

symlink() {
    # A symlink function that makes sure the target symlink's parent path
    # exists.

    # Expand ~ to $HOME if present
    local source="${1/#\~/$HOME}"
    local target="${2/#\~/$HOME}"

    [[ -e ${target} ]] && echo "'${target}' exists, skipping" && return

    mkdir -p "$(dirname ${target})"
    ln -s "${source}" "${target}"
}

install_prereqs() {
  # check to see if brew is installed. Install it if it isn't already
  if ! which brew &> /dev/null; then
    echo 'Installing `brew` package manager: https://brew.sh/'
    echo 'Requires user password'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install packages
  echo "Installing packages with brew"
  brew install \
      neovim \
      tmux \
      fzf \
      ripgrep \
      z \
      ranger \
      cmake \
      gcc \
      gh
  brew install --cask rectangle

  # Install zsh and config
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  # add fzf goodies
  $(brew --prefix)/opt/fzf/install

  # Install hammerspoon and ControlEscape spoon
  mkdir -p ~/.hammerspoon/Spoons
  git clone https://github.com/jasonrudolph/ControlEscape.spoon.git ~/.hammerspoon/Spoons/ControlEscape.spoon
  cd ~/.hammerspoon/Spoons/ControlEscape.spoon
  script/setup
}

link_files() {
    local readonly dotfiles="${HOME}/dotfiles"

    # sync all the things
    symlink "${dotfiles}/bash_aliases" ~/.bash_aliases
    symlink "${dotfiles}/bash_profile" ~/.bash_profile
    symlink "${dotfiles}/tmux.conf" ~/.tmux.conf
    symlink "${dotfiles}/nvim" ~/.config/nvim
    symlink "${dotfiles}/zshrc" ~/.zshrc
    symlink "${dotfiles}/gitconfig" ~/.gitconfig
}

init() {
  install_prereqs
  link_files
}

init
